// Task's Model
class Task {
  final int? id;
  final int uid; // User's ID
  final bool concluded;
  final String title;
  final String description;
  final String local;
  final String date;
  final DateTime startTime;
  final DateTime endTime;
  final int priority;

  // Constructor
  const Task({
    this.id,
    required this.uid,
    required this.concluded,
    required this.title,
    required this.description,
    required this.local,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.priority,
  });

  // Task => Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'concluded': concluded ? 1 : 0,
      'title': title,
      'description': description,
      'local': local,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'priority': priority,
    };
  }

  // Map => Task
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      uid: map['uid'], 
      concluded: map['concluded'] == 1,
      title: map['title'], 
      description: map['description'],
      local: map['local'],
      date: map['date'], 
      startTime: map['startTime'], 
      endTime: map['endTime'],  
      priority: map['priority'],
    );
  }
}