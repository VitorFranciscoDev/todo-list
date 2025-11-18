import 'package:to_do_list/domain/entities/user.dart';
import 'package:to_do_list/domain/repositories/auth_repository.dart';
import 'package:to_do_list/infrastructure/database/database.dart';

// Auth Repository Implementation
class SQLiteAuthRepository implements AuthRepository {
  final database = ToDoListDatabase();

  // Query in DB [Email and Password]
  @override
  Future<User?> login(String email, String password) async {
    try {
      final db = await database.database;

      final user = await db.query(
        'users',
        where: 'email = ? AND password = ?',
        whereArgs: [email, password],
      );

      return User.fromMap(user.first);
    } catch(e) {
      throw Exception("Error in Login SQLite Auth Repository: $e");
    }
  }

  // Query in DB [Email]
  @override
  Future<User?> getUserByEmail(String email) async {
    try {
      final db = await database.database;

      final user = await db.query(
        'users',
        where: 'email = ?',
        whereArgs: [email],
      );

      return User.fromMap(user.first);
    } catch(e) {
      throw Exception("Error in Get User By Email SQLite Auth Repository: $e");
    }
  }

  // Add User in DB
  @override
  Future<int> addUser(User user) async {
    try {
      final db = await database.database;

      return await db.insert('users', user.toMap());
    } catch(e) {
      throw Exception("Error in Add User SQLite Auth Repository: $e");
    }
  }

  // Delete User from DB
  @override
  Future<int> deleteUser(int? id) async {
    try {
      final db = await database.database;

      return await db.delete(
        'users',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch(e) {
      throw Exception("Error in Delete User SQLite Auth Repository: $e");
    }
  }

  // Update User in DB
  @override
  Future<int> updateUser(User user) async {
    try {
      final db = await database.database;

      return await db.update(
        'users', 
        user.toMap(),
        where: 'id = ?',
        whereArgs: [user.id],
      );
    } catch(e) {
      throw Exception("Error in Update User SQLite Auth Repository: $e");
    }
  }
}