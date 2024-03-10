import 'package:flutter/material.dart';
import 'eight.dart';
import 'nine.dart' ;
class SevenPage extends StatelessWidget {
  const SevenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context)=>const NinePage())
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 44, 67, 217), // background
                foregroundColor: Colors.white, // foreground
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Text(
                'Code',
                style: TextStyle(fontSize: 20),
            ),
          ),
              
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                print('Link button clicked');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 44, 67, 217), // background
                foregroundColor: Colors.white, // foreground
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Text(
                'Link',
                style: TextStyle(fontSize: 20),
            ),
          ),
              
      
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context)=>const EightPage())
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 44, 67, 217), // background
                foregroundColor: Colors.white, // foreground
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Text(
                  'Add Friend',
                  style: TextStyle(fontSize: 20), 
              ),
          ),
          ],
        ),
      ),
    );
  }
}
