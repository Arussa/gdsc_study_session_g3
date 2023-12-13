import 'package:flutter/material.dart';
//import 'package: tskfour/tasks.dart';

// ignore: camel_case_types
class create_task extends StatelessWidget {
  const create_task({super.key});

/*Future<void> _selectDate(BuildContext context) async {
    final DateTime duedate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2024),
    );
    if (picked != null) {
     
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a New Task'),
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
            const TextField(
              decoration: InputDecoration(
                labelText: 'Main Task Name',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Due Date',
              ),
            ),
            const TextField(
              readOnly: true,
              //  onTap: () => duedate(context),
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              maxLines: 5,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
