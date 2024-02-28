import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("paintingstickman.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/tasks'),
                  child: const Text('Get Started'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
