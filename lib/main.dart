// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:tskfour/splashpage.dart';
import 'package:tskfour/tasks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var someTodoList;
    return MaterialApp(
      home: const splashpage(),
      routes: {
        '/tasks': (context) => Tasks(todoList: someTodoList),
      },
    );
  }
}
