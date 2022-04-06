import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/modal/myToDo.dart';
import 'package:todo_app/provider/ToDo.dart';

import 'package:todo_app/widget/ToDoForm.dart';

// ------------------------- Edit ToDo Content ---------------------------------

class EditToDoPage extends StatefulWidget {
  const EditToDoPage({Key? key, required this.toDo}) : super(key: key);

  final MyToDo toDo;

  @override
  State<EditToDoPage> createState() => _EditToDoPageState();
}

class _EditToDoPageState extends State<EditToDoPage> {
  final _formKey = GlobalKey<FormState>();

  String title = '';
  String description = '';

  @override
  void initState() {
    super.initState();
    title = widget.toDo.title;
    description = widget.toDo.description;
  }

  @override
  Widget build(BuildContext context) {
  //--------------- ToDo Card To be Edited ----------------------------------  
    return AlertDialog(
      content: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Edit ToDo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                IconButton(
                  color: Colors.grey,
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    final provider =
                        Provider.of<ToDoProvider>(context, listen: false);
                    provider.removeTodo(widget.toDo);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          // ------------------ ToDo Form -------------------------------------  
            Form(
              key: _formKey,
              child: ToDoForm(
                  title: title,
                  description: description,
                  onChangedTitle: (title) => setState(() => this.title = title),
                  onChangedDescription: (description) =>
                      setState((() => this.description = description)),
                  onChangedTodo: saveToDo),
            ),
          ],
        ),
      ),
    );
  }
//---------------------------- Function executed on Todo Saved ----------------- 
  void saveToDo() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<ToDoProvider>(context, listen: false);
      provider.updateToDo(widget.toDo, title, description);
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Your ToDo is Updated', style: TextStyle(letterSpacing: 1.0),)));
    }
  }
}
