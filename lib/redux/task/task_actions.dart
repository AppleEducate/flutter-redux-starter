import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:built_collection/built_collection.dart';
import 'package:MyUnifyMobile/data/models/task_model.dart';
import 'package:MyUnifyMobile/redux/app/app_actions.dart';

class ViewTaskList implements PersistUI {
  final BuildContext context;
  ViewTaskList(this.context);
}

class ViewTask implements PersistUI {
  final TaskEntity task;
  final BuildContext context;
  ViewTask({this.task, this.context});
}

class EditTask implements PersistUI {
  final TaskEntity task;
  final BuildContext context;
  EditTask({this.task, this.context});
}

class LoadTasks {
  final Completer completer;
  final bool force;
  final String date;

  LoadTasks([
    this.completer,
    this.force = false,
    this.date,
  ]);
}

class LoadTasksRequest implements StartLoading {}

class LoadTasksFailure implements StopLoading {
  final dynamic error;
  LoadTasksFailure(this.error);

  @override
  String toString() {
    return 'LoadTasksFailure{error: $error}';
  }
}

class LoadTasksSuccess implements StopLoading, PersistData {
  final BuiltList<TaskEntity> tasks;
  LoadTasksSuccess(this.tasks);

  @override
  String toString() {
    return 'LoadTasksSuccess{tasks: $tasks}';
  }
}

class UpdateTask implements PersistUI {
  final TaskEntity task;
  UpdateTask(this.task);
}

class SaveTaskRequest implements StartLoading {
  final Completer completer;
  final TaskEntity task;
  SaveTaskRequest({this.completer, this.task});
}

class AddTaskSuccess implements StopLoading, PersistData {
  final TaskEntity task;
  AddTaskSuccess(this.task);
}

class SaveTaskSuccess implements StopLoading, PersistData {
  final TaskEntity task;

  SaveTaskSuccess(this.task);
}

class SaveTaskFailure implements StopLoading {
  final String error;
  SaveTaskFailure(this.error);
}

class DeleteTaskRequest implements StartLoading {
  final Completer completer;
  final String taskId;

  DeleteTaskRequest(this.completer, this.taskId);
}

class DeleteTaskSuccess implements StopLoading, PersistData {
  final TaskEntity task;
  DeleteTaskSuccess(this.task);
}

class DeleteTaskFailure implements StopLoading {
  final TaskEntity task;
  DeleteTaskFailure(this.task);
}

class SearchTasks {
  final String search;
  SearchTasks(this.search);
}

class SortTasks implements PersistUI {
  final String field;
  SortTasks(this.field);
}
