import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/blocs/znews.dart';
import 'package:newsapp/blocs/newsevents.dart';
import 'package:newsapp/pages/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    BlocProvider.of<ZNews>(context).add(StartEvent());
    setState(() {
      _isLoading = false;
    });
    _navigateToHomePage();
  }

  void _navigateToHomePage() {
    if (!_isLoading) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => const HomePage(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: width * 0.6,
          height: width * 0.6,
          child: Image.asset(
            "assets/news.jpeg",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
