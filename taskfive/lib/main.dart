import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GDSC Bookstore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GDSC Bookstore'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              //  menu functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Search Bar'),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.filter),
                  onPressed: () {
                    //  filter functionality
                  },
                ),
                const Text('Video Player'),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.bookmark),
                      onPressed: () {
                        //  bookmark functionality
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {
                        //  share functionality
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.translate),
                      onPressed: () {
                        // translate functionality
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text('Categories'),
            const SizedBox(height: 8.0),
            const Wrap(
              spacing: 8.0,
              children: [
                CategoryButton(label: 'Health', icon: Icons.favorite),
                CategoryButton(label: 'Technology', icon: Icons.computer),
                CategoryButton(label: 'Philosophy', icon: Icons.lightbulb),
                CategoryButton(label: 'Science', icon: Icons.science),
                CategoryButton(label: 'History', icon: Icons.history),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text('Recommendation'),
            const SizedBox(height: 8.0),
            const Text('New'),
            const SizedBox(height: 8.0),
            const Text('Trending'),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const CategoryButton({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        //  functionality for category
      },
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
