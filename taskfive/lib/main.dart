import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<String> bookTitles = [
    'Rich Dad Poor Dad',
    'Yeteqolefebet qulif',
    'Yetewega Lib',
    'Lela Sew'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Menu functionality
          },
        ),
        title: const Text('GDSC Bookstore'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Filter functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {},
            ),
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

class BookListItem extends StatelessWidget {
  final String title;
  const BookListItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://via.placeholder.com/150',
            height: 120,
            width: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
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
