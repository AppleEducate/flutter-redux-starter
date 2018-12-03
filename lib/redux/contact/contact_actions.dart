import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:built_collection/built_collection.dart';
import 'package:MyUnifyMobile/data/models/contact_model.dart';
import 'package:MyUnifyMobile/redux/app/app_actions.dart';
import '../../data/models/paging_model.dart';
import '../../data/models/search_model.dart';

class ViewContactList implements PersistUI {
  final BuildContext context;
  ViewContactList(this.context);
}

class ViewContact implements PersistUI {
  final ContactEntity contact;
  final BuildContext context;
  ViewContact({this.contact, this.context});
}

class EditContact implements PersistUI {
  final ContactEntity contact;
  final BuildContext context;
  EditContact({this.contact, this.context});
}

class LoadContacts {
  final Completer completer;
  final bool force;

  LoadContacts([this.completer, this.force = false]);
}

class ChangePaging {
  final PagingModel paging;
  ChangePaging({this.paging});
}

class ChangeSearchModel {
  final SearchModel search;
  ChangeSearchModel({this.search});
}

class LoadContactsRequest implements StartLoading {}

class LoadContactsFailure implements StopLoading {
  final dynamic error;
  LoadContactsFailure(this.error);

  @override
  String toString() {
    return 'LoadContactsFailure{error: $error}';
  }
}

class LoadContactsSuccess implements StopLoading, PersistData {
  final BuiltList<ContactEntity> contacts;
  LoadContactsSuccess(this.contacts);

  @override
  String toString() {
    return 'LoadContactsSuccess{contacts: $contacts}';
  }
}

class UpdateContact implements PersistUI {
  final ContactEntity contact;
  UpdateContact(this.contact);
}

class SaveContactRequest implements StartLoading {
  final Completer completer;
  final ContactEntity contact;
  SaveContactRequest({this.completer, this.contact});
}

class AddContactSuccess implements StopLoading, PersistData {
  final ContactEntity contact;
  AddContactSuccess(this.contact);
}

class SaveContactSuccess implements StopLoading, PersistData {
  final ContactEntity contact;

  SaveContactSuccess(this.contact);
}

class SaveContactFailure implements StopLoading {
  final String error;
  SaveContactFailure(this.error);
}

class DeleteContactRequest implements StartLoading {
  final Completer completer;
  final String contactId;

  DeleteContactRequest(this.completer, this.contactId);
}

class DeleteContactSuccess implements StopLoading, PersistData {
  final ContactEntity contact;
  DeleteContactSuccess(this.contact);
}

class DeleteContactFailure implements StopLoading {
  final ContactEntity contact;
  DeleteContactFailure(this.contact);
}

class SearchContacts {
  final String search;
  SearchContacts(this.search);
}

class SortContacts implements PersistUI {
  final String field;
  SortContacts(this.field);
}
