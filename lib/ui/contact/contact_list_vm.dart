import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../data/models/contact_model.dart';
import '../../redux/app/app_state.dart';
import '../../redux/contact/contact_actions.dart';
import '../../redux/contact/contact_selectors.dart';
import '../app/icon_message.dart';
import 'contact_list.dart';

class ContactListBuilder extends StatelessWidget {
  static final String route = '/contacts/edit';
  ContactListBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ContactListVM>(
      converter: ContactListVM.fromStore,
      builder: (context, vm) {
        return ContactList(
          viewModel: vm,
        );
      },
    );
  }
}

class ContactListVM {
  final List<String> contactList;
  final BuiltMap<String, ContactEntity> contactMap;
  final bool isLoading;
  final bool isLoaded;
  final Function(BuildContext, ContactEntity) onContactTap;
  final Function(BuildContext, ContactEntity, DismissDirection) onDismissed;
  final Function(BuildContext) onRefreshed;

  ContactListVM({
    @required this.contactList,
    @required this.contactMap,
    @required this.isLoading,
    @required this.isLoaded,
    @required this.onContactTap,
    @required this.onDismissed,
    @required this.onRefreshed,
  });

  static ContactListVM fromStore(Store<AppState> store) {
    Future<Null> _handleRefresh(BuildContext context) {
      final Completer<Null> completer = new Completer<Null>();
      store.dispatch(LoadContacts(completer, true));
      return completer.future.then((_) {
        Scaffold.of(context).showSnackBar(SnackBar(
            content: IconMessage(
              message: 'Refresh complete',
            ),
            duration: Duration(seconds: 3)));
      });
    }

    return ContactListVM(
        contactList: memoizedContactList(
          store.state.contactState.map,
          store.state.contactState.list,
          store.state.contactListState,
        ),
        contactMap: store.state.contactState.map,
        isLoading: store.state.isLoading,
        isLoaded: store.state.contactState.isLoaded,
        onContactTap: (context, contact) {
          store.dispatch(ViewContact(contact: contact, context: context));
        },
        onRefreshed: (context) => _handleRefresh(context),
        onDismissed: (BuildContext context, ContactEntity contact,
            DismissDirection direction) {
          final Completer<Null> completer = new Completer<Null>();
          store.dispatch(DeleteContactRequest(completer, contact.id));
          var message = 'Successfully Deleted Contact';
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
