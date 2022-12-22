import 'package:flutter/material.dart';

import 'user.dart';

class ProfileManager extends ChangeNotifier {
  User get getUser => User(
        name: 'Irvandra Dwidya Agsatra',
        profileImageUrl: 'assets/irvandra.jpg',
        darkMode: _darkMode,
      );

  bool get didSelectUser => _didSelectUser;
  bool get darkMode => _darkMode;

  var _didSelectUser = false;
  var _darkMode = false;

  set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }

  void tapOnProfile(bool selected) {
    _didSelectUser = selected;
    notifyListeners();
  }
}
