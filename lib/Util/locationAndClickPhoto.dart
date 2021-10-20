import 'dart:html';

import 'package:fooddelivery/profile/google-maps-with-location.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Location location = new Location();

  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  String locationText = "Location Not Available";

  checkPermissionsAndFetchLocation()async{
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {
      locationText = "Latitude: ${_locationData!.latitude} Longitude: ${_locationData!.longitude}";
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [Text(locationText), GoogleMapsPage()],),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          checkPermissionsAndFetchLocation();
        },
        backgroundColor: Colors.green,
        child: Icon(
          Icons.gps_fixed,
          color: Colors.white,
        ),
      ),
    );
  }
}
