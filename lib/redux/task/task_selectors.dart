import 'package:memoize/memoize.dart';
import 'package:built_collection/built_collection.dart';
import 'package:MyUnifyMobile/data/models/task_model.dart';
import 'package:MyUnifyMobile/redux/ui/list_ui_state.dart';

var memoizedTaskList = memo3((BuiltMap<String, TaskEntity> taskMap,
        BuiltList<String> taskList, ListUIState taskListState) =>
    visibleTasksSelector(taskMap, taskList, taskListState));

List<String> visibleTasksSelector(BuiltMap<String, TaskEntity> taskMap,
    BuiltList<String> taskList, ListUIState taskListState) {
  var list = taskList.where((taskId) {
    var task = taskMap[taskId];
    return task.matchesSearch(taskListState.search);
  }).toList();

  list.sort((taskAId, taskBId) {
    var taskA = taskMap[taskAId];
    var taskB = taskMap[taskBId];
    return taskA.compareTo(
        taskB, taskListState.sortField, taskListState.sortAscending);
  });

  return list;
}
