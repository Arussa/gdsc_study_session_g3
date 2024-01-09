import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GDSC Bookstore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> books = [
    {
      'title': 'Rich Dad Poor Dad',
      'imageUrl':
          'https://th.bing.com/th/id/OIP.hUNBARsl5-RoOLD6hbhV2AHaLG?w=145&h=218&c=7&r=0&o=5&dpr=1.5&pid=1.7',
    },
    {
      'title': 'Yeteqolefebet qulif',
      'imageUrl': 'https://pictures.abebooks.com/isbn/9780615816999-us.jpg',
    },
    {
      'title': 'Yetewega Lib',
      'imageUrl':
          'https://th.bing.com/th/id/R.eb86e9d73d77618b47390721572c117a?rik=l5wnzSvX%2fXaPoA&riu=http%3a%2f%2fwww.mereb.shop%2fImage%2fProduct%2f49435409%2f49435409-84-903-large.jpg&ehk=T%2ftqAueIhArjco4qeZMRFkBLZVNPzrQsB2LpMKJoJ2I%3d&risl=&pid=ImgRaw&r=0',
    },
    {
      'title': 'Lela Sew',
      'imageUrl':
          'https://th.bing.com/th/id/OIP.cba6L5OEShuubf3AJwYT1AAAAA?w=115&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7',
    },
  ];

  HomePage({super.key});

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
                    // Filter functionality
                  },
                ),
                const SizedBox(
                  width: 430.0,
                  height: 200.0,
                  child: Card(
                    color: Colors.blue,
                    elevation: 1.0,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(265.0, 1.0, 3.0, 0.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sep 23, 2023',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(70.0, 3.0, 50, 0.0),
                          child: Row(
                            children: [
                              Icon(Icons.pause,
                                  color: Colors.white, size: 25.0),
                              SizedBox(width: 27.0),
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 15, 5, 5),
                                child: Text(
                                  'Today a reader \n tomorrow a',
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Color.fromRGBO(225, 225, 221, 1),
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.09,
                                  ),
                                ),
                              ),
                              SizedBox(width: 40.0),
                              Icon(Icons.pause, color: Colors.white, size: 38.0)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30.0, 0.0, 40.0, 0.0),
                          child: Text(
                            'LEADER',
                            style: TextStyle(
                              fontSize: 45.0,
                              color: Color.fromRGBO(248, 248, 247, 1),
                              fontWeight: FontWeight.w400,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var book in books)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: BookListItem(
                        title: book['title']!,
                        imageUrl: book['imageUrl']!,
                      ),
                    ),
                ],
              ),
            ),
            const Text('New'),
            const SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var book in books)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: BookListItem(
                        title: book['title']!,
                        imageUrl: book['imageUrl']!,
                      ),
                    ),
                ],
              ),
            ),
            const Text('Trending'),
            const SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var book in books)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: BookListItem(
                        title: book['title']!,
                        imageUrl: book['imageUrl']!,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookListItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  const BookListItem({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
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
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Functionality for category
      },
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
