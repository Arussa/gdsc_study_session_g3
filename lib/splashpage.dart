import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:tskfour/tasks.dart';

// ignore: camel_case_types
class splashpage extends StatelessWidget {
  const splashpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/paintingstickman.png',
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/tasks'),
              child: const Text('Get Started'),
            ),
          ),
        ],
      ),
    );
  }
}
