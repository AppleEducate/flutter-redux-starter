import 'package:flutter/material.dart';
import 'package:MyUnifyMobile/data/repositories/auth_repository.dart';
import 'package:MyUnifyMobile/redux/app/app_state.dart';
import 'package:MyUnifyMobile/redux/auth/auth_actions.dart';
import 'package:MyUnifyMobile/ui/auth/login_vm.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/null_or_empty.dart';

List<Middleware<AppState>> createStoreAuthMiddleware([
  AuthRepository repository = const AuthRepository(),
]) {
  final loginInit = _createLoginInit();
  final loginRequest = _createLoginRequest(repository);

  return [
    TypedMiddleware<AppState, LoadUserLogin>(loginInit),
    TypedMiddleware<AppState, UserLoginRequest>(loginRequest),
  ];
}

_saveAuthLocal(action) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('email', action.email);
}

_loadAuthLocal(Store<AppState> store, action) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String email = prefs.getString('email');

  store.dispatch(UserLoginLoaded(email));
  Navigator.of(action.context).pushReplacementNamed(LoginScreen.route);
}

Middleware<AppState> _createLoginInit() {
  return (Store<AppState> store, action, NextDispatcher next) {
    _loadAuthLocal(store, action);

    next(action);
  };
}

Middleware<AppState> _createLoginRequest(AuthRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.login(action.email, action.password).then((data) {
      if (isNullOrEmpty(data)) {
        store.dispatch(UserLoginFailure("Token Not Found"));
      } else {
        print("Token: $data");
        _saveAuthLocal(action);
        store.dispatch(UserLoginSuccess(data));
        action.completer.complete(null);
      }
    }).catchError((error) {
      print(error);
      store.dispatch(UserLoginFailure(error));
    });

    next(action);
  };
}
