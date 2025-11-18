// Task's Model
class Task {
  final int? id;
  final int uid; // User's ID
  final String title;
  final String description;
  final String date;
  final DateTime startTime;
  final DateTime endTime;
  final String local;
  final int priority;

  // Constructor
  const Task({
    this.id,
    required this.uid,
    required this.title,
    required this.description,
    required this.date,
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
      'title': title,
      'description': description,
      'date': date,
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
      title: map['title'], 
      description: map['description'],
      date: map['date'], 
      startTime: map['startTime'], 
      endTime: map['endTime'], 
      local: map['local'], 
      priority: map['priority'],
    );
  }
}