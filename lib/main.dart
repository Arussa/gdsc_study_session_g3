// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:tskfour/splashpage.dart';
// ignore: unused_import
import 'package:tskfour/tasks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /* var someTodoList = <TodoItem>[
      TodoItem(title: 'Task 1'),
      TodoItem(title: 'Task 2'),
    ];*/
    return const MaterialApp(
      home: SplashPage(),
      routes: {
        // '/': (context) => const SplashPage(),
        // '/tasks': (context) => Tasks(todoList: someTodoList),
      },
    );
  }
}
