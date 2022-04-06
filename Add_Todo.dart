// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/modal/myToDo.dart';
import 'package:todo_app/provider/ToDo.dart';
import 'ToDoForm.dart';

// ------------------------- Add ToDo Card ------------------------------------

class Add_Todo extends StatefulWidget {
  const Add_Todo({Key? key}) : super(key: key);

  @override
  State<Add_Todo> createState() => _Add_TodoState();
}

class _Add_TodoState extends State<Add_Todo> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    //------------------------- ToDo Card Container ------------------------------

    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Add ToDo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  color: Colors.grey,
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            ToDoForm(
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onChangedTodo: addTodo,
            )
          ],
        ),
      ),
    );
  }
// -------------------------- Add ToDo function --------------------------------
  void addTodo() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      final todo = MyToDo(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
      );

      final provider = Provider.of<ToDoProvider>(context, listen: false);
      provider.addTodo(todo);
      Navigator.pop(context);
    }
  }
}
