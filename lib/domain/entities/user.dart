// User's Model
class User {
  final int? id;
  final String name;
  final String email;
  final String password;

  // Constructor
  const User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  // User => Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  // Map => User
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }
}