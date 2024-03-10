// main.dart
import 'package:flutter/material.dart';
import 'login.dart';
import 'permissions.dart';
import 'schedule.dart';
import 'skills.dart';
import 'onoroff.dart';
import 'seven.dart';
import 'eight.dart';
import 'nine.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'C2L',
      theme: ThemeData(
          // This is the theme of your application.
          // ...
          ),
      // center this title
      home: const MyHomePage(title: 'C2L | Home Page'),
      routes: {
        '/second': (context) => const LoginPage(),
        '/third': (context) => const PermsPage(),
        '/fourth': (context) => const SchedPage(),
        '/fifth': (context) => const SkillsPage(),
        '/sixth': (context) => const OnorOffPage(),
        '/seventh': (context) => const SevenPage(),
        '/eight': (context) => const EightPage(),
        '/ninth': (context) => const NinePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _fadeAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_animationController);
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushNamed(context, '/second');
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _fadeAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: _fadeAnimation.value,
              child: child,
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Existing content
              // New image
              const SizedBox(height: 20.0),
              // Load our image from the images folder
              Image.asset(
                'images/logo_small.jpg',
                width: 400.0,
                height: 400.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
