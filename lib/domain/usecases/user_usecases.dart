import 'package:to_do_list/domain/entities/user.dart';
import 'package:to_do_list/domain/repositories/user_repository.dart';

class UserUseCases {
  const UserUseCases({ required this.repository });

  final UserRepository repository;

  Future<User?> login(String email, String password) async {
    try {
      return await repository.login(email, password);
    } catch(e) {
      throw Exception("Error in Login User Use Cases: $e");
    }
  }

  Future<User?> getUserByEmail(String email) async {
    try {
      return await repository.getUserByEmail(email);
    } catch(e) {
      throw Exception("Error in Get User By Email User Use Cases: $e");
    }
  }

  Future<int> addUser(User user) async {
    try {
      return await repository.addUser(user);
    } catch(e) {
      throw Exception("Error in Add User User Use Cases: $e");
    }
  }

  Future<int> deleteUser(int? id) async {
    try {
      return await repository.deleteUser(id);
    } catch(e) {
      throw Exception("Error in Delete User User Use Cases: $e");
    }
  }

  Future<int> updateUser(User user) async {
    try {
      return await repository.updateUser(user);
    } catch(e) {
      throw Exception("Error in Update User User Use Cases: $e");
    }
  }
}