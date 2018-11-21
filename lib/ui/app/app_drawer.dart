import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:MyUnifyMobile/redux/app/app_state.dart';
import 'package:MyUnifyMobile/redux/ui/ui_actions.dart';
import 'package:MyUnifyMobile/ui/app/app_drawer_vm.dart';
import 'package:MyUnifyMobile/ui/home/home_screen.dart';
import 'package:redux/redux.dart';
// STARTER: import - do not remove comment
import 'package:MyUnifyMobile/redux/task/task_actions.dart';
import '../../redux/auth/auth_actions.dart';
import 'package:MyUnifyMobile/redux/contact/contact_actions.dart';

class AppDrawer extends StatelessWidget {
  final AppDrawerVM viewModel;

  AppDrawer({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Store<AppState> store = StoreProvider.of<AppState>(context);
    NavigatorState navigator = Navigator.of(context);

    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            child: DrawerHeader(
              child: Container(),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              store.dispatch(UpdateCurrentRoute(HomeScreen.route));
              navigator.pushReplacementNamed(HomeScreen.route);
            },
          ),
          // STARTER: menu - do not remove comment
          ListTile(
            leading: Icon(Icons.track_changes),
            title: Text('Tasks'),
            onTap: () => store.dispatch(ViewTaskList(context)),
          ),

          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('Contacts'),
            onTap: () => store.dispatch(ViewContactList(context)),
          ),

          AboutListTile(
            applicationName: 'My Unify Mobile',
            icon: Icon(Icons.info_outline),
            child: Text('About'),
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => store.dispatch(LoadUserLogin(context)),
          ),
        ],
      ),
    );
  }
}
