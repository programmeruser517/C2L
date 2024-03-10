import 'package:flutter/material.dart';
import 'eight.dart';
import 'nine.dart' ;
class SevenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context)=>NinePage())
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 44, 67, 217), // background
                foregroundColor: Colors.white, // foreground
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                'Code',
                style: TextStyle(fontSize: 20),
            ),
          ),
              
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                print('Link button clicked');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 44, 67, 217), // background
                foregroundColor: Colors.white, // foreground
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                'Link',
                style: TextStyle(fontSize: 20),
            ),
          ),
              
      
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context)=>EightPage())
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 44, 67, 217), // background
                foregroundColor: Colors.white, // foreground
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
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
