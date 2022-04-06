// ignore_for_file: file_names, camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:todo_app/provider/ToDo.dart';

import 'package:todo_app/widget/ToDo_widget.dart';

//--------------------- ToDo Home Screen List ----------------------------------

class ToDo_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ToDoProvider>(context);
    final todos = provider.todos;
    return todos.isEmpty 
      ? const Center(child: Text('Add Todos', style: TextStyle(fontSize: 20.0)),)  

    : ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      separatorBuilder: (context, index)=> const SizedBox(height: 8.0,),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return ToDoWidget(todo: todo);
      },
    );
  }
}
