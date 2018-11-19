import 'package:memoize/memoize.dart';
import 'package:built_collection/built_collection.dart';
import 'package:MyUnifyMobile/data/models/contact_model.dart';
import 'package:MyUnifyMobile/redux/ui/list_ui_state.dart';

var memoizedContactList = memo3((
    BuiltMap<String, ContactEntity> contactMap,
    BuiltList<String> contactList,
    ListUIState contactListState) => visibleContactsSelector(contactMap, contactList, contactListState)
);

List<String> visibleContactsSelector(
    BuiltMap<String, ContactEntity> contactMap,
    BuiltList<String> contactList,
    ListUIState contactListState) {

  var list = contactList.where((contactId) {
    var contact = contactMap[contactId];
    return contact.matchesSearch(contactListState.search);
  }).toList();

  list.sort((contactAId, contactBId) {
    var contactA = contactMap[contactAId];
    var contactB = contactMap[contactBId];
    return contactA.compareTo(contactB, contactListState.sortField, contactListState.sortAscending);
  });

  return list;
}
