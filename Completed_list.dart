// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/ToDo.dart';

import '../widget/ToDo_widget.dart';

// ---------------------------- Completed ToDo Container Tab -------------------

class Completed_list extends StatelessWidget {
  const Completed_list({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ToDoProvider>(context);
    final todos = provider.todosCompleted;
    return todos.isEmpty
        ? const Center(
            child: Text('Complete a ToDo', style: TextStyle(fontSize: 20.0)),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            separatorBuilder: (context, index) => const SizedBox(
              height: 8.0,
            ),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ToDoWidget(todo: todo); // ToDo Card
            },
          );
  }
}
