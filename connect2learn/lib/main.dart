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
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
//shamble
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
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
