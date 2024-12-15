import 'package:flutter/material.dart';
import 'package:trabalho_pos_flutter/src/features/login/models/user_model.dart';
import 'package:trabalho_pos_flutter/src/features/login/services/login_database_helper.dart';

class LoginProvider with ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<bool> login(User user) async {
    bool validUser = await LoginDatabaseHelper.instance.validateUser(user);
    _isAuthenticated = validUser;
    notifyListeners();
    return validUser;
  }

  Future<void> registerUser(User user) async {
    await LoginDatabaseHelper.instance.insertUser(user);
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
