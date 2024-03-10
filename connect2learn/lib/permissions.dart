import 'package:flutter/material.dart';
import 'schedule.dart';

class PermsPage extends StatefulWidget {
  @override
  _PermsPageState createState() => _PermsPageState();
}

class _PermsPageState extends State<PermsPage> {
  bool locationAllowed = false;
  bool storageAllowed = false;
  bool otherAllowed = false;

  void _requestPermission(String title) async {
    bool result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Permission Request"),
          content: Text("Are you sure you want to allow $title?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("Deny"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text("Allow"),
            ),
          ],
        );
      },
    );

    if (result) {
      setState(() {
        switch (title) {
          case 'Location':
            locationAllowed = true;
            break;
          case 'Storage':
            storageAllowed = true;
            break;
          case 'X':
            otherAllowed = true;
            break;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permissions Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              locationAllowed && storageAllowed && otherAllowed
                  ? 'Thank you!'
                  : 'We need your permission...',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Opacity(
              opacity: locationAllowed ? 0.5 : 1.0,
              child: ElevatedButton(
                onPressed: locationAllowed
                    ? null
                    : () {
                        _requestPermission('Location');
                      },
                child: Text('Allow Location'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 44, 67, 217),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Opacity(
              opacity: storageAllowed ? 0.5 : 1.0,
              child: ElevatedButton(
                onPressed: storageAllowed
                    ? null
                    : () {
                        _requestPermission('Storage');
                      },
                child: Text('Allow Storage'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 44, 67, 217),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Opacity(
              opacity: otherAllowed ? 0.5 : 1.0,
              child: ElevatedButton(
                onPressed: otherAllowed
                    ? null
                    : () {
                        _requestPermission('X');
                      },
                child: Text('Allow X'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 44, 67, 217),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            if (locationAllowed && storageAllowed && otherAllowed)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SchedPage()),
                  );
                },
                child: Text('Continue'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 44, 67, 217),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
