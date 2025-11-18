import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/domain/entities/user.dart';
import 'package:to_do_list/domain/usecases/auth_usecases.dart';

// Auth State
class AuthProvider with ChangeNotifier {
  // Constructor
  AuthProvider({ required this.useCases }) { loadUser(); }
  final AuthUseCases useCases;

  // Shared Preferences Key
  static const userKey = "user";

  // App's User
  User? _user;
  User? get user => _user;

  // Is Initialized Boolean
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  // Setter Function
  void _setInitialized(bool initialized) {
    _isInitialized = initialized;
    notifyListeners();
  }

  // Is Loading Boolean
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Setter Function
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Errors
  String? _errorName;
  String? get errorName => _errorName;

  String? _errorEmail;
  String? get errorEmail => _errorEmail;

  String? _errorPassword;
  String? get errorPassword => _errorPassword;

  // Login Validation
  bool validateLoginFields(String email, String password) {
    _errorEmail = useCases.validateEmail(email);
    _errorPassword = useCases.validatePassword(password);

    notifyListeners();

    return _errorEmail == null && _errorPassword == null;
  }

  // Register Validation
  bool validateRegisterFields(String name, String email, String password) {
    _errorName = useCases.validateName(name);
    _errorEmail = useCases.validateEmail(email);
    _errorPassword = useCases.validatePassword(password);
    
    notifyListeners();

    return _errorName == null && _errorEmail == null && _errorPassword == null;
  }

  // Clear Errors
  void clearErrors() {
    _errorName = null;
    _errorEmail = null;
    _errorPassword = null;

    notifyListeners();
  }

  // Load User from Shared Preferences
  Future<void> loadUser() async {
    _setInitialized(true);

    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = prefs.getString(userKey);

      if(userData != null) {
        final userMap = jsonDecode(userData);
        _user = User.fromMap(userMap);
      }
    } catch(e) {
      _user = null;
    } finally {
      _setInitialized(false);
    }
  }

  // Use Cases
  // Login in App
  Future<User?> login(String email, String password) async {
    _setLoading(true);
    
    try {
      _user = await useCases.login(email, password);

      if(_user != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(userKey, jsonEncode(_user!.toMap()));
      }

      return _user;
    } catch(e) {
      return null;
    } finally {
      _setLoading(false);
    }
  }

  // Get User By Email [Register Validation]
  Future<User?> getUserByEmail(String email) async {
    try {
      return useCases.getUserByEmail(email);
    } catch(e) {
      return null;
    }
  }

  // Add User in DB
  Future<int> addUser(User user) async {
    try {
      return useCases.addUser(user);
    } catch(e) {
      return 0;
    }
  }

  // Delete User from DB
  Future<int> deleteUser(int? id) async {
    try {
      return useCases.deleteUser(id);
    } catch(e) {
      return 0;
    }
  }

  // Update User from DB
  Future<int> updateUser(User user) async {
    try {
      return useCases.updateUser(user);
    } catch(e) {
      return 0;
    }
  }
}