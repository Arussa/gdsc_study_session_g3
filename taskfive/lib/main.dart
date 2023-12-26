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
              // Add menu icon functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Search Bar'), // Placeholder for search bar widget
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.filter),
                  onPressed: () {
                    // Add filter icon functionality
                  },
                ),
                const Text(
                    'Video Player'), // Placeholder for video player widget
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.bookmark),
                      onPressed: () {
                        // Add bookmark icon functionality
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {
                        // Add share icon functionality
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.translate),
                      onPressed: () {
                        // Add translate icon functionality
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
            // Placeholder for slideshow widget with book recommendations
            const Text('New'),
            const SizedBox(height: 8.0),
            // Placeholder for slideshow widget with new books
            const Text('Trending'),
            const SizedBox(height: 8.0),
            // Placeholder for slideshow widget with trending books
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
        // Add functionality for category button
      },
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
