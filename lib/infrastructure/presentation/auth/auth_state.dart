import 'package:flutter/widgets.dart';
import 'package:to_do_list/domain/entities/user.dart';
import 'package:to_do_list/domain/usecases/auth_usecases.dart';

class AuthProvider with ChangeNotifier {
  AuthProvider({ required this.useCases });
  final AuthUseCases useCases;

  User? _user;
  User? get user => _user;

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorName;
  String? get errorName => _errorName;

  String? _errorEmail;
  String? get errorEmail => _errorEmail;

  String? _errorPassword;
  String? get errorPassword => _errorPassword;

  bool validateLoginFields(String email, String password) {

    notifyListeners();

    return _errorEmail == null && _errorPassword == null;
  }

  Future<User?> login(String email, String password) async {
    try {
      return useCases.login(email, password);
    } catch(e) {
      return null;
    }
  }

  Future<User?> getUserByEmail(String email) async {
    try {
      return useCases.getUserByEmail(email);
    } catch(e) {
      return null;
    }
  }

  Future<int> addUser(User user) async {
    try {
      return useCases.addUser(user);
    } catch(e) {
      return 0;
    }
  }

  Future<int> deleteUser(int? id) async {
    try {
      return useCases.deleteUser(id);
    } catch(e) {
      return 0;
    }
  }

  Future<int> updateUser(User user) async {
    try {
      return useCases.updateUser(user);
    } catch(e) {
      return 0;
    }
  }
}