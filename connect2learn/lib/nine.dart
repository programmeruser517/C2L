import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'seven.dart';

class NinePage extends StatelessWidget {
  const NinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Text(
                'Scan the QR code\n or open the link \nto connect with me!  :)',
                style: TextStyle(fontSize: 16.0), // Smaller font size
                textAlign: TextAlign.center, // Center align the text
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // Bold and black border
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
              ),
              child: BarcodeWidget(
                barcode: Barcode.qrCode(),
                data: GlobalData.user_url,
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 10.0), // Add space between QR code and button
            ElevatedButton(
              onPressed: () {
                _launchURL(GlobalData.user_url);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 44, 67, 217), // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
              ),
              child: const Text(
                'Open Link',
                style: TextStyle(color: Colors.white), // Text color
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
