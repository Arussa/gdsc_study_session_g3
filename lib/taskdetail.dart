import 'package:flutter/material.dart';

class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Detail'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/ladywiztodoboardandabag.png',
            ),
          ),
          const Text('Title'),
          Container(
              decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 25.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          )),
          const Text('Description'),
          const ListTile(
            title: Text('my description'),
          ),
        ],
      ),
    );
  }
}
