import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:MyUnifyMobile/redux/task/task_actions.dart';
import 'package:MyUnifyMobile/data/models/task_model.dart';
import 'package:MyUnifyMobile/data/models/models.dart';
import 'package:MyUnifyMobile/ui/task/view/task_view.dart';
import 'package:MyUnifyMobile/redux/app/app_state.dart';
import 'package:MyUnifyMobile/ui/app/icon_message.dart';

class TaskViewScreen extends StatelessWidget {
  static final String route = '/task/view';
  TaskViewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TaskViewVM>(
      converter: (Store<AppState> store) {
        return TaskViewVM.fromStore(store);
      },
      builder: (context, vm) {
        return TaskView(
          viewModel: vm,
        );
      },
    );
  }
}

class TaskViewVM {
  final TaskEntity task;
  final Function(BuildContext, EntityAction) onActionSelected;
  final Function(BuildContext) onEditPressed;
  final bool isLoading;

  TaskViewVM({
    @required this.task,
    @required this.onActionSelected,
    @required this.onEditPressed,
    @required this.isLoading,
  });

  factory TaskViewVM.fromStore(Store<AppState> store) {
    final task = store.state.taskUIState.selected;

    return TaskViewVM(
        isLoading: store.state.isLoading,
        task: task,
        onEditPressed: (BuildContext context) {
          store.dispatch(EditTask(task: task, context: context));
        },
        onActionSelected: (BuildContext context, EntityAction action) {
          final Completer<Null> completer = new Completer<Null>();
          var message;
          switch (action) {
            case EntityAction.delete:
              store.dispatch(DeleteTaskRequest(completer, task.id));
              message = 'Successfully Deleted Task';
              break;
          }
          if (message != null) {
            return completer.future.then((_) {
              Scaffold.of(context).showSnackBar(SnackBar(
                  content: IconMessage(
                    message: message,
                  ),
                  duration: Duration(seconds: 3)));
            });
          }
        });
  }
}
