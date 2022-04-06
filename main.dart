import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/pages/ToDo_home.dart';
import 'package:todo_app/provider/ToDo.dart';

void main() {
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({Key? key}) : super(key: key);
  static const String title = "ToDo App";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ToDoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: const Color(0xff8a2be2),
          scaffoldBackgroundColor: const Color(0xfff6f5ee),
          inputDecorationTheme: const InputDecorationTheme(
            floatingLabelStyle: TextStyle(color: Color(0xff8a2be2)),
          ),
        ),
        home: const ToDo_home(),
      ),
    );
  }
}
