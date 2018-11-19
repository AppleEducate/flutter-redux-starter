import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:MyUnifyMobile/redux/ui/ui_actions.dart';
import 'package:MyUnifyMobile/ui/contact/contact_screen.dart';
import 'package:redux/redux.dart';
import 'package:MyUnifyMobile/redux/contact/contact_actions.dart';
import 'package:MyUnifyMobile/data/models/contact_model.dart';
import 'package:MyUnifyMobile/ui/contact/edit/contact_edit.dart';
import 'package:MyUnifyMobile/redux/app/app_state.dart';
import 'package:MyUnifyMobile/ui/app/icon_message.dart';

class ContactEditScreen extends StatelessWidget {
  static final String route = '/contact/edit';
  ContactEditScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ContactEditVM>(
      converter: (Store<AppState> store) {
        return ContactEditVM.fromStore(store);
      },
      builder: (context, vm) {
        return ContactEdit(
          viewModel: vm,
        );
      },
    );
  }
}

class ContactEditVM {
  final ContactEntity contact;
  final Function(ContactEntity) onChanged;
  final Function(BuildContext) onSavePressed;
  final Function onBackPressed;
  final bool isLoading;

  ContactEditVM({
    @required this.contact,
    @required this.onChanged,
    @required this.onSavePressed,
    @required this.onBackPressed,
    @required this.isLoading,
  });

  factory ContactEditVM.fromStore(Store<AppState> store) {
    final contact = store.state.contactUIState.selected;

    return ContactEditVM(
      isLoading: store.state.isLoading,
      contact: contact,
      onChanged: (ContactEntity contact) {
        store.dispatch(UpdateContact(contact));
      },
      onBackPressed: () {
        store.dispatch(UpdateCurrentRoute(ContactScreen.route));
      },
      onSavePressed: (BuildContext context) {
        final Completer<Null> completer = new Completer<Null>();
        store.dispatch(SaveContactRequest(completer: completer, contact: contact));
        return completer.future.then((_) {
          Scaffold.of(context).showSnackBar(SnackBar(
              content: IconMessage(
                message: contact.isNew
                    ? 'Successfully Created Contact'
                    : 'Successfully Updated Contact',
              ),
              duration: Duration(seconds: 3)));
        });
      },
    );
  }
}
