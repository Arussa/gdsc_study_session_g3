import 'package:flutter/material.dart';

// ignore: camel_case_types
class taskdetail extends StatelessWidget {
  const taskdetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Detail'),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/ladywiztodoboard.png'),
            const Text('Title: ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Task Name'),
            const Text('Description: ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('This is a detailed description of the task.'),
            const Text('Deadline: ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('2023-12-15'),
          ],
        ),
      ),
    );
  }
}
