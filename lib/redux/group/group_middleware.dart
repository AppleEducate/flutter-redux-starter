import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';
import 'package:MyUnifyMobile/ui/group/group_screen.dart';
import 'package:MyUnifyMobile/data/models/models.dart';
import 'package:MyUnifyMobile/redux/group/group_actions.dart';
import 'package:MyUnifyMobile/redux/ui/ui_actions.dart';
import 'package:MyUnifyMobile/ui/group/edit/group_edit_vm.dart';
import 'package:MyUnifyMobile/ui/group/view/group_view_vm.dart';
import 'package:MyUnifyMobile/redux/app/app_state.dart';
import 'package:MyUnifyMobile/data/repositories/group_repository.dart';

List<Middleware<AppState>> createStoreGroupsMiddleware([
  GroupRepository repository = const GroupRepository(),
]) {
  final viewGroupList = _viewGroupList();
  final viewGroup = _viewGroup();
  final editGroup = _editGroup();
  final loadGroups = _loadGroups(repository);
  final saveGroup = _saveGroup(repository);
  final deleteGroup = _deleteGroup(repository);

  return [
    TypedMiddleware<AppState, ViewGroupList>(viewGroupList),
    TypedMiddleware<AppState, ViewGroup>(viewGroup),
    TypedMiddleware<AppState, EditGroup>(editGroup),
    TypedMiddleware<AppState, LoadGroups>(loadGroups),
    TypedMiddleware<AppState, SaveGroupRequest>(saveGroup),
    TypedMiddleware<AppState, DeleteGroupRequest>(deleteGroup),
  ];
}

Middleware<AppState> _viewGroupList() {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    store.dispatch(UpdateCurrentRoute(GroupScreen.route));
    Navigator.of(action.context).pushReplacementNamed(GroupScreen.route);
  };
}

Middleware<AppState> _viewGroup() {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    store.dispatch(UpdateCurrentRoute(GroupViewScreen.route));
    Navigator.of(action.context).pushNamed(GroupViewScreen.route);
  };
}

Middleware<AppState> _editGroup() {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    store.dispatch(UpdateCurrentRoute(GroupEditScreen.route));
    Navigator.of(action.context).pushNamed(GroupEditScreen.route);
  };
}

Middleware<AppState> _deleteGroup(GroupRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    var origGroup = store.state.groupState.map[action.groupId];
    repository
        .saveData(store.state.authState, origGroup, EntityAction.delete)
        .then((group) {
      store.dispatch(DeleteGroupSuccess(group));
      if (action.completer != null) {
        action.completer.complete(null);
      }
    }).catchError((error) {
      print(error);
      store.dispatch(DeleteGroupFailure(origGroup));
    });

    next(action);
  };
}

Middleware<AppState> _saveGroup(GroupRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.saveData(store.state.authState, action.group).then((group) {
      if (action.group.isNew) {
        store.dispatch(AddGroupSuccess(group));
      } else {
        store.dispatch(SaveGroupSuccess(group));
      }
      action.completer.complete(null);
    }).catchError((error) {
      print(error);
      store.dispatch(SaveGroupFailure(error));
    });

    next(action);
  };
}

Middleware<AppState> _loadGroups(GroupRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    AppState state = store.state;

    if (!state.groupState.isStale && !action.force) {
      next(action);
      return;
    }

    if (state.isLoading) {
      next(action);
      return;
    }

    store.dispatch(LoadGroupsRequest());
    repository.loadList(state.authState).then((data) {
      store.dispatch(LoadGroupsSuccess(data));

      if (action.completer != null) {
        action.completer.complete(null);
      }
    }).catchError((error) {
      print(error);
      store.dispatch(LoadGroupsFailure(error));
    });

    next(action);
  };
}
