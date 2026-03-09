class Todo {
  int? id;
  String title;
  int isCompleted; // 0 = incomplete
  // 1 = complete
  String date;

  // Constructor
  Todo({
    this.id,
    required this.title,
    this.isCompleted = 0, // Default incomplete
    required this.date,
  });

  // Todo → Map (Database ko dena)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
      'date': date,
    };
  }

  // Map → Todo (Database se lena)
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      isCompleted: map['isCompleted'],
      date: map['date'],
    );
  }
}