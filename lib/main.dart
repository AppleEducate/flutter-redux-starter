import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:MyUnifyMobile/redux/app/app_middleware.dart';
import 'package:MyUnifyMobile/redux/app/app_state.dart';
import 'package:MyUnifyMobile/redux/app/app_reducer.dart';
import 'package:MyUnifyMobile/redux/auth/auth_middleware.dart';
import 'package:MyUnifyMobile/ui/app/init.dart';
import 'package:MyUnifyMobile/ui/auth/login_vm.dart';
import 'package:MyUnifyMobile/ui/home/home_screen.dart';
// STARTER: import - do not remove comment

import 'package:MyUnifyMobile/ui/contact/contact_screen.dart';
import 'package:MyUnifyMobile/ui/contact/edit/contact_edit_vm.dart';
import 'package:MyUnifyMobile/ui/contact/view/contact_view_vm.dart';
import 'package:MyUnifyMobile/redux/contact/contact_actions.dart';
import 'package:MyUnifyMobile/redux/contact/contact_middleware.dart';

void main() {
  final store = Store<AppState>(appReducer,
      initialState: AppState(),
      middleware: []
        ..addAll(createStoreAuthMiddleware())
        ..addAll(createStorePersistenceMiddleware())
        // STARTER: middleware - do not remove comment

        ..addAll(createStoreContactsMiddleware())
        ..addAll([
          LoggingMiddleware.printer(),
        ]));

  runApp(SampleReduxApp(store: store));
}

class SampleReduxApp extends StatefulWidget {
  final Store<AppState> store;

  SampleReduxApp({Key key, this.store}) : super(key: key);

  @override
  _SampleReduxAppState createState() => _SampleReduxAppState();
}

class _SampleReduxAppState extends State<SampleReduxApp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        title: 'My Unify Mobile',
        routes: {
          InitScreen.route: (context) => InitScreen(),
          LoginScreen.route: (context) => LoginScreen(),
          HomeScreen.route: (context) => HomeScreen(),
          // STARTER: routes - do not remove comment

          ContactScreen.route: (context) {
            widget.store.dispatch(LoadContacts());
            return ContactScreen();
          },
          ContactViewScreen.route: (context) => ContactViewScreen(),
          ContactEditScreen.route: (context) => ContactEditScreen(),
        },
      ),
    );
  }
}
