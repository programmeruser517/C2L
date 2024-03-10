import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
          // Define your app's theme here
          ),
      initialRoute: '/', // Set the initial route
      routes: {
        '/callback': (context) => const MyHomePage(), // Define your home route
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // empty
    return Container();
  }
}
