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
            'assets/paintingstickman.png',
            fit: BoxFit.fill,
          ),
          Positioned(
            bottom: 20,
            left: 200,
            right: 200,
            child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/tasks'),
                child: const Text('Get Started')),
          ),
        ],
      ),
    );
  }
}
