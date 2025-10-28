class Task {
  final int? id;
  final String name;
  final bool concluded;

  Task({ this.id, required this.name, required this.concluded });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'concluded': concluded,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      name: map['nome'], 
      concluded: map['concluded'],
    );
  }
}