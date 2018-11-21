import 'dart:async';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:MyUnifyMobile/redux/task/task_selectors.dart';
import 'package:MyUnifyMobile/ui/app/icon_message.dart';
import 'package:MyUnifyMobile/data/models/task_model.dart';
import 'package:MyUnifyMobile/ui/task/task_list.dart';
import 'package:MyUnifyMobile/redux/app/app_state.dart';
import 'package:MyUnifyMobile/redux/task/task_actions.dart';
import '../../utils/date_formatter.dart';
import '../../redux/app/app_actions.dart';

class TaskListBuilder extends StatelessWidget {
  static final String route = '/tasks/edit';
  TaskListBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TaskListVM>(
      converter: TaskListVM.fromStore,
      builder: (context, vm) {
        return TaskList(
          viewModel: vm,
        );
      },
    );
  }
}

class TaskListVM {
  final List<String> taskList;
  final BuiltMap<String, TaskEntity> taskMap;
  final bool isLoading;
  final bool isLoaded;
  final Function(BuildContext, TaskEntity) onTaskTap;
  final Function(BuildContext, TaskEntity, DismissDirection) onDismissed;
  final Function(BuildContext, bool) onRefreshed;
  final String date;
  // final ValueChanged<DateTime> onDateChange;
  final Function(BuildContext, DateTime) onDateChange;

  TaskListVM({
    @required this.taskList,
    @required this.taskMap,
    @required this.isLoading,
    @required this.isLoaded,
    @required this.onTaskTap,
    @required this.onDismissed,
    @required this.onRefreshed,
    @required this.date,
    @required this.onDateChange,
  });

  static TaskListVM fromStore(Store<AppState> store) {
    Future<Null> _handleRefresh(BuildContext context, bool up) {
      final Completer<Null> completer = new Completer<Null>();
      store.dispatch(LoadTasks(
        completer,
        true,
        formatDateCustom(parseDate(store?.state?.tasksDate) ?? DateTime.now()),
      ));
      return completer.future.then((_) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: IconMessage(message: 'Refresh complete'),
          duration: Duration(seconds: 3),
        ));
      });
    }

    return TaskListVM(
        taskList: memoizedTaskList(
          store.state.taskState.map,
          store.state.taskState.list,
          store.state.taskListState,
        ),
        date: store.state.tasksDate,
        onDateChange: (BuildContext context, DateTime value) {
          var _date = formatDateCustom(value);
          store.dispatch(ChangeDate(date: _date, state: store.state));
          _handleRefresh(context, true);
        },
        taskMap: store.state.taskState.map,
        isLoading: store.state.isLoading,
        isLoaded: store.state.taskState.isLoaded,
        onTaskTap: (context, task) {
          store.dispatch(ViewTask(task: task, context: context));
        },
        onRefreshed: (context, bool up) => _handleRefresh(context, up),
        onDismissed: (BuildContext context, TaskEntity task,
            DismissDirection direction) {
          final Completer<Null> completer = new Completer<Null>();
          store.dispatch(DeleteTaskRequest(completer, task.id));
          var message = 'Successfully Deleted Task';
          return completer.future.then((_) {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: IconMessage(
                  message: message,
                ),
                duration: Duration(seconds: 3)));
          });
        });
  }
}
