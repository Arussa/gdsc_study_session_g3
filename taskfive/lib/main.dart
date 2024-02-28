import 'package:flutter/material.dart';
import 'animate.dart'; // Import the animate.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp();

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
          'https://th.bing.com/th/id/R.eb86e9d73d77618b47390721572c117a?rik=l5wnzSvX%2fXaPoA&riu=http%3a%2f%2fwww.mereb.shop%2fImage%2fProduct%2f49435409%2f49435409-84-903-large.jpg&ehk=T%2ftqAueIhArjco4qeZMRFkBLZVNPzrQsB2LpMKJoJ2I%3d&risl=&pid=ImgRaw',
    },
    {
      'title': 'Lela Sew',
      'imageUrl':
          'https://th.bing.com/th/id/OIP.cba6L5OEShuubf3AJwYT1AAAAA?w=115&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7',
    },
  ];

  // ignore: use_key_in_widget_constructors
  HomePage();

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
                  BookIconAnimation(), // Use BookIconAnimation widget for animation
                  for (var i = 0; i < books.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: BookItem(
                        title: books[i]['title']!,
                        imageUrl: books[i]['imageUrl']!,
                        delay: Duration(milliseconds: 200 * i),
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

class BookItem extends StatefulWidget {
  final String title;
  final String imageUrl;
  final Duration delay;

  const BookItem({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.delay,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BookItemState createState() => _BookItemState();
}

class _BookItemState extends State<BookItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    Future.delayed(widget.delay, () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SizedBox(
        width: 150,
        child: Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.imageUrl,
                height: 120,
                width: 150,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
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
