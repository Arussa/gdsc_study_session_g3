import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo List',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Image.asset(
              'assets/stickmanholdingtodolist.jpeg',
              width: 300,
              height: 280,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Tasks List',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5.0),
            ListTile(
              title: const Text('UI/UX App'),
              subtitle: const Text('Design'),
              trailing: const Text('April. 29, 2023'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: const BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            ListTile(
              title: const Text('UI/UX App'),
              subtitle: const Text('Design'),
              trailing: const Text('April. 29, 2023'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: const BorderSide(
                  color: Colors.grey,
                  width: 5.0,
                ),
              ),
            ),
            ListTile(
              title: const Text('View Candidates'),
              trailing: const Text('April. 29, 2023'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: const BorderSide(
                  color: Colors.grey,
                  width: 5.0,
                ),
              ),
            ),
            ListTile(
              title: const Text('Football cu'),
              subtitle: const Text('Dribbling'),
              trailing: const Text('April. 29, 2023'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: const BorderSide(
                  color: Colors.grey,
                  width: 5.0,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/create-task');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 238, 117, 4),
                foregroundColor: Colors.white,
              ),
              child: const Text('Create Task'),
            ),
          ],
        ),
      ),
    );
  }
}
