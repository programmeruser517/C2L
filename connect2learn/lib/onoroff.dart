import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'seven.dart';

class OnorOffPage extends StatefulWidget {
  const OnorOffPage({super.key});

  @override
  _OnorOffPageState createState() => _OnorOffPageState();
}

class _OnorOffPageState extends State<OnorOffPage> {
  late GoogleMapController mapController;
  LatLng currentLocation = LatLng(0.0, 0.0);
  final Set<Marker> _markers = {};

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
    markerId: MarkerId("current_location"),
    position: location,
    infoWindow: InfoWindow(
      title: 'You :)',
    ),
  );

  setState(() {
    currentLocation = location;
    _markers.add(marker);
  });

  // Check if mapController is initialized before calling animateCamera
  if (mapController != null) {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: location,
          zoom: 15.0,
        ),
      ),
    );
  }
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
        title: const Text('Hey, _____.'),
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
                markers: _markers, // Add this line
                myLocationEnabled: true,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SevenPage()),
                );
              },
              child: const Text('Go to Seventh Page'),
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
}