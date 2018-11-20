import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';
import 'package:MyUnifyMobile/ui/task/task_screen.dart';
import 'package:MyUnifyMobile/data/models/models.dart';
import 'package:MyUnifyMobile/redux/task/task_actions.dart';
import 'package:MyUnifyMobile/redux/ui/ui_actions.dart';
import 'package:MyUnifyMobile/ui/task/edit/task_edit_vm.dart';
import 'package:MyUnifyMobile/ui/task/view/task_view_vm.dart';
import 'package:MyUnifyMobile/redux/app/app_state.dart';
import 'package:MyUnifyMobile/data/repositories/task_repository.dart';

List<Middleware<AppState>> createStoreTasksMiddleware([
  TaskRepository repository = const TaskRepository(),
]) {
  final viewTaskList = _viewTaskList();
  final viewTask = _viewTask();
  final editTask = _editTask();
  final loadTasks = _loadTasks(repository);
  final saveTask = _saveTask(repository);
  final deleteTask = _deleteTask(repository);

  return [
    TypedMiddleware<AppState, ViewTaskList>(viewTaskList),
    TypedMiddleware<AppState, ViewTask>(viewTask),
    TypedMiddleware<AppState, EditTask>(editTask),
    TypedMiddleware<AppState, LoadTasks>(loadTasks),
    TypedMiddleware<AppState, SaveTaskRequest>(saveTask),
    TypedMiddleware<AppState, DeleteTaskRequest>(deleteTask),
  ];
}

Middleware<AppState> _viewTaskList() {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    store.dispatch(UpdateCurrentRoute(TaskScreen.route));
    Navigator.of(action.context).pushReplacementNamed(TaskScreen.route);
  };
}

Middleware<AppState> _viewTask() {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    store.dispatch(UpdateCurrentRoute(TaskViewScreen.route));
    Navigator.of(action.context).pushNamed(TaskViewScreen.route);
  };
}

Middleware<AppState> _editTask() {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    store.dispatch(UpdateCurrentRoute(TaskEditScreen.route));
    Navigator.of(action.context).pushNamed(TaskEditScreen.route);
  };
}

Middleware<AppState> _deleteTask(TaskRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    var origTask = store.state.taskState.map[action.taskId];
    repository
        .saveData(store.state.authState, origTask, EntityAction.delete)
        .then((task) {
      store.dispatch(DeleteTaskSuccess(task));
      if (action.completer != null) {
        action.completer.complete(null);
      }
    }).catchError((error) {
      print(error);
      store.dispatch(DeleteTaskFailure(origTask));
    });

    next(action);
  };
}

Middleware<AppState> _saveTask(TaskRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.saveData(store.state.authState, action.task).then((task) {
      if (action.task.isNew) {
        store.dispatch(AddTaskSuccess(task));
      } else {
        store.dispatch(SaveTaskSuccess(task));
      }
      action.completer.complete(null);
    }).catchError((error) {
      print(error);
      store.dispatch(SaveTaskFailure(error));
    });

    next(action);
  };
}

Middleware<AppState> _loadTasks(TaskRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    AppState state = store.state;

    if (!state.taskState.isStale && !action.force) {
      next(action);
      return;
    }

    if (state.isLoading) {
      next(action);
      return;
    }

    store.dispatch(LoadTasksRequest());
    repository.loadList(state.authState).then((data) {
      store.dispatch(LoadTasksSuccess(data));

      if (action.completer != null) {
        action.completer.complete(null);
      }
    }).catchError((error) {
      print(error);
      store.dispatch(LoadTasksFailure(error));
    });

    next(action);
  };
}
