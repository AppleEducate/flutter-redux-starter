import 'package:redux/redux.dart';
import 'package:MyUnifyMobile/data/models/contact_model.dart';
import 'package:MyUnifyMobile/redux/ui/entity_ui_state.dart';
import 'package:MyUnifyMobile/redux/ui/list_ui_state.dart';
import 'package:MyUnifyMobile/redux/contact/contact_actions.dart';
import 'package:MyUnifyMobile/redux/contact/contact_state.dart';

EntityUIState contactUIReducer(ContactUIState state, action) {
  return state.rebuild((b) => b
    ..listUIState.replace(contactListReducer(state.listUIState, action))
    ..selected.replace(editingReducer(state.selected, action)));
}

final editingReducer = combineReducers<ContactEntity>([
  TypedReducer<ContactEntity, SaveContactSuccess>(_updateEditing),
  TypedReducer<ContactEntity, AddContactSuccess>(_updateEditing),
  TypedReducer<ContactEntity, ViewContact>(_updateEditing),
  TypedReducer<ContactEntity, EditContact>(_updateEditing),
  TypedReducer<ContactEntity, UpdateContact>(_updateEditing),
]);

/*
ContactEntity  _clearEditing(ContactEntity contact, action) {
  return ContactEntity();
}
*/

ContactEntity _updateEditing(ContactEntity contact, action) {
  return action.contact;
}

final contactListReducer = combineReducers<ListUIState>([
  TypedReducer<ListUIState, SortContacts>(_sortContacts),
  TypedReducer<ListUIState, SearchContacts>(_searchContacts),
]);

ListUIState _searchContacts(
    ListUIState contactListState, SearchContacts action) {
  return contactListState.rebuild((b) => b..search = action.search);
}

ListUIState _sortContacts(ListUIState contactListState, SortContacts action) {
  return contactListState.rebuild((b) => b
    ..sortAscending = b.sortField != action.field || !b.sortAscending
    ..sortField = action.field);
}

final contactsReducer = combineReducers<ContactState>([
  TypedReducer<ContactState, SaveContactSuccess>(_updateContact),
  TypedReducer<ContactState, AddContactSuccess>(_addContact),
  TypedReducer<ContactState, LoadContactsSuccess>(_setLoadedContacts),
  TypedReducer<ContactState, LoadContactsFailure>(_setNoContacts),
  TypedReducer<ContactState, DeleteContactRequest>(_deleteContactRequest),
  TypedReducer<ContactState, DeleteContactSuccess>(_deleteContactSuccess),
  TypedReducer<ContactState, DeleteContactFailure>(_deleteContactFailure),
  TypedReducer<ContactState, ChangePaging>(_changePaging),
]);

ContactState _deleteContactRequest(
    ContactState contactState, DeleteContactRequest action) {
  var contact = contactState.map[action.contactId].rebuild((b) => b);

  return contactState.rebuild((b) => b..map[action.contactId] = contact);
}

ContactState _changePaging(ContactState contactState, ChangePaging action) {
  print(
      "Change Paging => Page [${contactState?.page}] Rows [${contactState?.rows}]");

  return contactState.rebuild((b) => b
    ..page = action.paging.page
    ..rows = action.paging.rows);
}

ContactState _deleteContactSuccess(
    ContactState contactState, DeleteContactSuccess action) {
  return contactState.rebuild(
    (b) => b..list.remove(action.contact.id),
  );
}

ContactState _deleteContactFailure(
    ContactState contactState, DeleteContactFailure action) {
  return contactState
      .rebuild((b) => b..map[action.contact.id] = action.contact);
}

ContactState _addContact(ContactState contactState, AddContactSuccess action) {
  return contactState.rebuild(
    (b) => b
      ..map[action.contact.id] = action.contact
      ..list.add(action.contact.id),
  );
}

ContactState _updateContact(
    ContactState contactState, SaveContactSuccess action) {
  return contactState
      .rebuild((b) => b..map[action.contact.id] = action.contact);
}

ContactState _setNoContacts(
    ContactState contactState, LoadContactsFailure action) {
  return contactState;
}

ContactState _setLoadedContacts(
    ContactState contactState, LoadContactsSuccess action) {
  print(
      "Loading Contacts => Page [${contactState?.page}] Rows [${contactState?.rows}]");
  bool _firstPage = contactState?.page == 1;

  if (action.contacts != null && action.contacts.isEmpty) {
    int _lastPage = contactState?.page ?? 1;
    int _page = _lastPage - 1;
    if (_page <= 0) _page = 1;
    print(
        "Contacts Empty: ${action.contacts.length}, First: $_firstPage, $_lastPage => $_page");

    return contactState.rebuild((b) => b
      ..page = _page
      ..rows = contactState?.rows);
  }

  if (_firstPage) {
    return contactState.rebuild((b) => b
      ..lastUpdated = DateTime.now().millisecondsSinceEpoch
      ..map.addAll(Map.fromIterable(
        action.contacts,
        key: (item) => item.id,
        value: (item) => item,
      ))
      ..list.replace(action.contacts.map((contact) => contact.id).toList()));
  }

  return contactState.rebuild((b) => b
    ..lastUpdated = DateTime.now().millisecondsSinceEpoch
    ..map.addAll(Map.fromIterable(
      action.contacts,
      key: (item) => item.id,
      value: (item) => item,
    ))
    ..list.addAll(action.contacts.map((contact) => contact.id).toList()));
}
