import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:MyUnifyMobile/redux/ui/ui_actions.dart';
import 'package:MyUnifyMobile/ui/task/task_screen.dart';
import 'package:redux/redux.dart';
import 'package:MyUnifyMobile/redux/task/task_actions.dart';
import 'package:MyUnifyMobile/data/models/task_model.dart';
import 'package:MyUnifyMobile/ui/task/edit/task_edit.dart';
import 'package:MyUnifyMobile/redux/app/app_state.dart';
import 'package:MyUnifyMobile/ui/app/icon_message.dart';

class TaskEditScreen extends StatelessWidget {
  static final String route = '/task/edit';
  TaskEditScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TaskEditVM>(
      converter: (Store<AppState> store) {
        return TaskEditVM.fromStore(store);
      },
      builder: (context, vm) {
        return TaskEdit(
          viewModel: vm,
        );
      },
    );
  }
}

class TaskEditVM {
  final TaskEntity task;
  final Function(TaskEntity) onChanged;
  final Function(BuildContext) onSavePressed;
  final Function onBackPressed;
  final bool isLoading;

  TaskEditVM({
    @required this.task,
    @required this.onChanged,
    @required this.onSavePressed,
    @required this.onBackPressed,
    @required this.isLoading,
  });

  factory TaskEditVM.fromStore(Store<AppState> store) {
    final task = store.state.taskUIState.selected;

    return TaskEditVM(
      isLoading: store.state.isLoading,
      task: task,
      onChanged: (TaskEntity task) {
        store.dispatch(UpdateTask(task));
      },
      onBackPressed: () {
        store.dispatch(UpdateCurrentRoute(TaskScreen.route));
      },
      onSavePressed: (BuildContext context) {
        final Completer<Null> completer = new Completer<Null>();
        store.dispatch(SaveTaskRequest(completer: completer, task: task));
        return completer.future.then((_) {
          Scaffold.of(context).showSnackBar(SnackBar(
              content: IconMessage(
                message: task.isNew
                    ? 'Successfully Created Task'
                    : 'Successfully Updated Task',
              ),
              duration: Duration(seconds: 3)));
        });
      },
    );
  }
}
