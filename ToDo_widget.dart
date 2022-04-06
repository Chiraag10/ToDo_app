// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modal/myToDo.dart';
import 'package:todo_app/provider/ToDo.dart';

import '../pages/editToDo.dart';

// ----------------------- ToDo Card Content ----------------------------------
class ToDoWidget extends StatelessWidget {
  const ToDoWidget({Key? key, required this.todo}) : super(key: key);
  final MyToDo todo;

  @override
  Widget build(BuildContext context) {
  // -------------------- Slidable action for ToDo Card ------------------------  
    return Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(motion: const ScrollMotion(), children: [
     // --------------------- Edit Slidable in ToDo Card -----------------------     
          SlidableAction(
            onPressed: (BuildContext context) => editToDo(context, todo),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ]),
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
      // ------------------------ Delete Slidable in ToDo Card -------------------    
          SlidableAction(
            onPressed: (BuildContext context) => deleteToDo(context, todo),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ]),
        child: buildToDo(context));
  }

  Widget buildToDo(BuildContext context) => GestureDetector(
        onTap: () => editToDo(context, todo),
      // ----------------------- ToDo Card Body -------------------------------  
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Checkbox(
                activeColor: Colors.orange,
                checkColor: Colors.white,
                value: todo.isDone,
                onChanged: (_) {
                  final provider =
                      Provider.of<ToDoProvider>(context, listen: false);
                  final isDone = provider.toggleToDoStatus(todo);

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: isDone
                          ? const Text('Task Completed')
                          : const Text('Task marked Incomplete')));
                },
              ),
              const SizedBox(height: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 22,
                      ),
                    ),
                    if (todo.description.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          todo.description,
                          style: const TextStyle(fontSize: 20.0, height: 1.5),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

// ---------------------------- Delete ToDo Function ---------------------------

  void deleteToDo(BuildContext context, MyToDo todo) {
    final provider = Provider.of<ToDoProvider>(context, listen: false);
    provider.removeTodo(todo);

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Your ToDo is Deleted')));
  }

  void editToDo(BuildContext context, MyToDo todo) {
    showDialog(
      context: context,
      
      builder: (BuildContext context) => EditToDoPage(toDo: todo),
    );
  }
}
