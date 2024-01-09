import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    setState(() {
      _isAnimating = true;
    });

    _animationController.reset();
    _animationController.forward();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isAnimating = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedOpacity(
            opacity: _isAnimating ? _animation.value : 1.0,
            duration: const Duration(milliseconds: 500),
            child: Image.asset(
              'assets/paintingstickman.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 200,
            right: 200,
            child: ElevatedButton(
              onPressed: () {
                _startAnimation();
                Navigator.pushNamed(context, '/tasks');
              },
              child: const Text('Get Started'),
            ),
          ),
        ],
      ),
    );
  }
}
