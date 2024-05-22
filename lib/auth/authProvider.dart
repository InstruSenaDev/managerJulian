// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../services/localStorage.dart';
import '../routes/router.dart';
import '../services/navigationService.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.checking;

  bool scrim = false;

  AuthProvider() {
    isAuthnticated();
  }

  isAuthnticated() async {
    print('------------->');
    await LocalStorage.configurePrefs();
    final id = LocalStorage.prefs.getString('id');

    if (id == null) {
      authStatus = AuthStatus.notAuthenticated;
    } else {
      authStatus = AuthStatus.authenticated;
    }

    notifyListeners();
    return false;
  }

  cambioEstado() {
    authStatus = AuthStatus.authenticated;
    NavigationService.replaceTo(Flurorouter.dashboardRoute);

    LocalStorage.prefs.setString('id', '1');
    notifyListeners();
  }

  logout() {
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}

//LocalStorage.prefs.getString('token');
