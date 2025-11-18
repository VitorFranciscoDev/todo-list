import 'package:to_do_list/domain/entities/user.dart';
import 'package:to_do_list/domain/repositories/auth_repository.dart';

class AuthUseCases {
  // Constructor
  const AuthUseCases({ required this.repository });
  final AuthRepository repository;

  // Validations
  String? validateName(String name) => name.isEmpty ? "Name cannot be blank" : null;
  String? validateEmail(String email) => !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email) ? "Email Invalid" : null;
  String? validatePassword(String password) => password.length < 8 ? "Password needs to have 8 characters" : null;

  // Repository
  // Login
  Future<User?> login(String email, String password) async {
    try {
      return await repository.login(email, password);
    } catch(e) {
      throw Exception("Error in Login Auth Use Cases: $e");
    }
  }

  // Get User By Email
  Future<User?> getUserByEmail(String email) async {
    try {
      return await repository.getUserByEmail(email);
    } catch(e) {
      throw Exception("Error in Get User By Email Auth Use Cases: $e");
    }
  }

  // Add User
  Future<int> addUser(User user) async {
    try {
      return await repository.addUser(user);
    } catch(e) {
      throw Exception("Error in Add User Auth Use Cases: $e");
    }
  }

  // Delete User
  Future<int> deleteUser(int? id) async {
    try {
      return await repository.deleteUser(id);
    } catch(e) {
      throw Exception("Error in Delete User Auth Use Cases: $e");
    }
  }

  // Update User
  Future<int> updateUser(User user) async {
    try {
      return await repository.updateUser(user);
    } catch(e) {
      throw Exception("Error in Update User Auth Use Cases: $e");
    }
  }
}