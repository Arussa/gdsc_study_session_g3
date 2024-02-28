import 'package:flutter/material.dart';
import 'new.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();
  String _displayText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Display App'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Enter text',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _displayText = _textController.text;
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => New(
                            _displayText,
                            displayedone: _textController.text,
                          )));
            },
            child: const Text('Next'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
