// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ToDoForm extends StatelessWidget {
  const ToDoForm(
      {Key? key,
      this.title = '',
      this.description = '',
      required this.onChangedTitle,
      required this.onChangedDescription,
      required this.onChangedTodo})
      : super(key: key);

  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onChangedTodo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(),
        const SizedBox(height: 8.0),
        buildDescription(),
        const SizedBox(
          height: 15.0,
        ),
        buildButton(),
      ],
    );
  }

// -------------------------- Widget for Title ---------------------------------
  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title!.isEmpty) {
            return 'The Title Cannot be Empty';
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: "Title",
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2.0, color: Color(0xff8a2be2)),
          ),
          border: UnderlineInputBorder(),
        ),
      );

  // ----------------------------- Widget for Description ----------------------

  Widget buildDescription() => TextFormField(
        maxLines: 5,
        initialValue: description,
        onChanged: onChangedDescription,
        decoration: const InputDecoration(
          labelText: 'Description',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 2.0,
              color: Color(0xff8a2be2),
            ),
          ),
          border: UnderlineInputBorder(),
        ),
      );

  // ---------------------------- Widget for Save Button -----------------------

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
          ),
          onPressed: onChangedTodo,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text("Save",
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 15,
                )),
          ),
        ),
      );
}
