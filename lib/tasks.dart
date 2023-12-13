import 'package:flutter/material.dart';

class TodoItem {
  String title;
  bool isDone;
  int date;
  String description;

  TodoItem({
    required this.title,
    this.isDone = false,
    this.date = 0,
    this.description = '',
  });
}

class TaskWidget extends StatelessWidget {
  final TodoItem todoItem;

  const TaskWidget(this.todoItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todoItem.title),
      subtitle: Text(todoItem.description),
    );
  }
}

class Tasks extends StatelessWidget {
  final List<TodoItem> todoList;

  const Tasks({super.key, required this.todoList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Image.asset('assets/images/stickmanholdingtodolist.jpeg'),
          Expanded(
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return TaskWidget(todoList[index]);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/createtask'),
            child: const Text('Create Task'),
          ),
        ],
      ),
    );
  }
}
