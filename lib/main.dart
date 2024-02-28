import 'package:flutter/material.dart';
import 'createtask.dart';
import 'taskdetail.dart';
import 'tasklist.dart';
import 'home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/tasks': (context) => const TasksPage(),
        '/create-task': (context) => const CreateTaskPage(),
        '/task-detail': (context) => const TaskDetailPage(),
      },
    );
  }
}
