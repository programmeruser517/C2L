import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
          // Define your app's theme here
          ),
      initialRoute: '/', // Set the initial route
      routes: {
        '/callback': (context) => MyHomePage(), // Define your home route
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // empty
    return Container();
  }
}
