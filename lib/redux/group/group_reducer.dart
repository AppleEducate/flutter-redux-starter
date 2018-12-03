import 'package:redux/redux.dart';
import 'package:MyUnifyMobile/data/models/group_model.dart';
import 'package:MyUnifyMobile/redux/ui/entity_ui_state.dart';
import 'package:MyUnifyMobile/redux/ui/list_ui_state.dart';
import 'package:MyUnifyMobile/redux/group/group_actions.dart';
import 'package:MyUnifyMobile/redux/group/group_state.dart';

EntityUIState groupUIReducer(GroupUIState state, action) {
  return state.rebuild((b) => b
    ..listUIState.replace(groupListReducer(state.listUIState, action))
    ..selected.replace(editingReducer(state.selected, action)));
}

final editingReducer = combineReducers<GroupEntity>([
  TypedReducer<GroupEntity, SaveGroupSuccess>(_updateEditing),
  TypedReducer<GroupEntity, AddGroupSuccess>(_updateEditing),
  TypedReducer<GroupEntity, ViewGroup>(_updateEditing),
  TypedReducer<GroupEntity, EditGroup>(_updateEditing),
  TypedReducer<GroupEntity, UpdateGroup>(_updateEditing),
]);

/*
GroupEntity  _clearEditing(GroupEntity group, action) {
  return GroupEntity();
}
*/

GroupEntity _updateEditing(GroupEntity group, action) {
  return action.group;
}

final groupListReducer = combineReducers<ListUIState>([
  TypedReducer<ListUIState, SortGroups>(_sortGroups),
  TypedReducer<ListUIState, SearchGroups>(_searchGroups),
]);

ListUIState _searchGroups(ListUIState groupListState, SearchGroups action) {
  return groupListState.rebuild((b) => b..search = action.search);
}

ListUIState _sortGroups(ListUIState groupListState, SortGroups action) {
  return groupListState.rebuild((b) => b
    ..sortAscending = b.sortField != action.field || !b.sortAscending
    ..sortField = action.field);
}

final groupsReducer = combineReducers<GroupState>([
  TypedReducer<GroupState, SaveGroupSuccess>(_updateGroup),
  TypedReducer<GroupState, AddGroupSuccess>(_addGroup),
  TypedReducer<GroupState, LoadGroupsSuccess>(_setLoadedGroups),
  TypedReducer<GroupState, LoadGroupsFailure>(_setNoGroups),
  TypedReducer<GroupState, DeleteGroupRequest>(_deleteGroupRequest),
  TypedReducer<GroupState, DeleteGroupSuccess>(_deleteGroupSuccess),
  TypedReducer<GroupState, DeleteGroupFailure>(_deleteGroupFailure),
]);

GroupState _deleteGroupRequest(
    GroupState groupState, DeleteGroupRequest action) {
  var group = groupState.map[action.groupId].rebuild((b) => b);

  return groupState.rebuild((b) => b..map[action.groupId] = group);
}

GroupState _deleteGroupSuccess(
    GroupState groupState, DeleteGroupSuccess action) {
  return groupState.rebuild((b) => b..map[action.group.id] = action.group);
}

GroupState _deleteGroupFailure(
    GroupState groupState, DeleteGroupFailure action) {
  return groupState.rebuild((b) => b..map[action.group.id] = action.group);
}

GroupState _addGroup(GroupState groupState, AddGroupSuccess action) {
  return groupState.rebuild((b) => b
    ..map[action.group.id] = action.group
    ..list.add(action.group.id));
}

GroupState _updateGroup(GroupState groupState, SaveGroupSuccess action) {
  return groupState.rebuild((b) => b..map[action.group.id] = action.group);
}

GroupState _setNoGroups(GroupState groupState, LoadGroupsFailure action) {
  return groupState;
}

GroupState _setLoadedGroups(GroupState groupState, LoadGroupsSuccess action) {
  return groupState.rebuild((b) => b
    ..lastUpdated = DateTime.now().millisecondsSinceEpoch
    ..map.addAll(Map.fromIterable(
      action.groups,
      key: (item) => item.id,
      value: (item) => item,
    ))
    ..list.replace(action.groups.map((group) => group.id).toList()));
}
