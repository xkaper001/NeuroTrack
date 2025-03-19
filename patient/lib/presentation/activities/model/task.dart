
import 'dart:convert';

class Task {
  String title;
  bool isCompleted;
  DateTime date;
  Task({
    required this.title,
    required this.isCompleted,
    required this.date,
  });

  

  Task copyWith({
    String? title,
    bool? isCompleted,
    DateTime? date,
  }) {
    return Task(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isCompleted': isCompleted,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      isCompleted: map['isCompleted'] as bool,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Task(title: $title, isCompleted: $isCompleted, date: $date)';

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.isCompleted == isCompleted &&
      other.date == date;
  }

  @override
  int get hashCode => title.hashCode ^ isCompleted.hashCode ^ date.hashCode;
}
