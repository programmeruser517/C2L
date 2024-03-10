import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'seven.dart';
import 'schedule.dart';

class OnorOffPage extends StatefulWidget {
  const OnorOffPage({super.key});

  @override
  _OnorOffPageState createState() => _OnorOffPageState();
}

class _OnorOffPageState extends State<OnorOffPage> {
  late GoogleMapController mapController;
  LatLng currentLocation = const LatLng(0.0, 0.0);
  final Set<Marker> _markers = {};
  bool isSwitched = false;
  final Color mellowGreen = Color.fromARGB(255, 44, 67, 217);
  int points = GlobalData.user_points; // Add this line

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, so we request them.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale 
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
    } 

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition();
    final location = LatLng(position.latitude, position.longitude);
  
    final marker = Marker(
      markerId: const MarkerId("current_location"),
      position: location,
      infoWindow: const InfoWindow(
        title: 'You :)',
      ),
    );

    setState(() {
      currentLocation = location;
      _markers.add(marker);
    });

    // Check if mapController is initialized before calling animateCamera
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: location,
          zoom: 15.0,
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if(currentLocation.latitude != 0.0 && currentLocation.longitude != 0.0) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: currentLocation,
            zoom: 15.0,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hey, ${GlobalData.user}!'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SchedPage()),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '${points} pts', // Display the points
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: currentLocation,
                  zoom: 15,
                ),
                markers: _markers,
                myLocationEnabled: true,
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              isSwitched ? 'ON' : 'OFF',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0, // Increase the font size by 5 pixels
              ),
            ),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  // Add any additional logic you want to execute when the switch is toggled
                });
              },
              activeColor: mellowGreen,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SevenPage()),
          );
        },
        child: const Icon(Icons.share),
        backgroundColor: Color.fromARGB(255, 44, 67, 217),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 4'),
      ),
      body: Center(
        //make the page literally redirect to the schedule page
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SchedPage()),
            );
          },
          child: const Text('Go to Schedule'),
        ),
      ),
    );
  }
}
