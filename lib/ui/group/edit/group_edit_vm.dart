import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:MyUnifyMobile/redux/ui/ui_actions.dart';
import 'package:MyUnifyMobile/ui/group/group_screen.dart';
import 'package:redux/redux.dart';
import 'package:MyUnifyMobile/redux/group/group_actions.dart';
import 'package:MyUnifyMobile/data/models/group_model.dart';
import 'package:MyUnifyMobile/ui/group/edit/group_edit.dart';
import 'package:MyUnifyMobile/redux/app/app_state.dart';
import 'package:MyUnifyMobile/ui/app/icon_message.dart';

class GroupEditScreen extends StatelessWidget {
  static final String route = '/group/edit';
  GroupEditScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, GroupEditVM>(
      converter: (Store<AppState> store) {
        return GroupEditVM.fromStore(store);
      },
      builder: (context, vm) {
        return GroupEdit(
          viewModel: vm,
        );
      },
    );
  }
}

class GroupEditVM {
  final GroupEntity group;
  final Function(GroupEntity) onChanged;
  final Function(BuildContext) onSavePressed;
  final Function onBackPressed;
  final bool isLoading;

  GroupEditVM({
    @required this.group,
    @required this.onChanged,
    @required this.onSavePressed,
    @required this.onBackPressed,
    @required this.isLoading,
  });

  factory GroupEditVM.fromStore(Store<AppState> store) {
    final group = store.state.groupUIState.selected;

    return GroupEditVM(
      isLoading: store.state.isLoading,
      group: group,
      onChanged: (GroupEntity group) {
        store.dispatch(UpdateGroup(group));
      },
      onBackPressed: () {
        store.dispatch(UpdateCurrentRoute(GroupScreen.route));
      },
      onSavePressed: (BuildContext context) {
        final Completer<Null> completer = new Completer<Null>();
        store.dispatch(SaveGroupRequest(completer: completer, group: group));
        return completer.future.then((_) {
          Scaffold.of(context).showSnackBar(SnackBar(
              content: IconMessage(
                message: group.isNew
                    ? 'Successfully Created Group'
                    : 'Successfully Updated Group',
              ),
              duration: Duration(seconds: 3)));
        });
      },
    );
  }
}
