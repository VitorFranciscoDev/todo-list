import 'package:to_do_list/domain/entities/user.dart';
import 'package:to_do_list/domain/repositories/auth_repository.dart';

class AuthUseCases {
  const AuthUseCases({ required this.repository });

  final AuthRepository repository;

  Future<User?> login(String email, String password) async {
    try {
      return await repository.login(email, password);
    } catch(e) {
      throw Exception("Error in Login Auth Use Cases: $e");
    }
  }

  Future<User?> getUserByEmail(String email) async {
    try {
      return await repository.getUserByEmail(email);
    } catch(e) {
      throw Exception("Error in Get User By Email Auth Use Cases: $e");
    }
  }

  Future<int> addUser(User user) async {
    try {
      return await repository.addUser(user);
    } catch(e) {
      throw Exception("Error in Add User Auth Use Cases: $e");
    }
  }

  Future<int> deleteUser(int? id) async {
    try {
      return await repository.deleteUser(id);
    } catch(e) {
      throw Exception("Error in Delete User Auth Use Cases: $e");
    }
  }

  Future<int> updateUser(User user) async {
    try {
      return await repository.updateUser(user);
    } catch(e) {
      throw Exception("Error in Update User Auth Use Cases: $e");
    }
  }
}