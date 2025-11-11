class Task {
  final int? id;
  final int? uid;
  final String color;
  final String title;
  final String desc;
  final DateTime startTime;
  final DateTime endTime;
  final String local;
  final int priority;

  const Task({
    this.id,
    this.uid,
    required this.color,
    required this.title,
    required this.desc,
    required this.startTime,
    required this.endTime,
    required this.local,
    required this.priority,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'color': color,
      'title': title,
      'desc': desc,
      'startTime': startTime,
      'endTime': endTime,
      'local': local,
      'priority': priority,
    };
  }

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      uid: map['uid'],
      color: map['color'], 
      title: map['title'], 
      desc: map['desc'], 
      startTime: map['startTime'], 
      endTime: map['endTime'], 
      local: map['local'], 
      priority: map['priority'],
    );
  }
}