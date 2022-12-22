import 'dart:async';
import 'package:flutter/material.dart';
import 'app_cache.dart';

class UnilaTab {
  static const int dashboard = 0;
  static const int lembaga = 1;
  static const int matkul = 2;
}

class AppStateManager extends ChangeNotifier {
  bool _loggedIn = false;
  int _selectedTab = UnilaTab.dashboard;
  final _appCache = AppCache();

  bool get isLoggedIn => _loggedIn;
  int get getSelectedTab => _selectedTab;

  Future<void> initializeApp() async {
    _loggedIn = await _appCache.isUserLoggedIn();
  }

  void login(String username, String password) async {
    _loggedIn = true;
    await _appCache.cacheUser();
    notifyListeners();
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  void goToLembaga() {
    _selectedTab = UnilaTab.lembaga;
    notifyListeners();
  }

  void logout() async {
    _loggedIn = false;
    _selectedTab = 0;

    await _appCache.invalidate();
    await initializeApp();
    notifyListeners();
  }
}
