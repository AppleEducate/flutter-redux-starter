import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:MyUnifyMobile/redux/contact/contact_actions.dart';
import 'package:MyUnifyMobile/data/models/contact_model.dart';
import 'package:MyUnifyMobile/data/models/models.dart';
import 'package:MyUnifyMobile/ui/contact/view/contact_view.dart';
import 'package:MyUnifyMobile/redux/app/app_state.dart';
import 'package:MyUnifyMobile/ui/app/icon_message.dart';

class ContactViewScreen extends StatelessWidget {
  static final String route = '/contact/view';
  ContactViewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ContactViewVM>(
      converter: (Store<AppState> store) {
        return ContactViewVM.fromStore(store);
      },
      builder: (context, vm) {
        return ContactView(
          viewModel: vm,
        );
      },
    );
  }
}

class ContactViewVM {
  final ContactEntity contact;
  final Function(BuildContext, EntityAction) onActionSelected;
  final Function(BuildContext) onEditPressed;
  final bool isLoading;

  ContactViewVM({
    @required this.contact,
    @required this.onActionSelected,
    @required this.onEditPressed,
    @required this.isLoading,
  });

  factory ContactViewVM.fromStore(Store<AppState> store) {
    final contact = store.state.contactUIState.selected;

    return ContactViewVM(
        isLoading: store.state.isLoading,
        contact: contact,
        onEditPressed: (BuildContext context) {
          store.dispatch(EditContact(contact: contact, context: context));
        },
        onActionSelected: (BuildContext context, EntityAction action) {
          final Completer<Null> completer = new Completer<Null>();
          var message;
          switch (action) {
            case EntityAction.delete:
              store.dispatch(DeleteContactRequest(completer, contact.id));
              message = 'Successfully Deleted Contact';
              break;
          }
          if (message != null) {
            return completer.future.then((_) {
              Scaffold.of(context).showSnackBar(SnackBar(
                  content: IconMessage(
                    message: message,
                  ),
                  duration: Duration(seconds: 3)));
            });
          }
        }
    );
  }
}
