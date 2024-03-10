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
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          // ...
          ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/second': (context) => LoginPage(),
        '/third': (context) => PermsPage(),
        '/fourth': (context) => SchedPage(),
        '/fifth': (context) => SkillsPage(),
        '/sixth': (context) => OnorOffPage(),
        '/seventh': (context) => SevenPage(),
        '/eight': (context) => EightPage(),
        '/ninth': (context) => NinePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is the Home Page',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Text('Go to Second Page'),
            ),
          ],
        ),
      ),
    );
  }
}
