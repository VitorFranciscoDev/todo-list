import 'package:flutter/widgets.dart';
import 'package:to_do_list/domain/entities/user.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  User? get user => _user;

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _validName = true;
  bool get validName => _validName;

  bool _validEmail = true;
  bool get validEmail => _validEmail;

  bool _validPassword = true;
  bool get validPassword => _validPassword;

  void validateLoginFields(String email, String password) {
    

    notifyListeners();
  }
}