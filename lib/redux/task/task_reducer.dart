import 'package:redux/redux.dart';
import 'package:MyUnifyMobile/data/models/task_model.dart';
import 'package:MyUnifyMobile/redux/ui/entity_ui_state.dart';
import 'package:MyUnifyMobile/redux/ui/list_ui_state.dart';
import 'package:MyUnifyMobile/redux/task/task_actions.dart';
import 'package:MyUnifyMobile/redux/task/task_state.dart';

EntityUIState taskUIReducer(TaskUIState state, action) {
  return state.rebuild((b) => b
    ..listUIState.replace(taskListReducer(state.listUIState, action))
    ..selected.replace(editingReducer(state.selected, action)));
}

final editingReducer = combineReducers<TaskEntity>([
  TypedReducer<TaskEntity, SaveTaskSuccess>(_updateEditing),
  TypedReducer<TaskEntity, AddTaskSuccess>(_updateEditing),
  TypedReducer<TaskEntity, ViewTask>(_updateEditing),
  TypedReducer<TaskEntity, EditTask>(_updateEditing),
  TypedReducer<TaskEntity, UpdateTask>(_updateEditing),
]);

/*
TaskEntity  _clearEditing(TaskEntity task, action) {
  return TaskEntity();
}
*/

TaskEntity _updateEditing(TaskEntity task, action) {
  return action.task;
}

final taskListReducer = combineReducers<ListUIState>([
  TypedReducer<ListUIState, SortTasks>(_sortTasks),
  TypedReducer<ListUIState, SearchTasks>(_searchTasks),
]);

ListUIState _searchTasks(ListUIState taskListState, SearchTasks action) {
  return taskListState.rebuild((b) => b..search = action.search);
}

ListUIState _sortTasks(ListUIState taskListState, SortTasks action) {
  return taskListState.rebuild((b) => b
    ..sortAscending = b.sortField != action.field || !b.sortAscending
    ..sortField = action.field);
}

final tasksReducer = combineReducers<TaskState>([
  TypedReducer<TaskState, SaveTaskSuccess>(_updateTask),
  TypedReducer<TaskState, AddTaskSuccess>(_addTask),
  TypedReducer<TaskState, LoadTasksSuccess>(_setLoadedTasks),
  TypedReducer<TaskState, LoadTasksFailure>(_setNoTasks),
  TypedReducer<TaskState, DeleteTaskRequest>(_deleteTaskRequest),
  TypedReducer<TaskState, DeleteTaskSuccess>(_deleteTaskSuccess),
  TypedReducer<TaskState, DeleteTaskFailure>(_deleteTaskFailure),
]);

TaskState _deleteTaskRequest(TaskState taskState, DeleteTaskRequest action) {
  var task = taskState.map[action.taskId].rebuild((b) => b);

  return taskState.rebuild((b) => b..map[action.taskId] = task);
}

TaskState _deleteTaskSuccess(TaskState taskState, DeleteTaskSuccess action) {
  return taskState.rebuild((b) => b..map[action.task.id] = action.task);
}

TaskState _deleteTaskFailure(TaskState taskState, DeleteTaskFailure action) {
  return taskState.rebuild((b) => b..map[action.task.id] = action.task);
}

TaskState _addTask(TaskState taskState, AddTaskSuccess action) {
  return taskState.rebuild((b) => b
    ..map[action.task.id] = action.task
    ..list.add(action.task.id));
}

TaskState _updateTask(TaskState taskState, SaveTaskSuccess action) {
  return taskState.rebuild((b) => b..map[action.task.id] = action.task);
}

TaskState _setNoTasks(TaskState taskState, LoadTasksFailure action) {
  return taskState;
}

TaskState _setLoadedTasks(TaskState taskState, LoadTasksSuccess action) {
  return taskState.rebuild((b) => b
    ..lastUpdated = DateTime.now().millisecondsSinceEpoch
    ..map.addAll(Map.fromIterable(
      action.tasks,
      key: (item) => item.id,
      value: (item) => item,
    ))
    ..list.replace(action.tasks.map((task) => task.id).toList()));
}
