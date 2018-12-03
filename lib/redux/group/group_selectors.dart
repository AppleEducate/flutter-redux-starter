import 'package:memoize/memoize.dart';
import 'package:built_collection/built_collection.dart';
import 'package:MyUnifyMobile/data/models/group_model.dart';
import 'package:MyUnifyMobile/redux/ui/list_ui_state.dart';

var memoizedGroupList = memo3((BuiltMap<String, GroupEntity> groupMap,
        BuiltList<String> groupList, ListUIState groupListState) =>
    visibleGroupsSelector(groupMap, groupList, groupListState));

List<String> visibleGroupsSelector(BuiltMap<String, GroupEntity> groupMap,
    BuiltList<String> groupList, ListUIState groupListState) {
  var list = groupList.where((groupId) {
    var group = groupMap[groupId];
    return group.matchesSearch(groupListState.search);
  }).toList();

  list.sort((groupAId, groupBId) {
    var groupA = groupMap[groupAId];
    var groupB = groupMap[groupBId];
    return groupA.compareTo(
        groupB, groupListState.sortField, groupListState.sortAscending);
  });

  return list;
}
