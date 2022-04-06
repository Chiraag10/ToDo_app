// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/widget/Add_Todo.dart';
import 'package:todo_app/widget/ToDo_list.dart';
import 'package:todo_app/modal/Completed_list.dart';

class ToDo_home extends StatefulWidget {
  const ToDo_home({Key? key}) : super(key: key);

  @override
  State<ToDo_home> createState() => _ToDo_homeState();
}

class _ToDo_homeState extends State<ToDo_home> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
   // -------------------------- Body of ToDo App Content Tabs ------------------ 
    final tabs = [ToDo_list(), Completed_list()];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text(ToDo.title),
      ),
      //-------------------- Bottom Navigation Bar -----------------------------
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          selectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined),
              label: 'ToDos',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.done,
                size: 30.0,
              ),
              label: 'Completed',
            ),
          ]),
      //------------------------------- Application Body -----------------------
      body: tabs[_selectedIndex],
      //------------------------- Floating Action Button ----------------------
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        backgroundColor: Colors.orange,
        child: const Icon(
          Icons.add,
          size: 30.0,
        ),
        onPressed: () {
          setState(() {
            // -------------------------- ToDo Card Container Popup ----------------
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) => const Add_Todo());
          });
        },
      ),
    );
  }
}
