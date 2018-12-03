import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:MyUnifyMobile/redux/group/group_actions.dart';
import 'package:MyUnifyMobile/data/models/group_model.dart';
import 'package:MyUnifyMobile/data/models/models.dart';
import 'package:MyUnifyMobile/ui/group/view/group_view.dart';
import 'package:MyUnifyMobile/redux/app/app_state.dart';
import 'package:MyUnifyMobile/ui/app/icon_message.dart';

class GroupViewScreen extends StatelessWidget {
  static final String route = '/group/view';
  GroupViewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, GroupViewVM>(
      converter: (Store<AppState> store) {
        return GroupViewVM.fromStore(store);
      },
      builder: (context, vm) {
        return GroupView(
          viewModel: vm,
        );
      },
    );
  }
}

class GroupViewVM {
  final GroupEntity group;
  final Function(BuildContext, EntityAction) onActionSelected;
  final Function(BuildContext) onEditPressed;
  final bool isLoading;

  GroupViewVM({
    @required this.group,
    @required this.onActionSelected,
    @required this.onEditPressed,
    @required this.isLoading,
  });

  factory GroupViewVM.fromStore(Store<AppState> store) {
    final group = store.state.groupUIState.selected;

    return GroupViewVM(
        isLoading: store.state.isLoading,
        group: group,
        onEditPressed: (BuildContext context) {
          store.dispatch(EditGroup(group: group, context: context));
        },
        onActionSelected: (BuildContext context, EntityAction action) {
          final Completer<Null> completer = new Completer<Null>();
          var message;
          switch (action) {
            case EntityAction.delete:
              store.dispatch(DeleteGroupRequest(completer, group.id));
              message = 'Successfully Deleted Group';
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
