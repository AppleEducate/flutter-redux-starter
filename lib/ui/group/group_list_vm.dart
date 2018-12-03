import 'dart:async';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:MyUnifyMobile/redux/group/group_selectors.dart';
import 'package:MyUnifyMobile/ui/app/icon_message.dart';
import 'package:MyUnifyMobile/data/models/group_model.dart';
import 'package:MyUnifyMobile/ui/group/group_list.dart';
import 'package:MyUnifyMobile/redux/app/app_state.dart';
import 'package:MyUnifyMobile/redux/group/group_actions.dart';

class GroupListBuilder extends StatelessWidget {
  static final String route = '/groups/edit';
  GroupListBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, GroupListVM>(
      converter: GroupListVM.fromStore,
      builder: (context, vm) {
        return GroupList(
          viewModel: vm,
        );
      },
    );
  }
}

class GroupListVM {
  final List<String> groupList;
  final BuiltMap<String, GroupEntity> groupMap;
  final bool isLoading;
  final bool isLoaded;
  final Function(BuildContext, GroupEntity) onGroupTap;
  final Function(BuildContext, GroupEntity, DismissDirection) onDismissed;
  final Function(BuildContext) onRefreshed;

  GroupListVM({
    @required this.groupList,
    @required this.groupMap,
    @required this.isLoading,
    @required this.isLoaded,
    @required this.onGroupTap,
    @required this.onDismissed,
    @required this.onRefreshed,
  });

  static GroupListVM fromStore(Store<AppState> store) {
    Future<Null> _handleRefresh(BuildContext context) {
      final Completer<Null> completer = new Completer<Null>();
      store.dispatch(LoadGroups(completer, true));
      return completer.future.then((_) {
        Scaffold.of(context).showSnackBar(SnackBar(
            content: IconMessage(
              message: 'Refresh complete',
            ),
            duration: Duration(seconds: 3)));
      });
    }

    return GroupListVM(
        groupList: memoizedGroupList(
          store.state.groupState.map,
          store.state.groupState.list,
          store.state.groupListState,
        ),
        groupMap: store.state.groupState.map,
        isLoading: store.state.isLoading,
        isLoaded: store.state.groupState.isLoaded,
        onGroupTap: (context, group) {
          store.dispatch(ViewGroup(group: group, context: context));
        },
        onRefreshed: (context) => _handleRefresh(context),
        onDismissed: (BuildContext context, GroupEntity group,
            DismissDirection direction) {
          final Completer<Null> completer = new Completer<Null>();
          store.dispatch(DeleteGroupRequest(completer, group.id));
          var message = 'Successfully Deleted Group';
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
