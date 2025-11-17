// Task's Model
class Task {
  final int? id;
  final int? uid; // User's ID
  final String color;
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final String local;
  final int priority;

  // Constructor
  const Task({
    this.id,
    this.uid,
    required this.color,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.local,
    required this.priority,
  });

  // Task => Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'color': color,
      'title': title,
      'description': description,
      'startTime': startTime,
      'endTime': endTime,
      'local': local,
      'priority': priority,
    };
  }

  // Map => Task
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      uid: map['uid'],
      color: map['color'], 
      title: map['title'], 
      description: map['description'], 
      startTime: map['startTime'], 
      endTime: map['endTime'], 
      local: map['local'], 
      priority: map['priority'],
    );
  }
}