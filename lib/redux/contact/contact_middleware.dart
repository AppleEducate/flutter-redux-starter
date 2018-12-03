import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';
import 'package:MyUnifyMobile/ui/contact/contact_screen.dart';
import 'package:MyUnifyMobile/data/models/models.dart';
import 'package:MyUnifyMobile/redux/contact/contact_actions.dart';
import 'package:MyUnifyMobile/redux/ui/ui_actions.dart';
import 'package:MyUnifyMobile/ui/contact/edit/contact_edit_vm.dart';
import 'package:MyUnifyMobile/ui/contact/view/contact_view_vm.dart';
import 'package:MyUnifyMobile/redux/app/app_state.dart';
import 'package:MyUnifyMobile/data/repositories/contact_repository.dart';
import '../../data/models/paging_model.dart';
import '../../data/models/search_model.dart';

List<Middleware<AppState>> createStoreContactsMiddleware([
  ContactRepository repository = const ContactRepository(),
]) {
  final viewContactList = _viewContactList();
  final viewContact = _viewContact();
  final editContact = _editContact();
  final loadContacts = _loadContacts(repository);
  final saveContact = _saveContact(repository);
  final deleteContact = _deleteContact(repository);

  return [
    TypedMiddleware<AppState, ViewContactList>(viewContactList),
    TypedMiddleware<AppState, ViewContact>(viewContact),
    TypedMiddleware<AppState, EditContact>(editContact),
    TypedMiddleware<AppState, LoadContacts>(loadContacts),
    TypedMiddleware<AppState, SaveContactRequest>(saveContact),
    TypedMiddleware<AppState, DeleteContactRequest>(deleteContact),
  ];
}

Middleware<AppState> _viewContactList() {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    store.dispatch(UpdateCurrentRoute(ContactScreen.route));
    Navigator.of(action.context).pushReplacementNamed(ContactScreen.route);
  };
}

Middleware<AppState> _viewContact() {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    store.dispatch(UpdateCurrentRoute(ContactViewScreen.route));
    Navigator.of(action.context).pushNamed(ContactViewScreen.route);
  };
}

Middleware<AppState> _editContact() {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    store.dispatch(UpdateCurrentRoute(ContactEditScreen.route));
    Navigator.of(action.context).pushNamed(ContactEditScreen.route);
  };
}

Middleware<AppState> _deleteContact(ContactRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    var origContact = store.state.contactState.map[action.contactId];
    store.dispatch(DeleteContactSuccess(origContact));
    repository
        .deleteContact(store.state.authState, origContact.id)
        .then((response) {
      if (!response.toString().contains("Deleted")) {
        store.dispatch(DeleteContactFailure(origContact));
      }
      if (action.completer != null) {
        action.completer.complete(null);
      }
    }).catchError((error) {
      print(error);
      store.dispatch(DeleteContactFailure(origContact));
    });

    next(action);
  };
}

Middleware<AppState> _saveContact(ContactRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.saveData(store.state.authState, action.contact).then((contact) {
      if (action.contact.isNew) {
        store.dispatch(AddContactSuccess(contact));
      } else {
        store.dispatch(SaveContactSuccess(contact));
      }
      action.completer.complete(null);
    }).catchError((error) {
      print(error);
      store.dispatch(SaveContactFailure(error));
    });

    next(action);
  };
}

Middleware<AppState> _loadContacts(ContactRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    AppState state = store.state;

    if (!state.contactState.isStale && !action.force) {
      next(action);
      return;
    }

    if (state.isLoading) {
      next(action);
      return;
    }

    store.dispatch(LoadContactsRequest());
    repository
        .loadList(state.authState,
            paging: PagingModel(
              page: state?.contactState?.page,
              rows: state?.contactState?.rows,
            ),
            search: SearchModel(
              search: state?.contactState?.search,
              filters: state?.contactState?.filters,
            ))
        .then((data) {
      store.dispatch(LoadContactsSuccess(data));

      if (action.completer != null) {
        action.completer.complete(null);
      }
    }).catchError((error) {
      print(error);
      store.dispatch(LoadContactsFailure(error));
    });

    next(action);
  };
}
