// ignore_for_file: file_names
import 'package:flutter/material.dart';

import 'package:todo_app/modal/myToDo.dart';

// --------------------------- Add ToDo content using Provider ----------------- 

class ToDoProvider extends ChangeNotifier {
  final List<MyToDo> _todos = [
    MyToDo(createdTime: DateTime.now(), title: 'Walk A Dog'),
    MyToDo(createdTime: DateTime.now(), title: 'Plan Jacobs Birthday Party'),
    MyToDo(
        createdTime: DateTime.now(),
        title: 'Plan Jacobs Birthday Party',
        description: '''- Eggs
        - Milk
        - Bread
        - Water
        '''),
    MyToDo(
        createdTime: DateTime.now(),
        title: 'plan A family trip to Norway',
        description: '''- Rent a Car
        - Pack Suitcase
        '''),
  ];

// ----------------------- List of ToDos to be Completed ----------------------
  List<MyToDo> get todos =>
      _todos.where((todo) => todo.isDone == false).toList();

// ------------------------ List of Completed ToDos ----------------------------
  List<MyToDo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

//------------------- Function to Add ToDos ------------------------------------
  void addTodo(MyToDo todo) {
    _todos.add(todo);
    notifyListeners();
  }

// ------------------------ Function to Remover ToDos --------------------------
  void removeTodo(MyToDo todo) {
    _todos.remove(todo);
    notifyListeners();
  }
// -------------------------- Function to Toggle between ToDo Tabs -------------
  bool toggleToDoStatus(MyToDo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

// -------------------------  Function to Update ToDos -------------------------
  void updateToDo(MyToDo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}
