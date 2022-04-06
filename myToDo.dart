

// ignore_for_file: file_names

// ------------------ ToDo Title, Description content -------------------------
class ToDoField {
  static const createdTime = 'Created Time';
}

class MyToDo {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  MyToDo({
    required this.createdTime,
    required this.title,
    this.description = '',
    this.id = '',
    this.isDone = false
  });
}
