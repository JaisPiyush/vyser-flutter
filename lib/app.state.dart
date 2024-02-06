import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  Locale locale = const Locale('hi');
  bool isAuthenticated = false;

  void setLocale(Locale l) {
    locale = l;
    notifyListeners();
  }

  void setIsAuthenticated(bool value) {
    isAuthenticated = value;
    notifyListeners();
  }
}
