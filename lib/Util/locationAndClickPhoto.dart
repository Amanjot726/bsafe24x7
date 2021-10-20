
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class AddAddressPage extends StatefulWidget {
  double? lat, long;
  AddAddressPage({Key? key, this.lat, this.long}) : super(key: key);

  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {

  Location location = new Location();
  GeoCode geoCode = GeoCode();
  Address? address;
  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController labelController = TextEditingController(text: 'Place');
  GoogleMapController? controller1;

  CameraPosition initPlace = CameraPosition(
    target: LatLng(30.9024779, 75.8201934),
    zoom: 16,
  );

  checkPermissionAndFetchLocation() async{
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

    print("Fetching Location");
    _locationData = await location.getLocation();
    print('Location Fetched');

    print("Fetching Address..");
    var addresses = await geoCode.reverseGeocoding(latitude: _locationData!.latitude as double, longitude: _locationData!.longitude as double);
    print('Address Fetched');
    print("Address: $address");

    setState(() {
      address = addresses;
      initPlace = CameraPosition(
        target: LatLng(_locationData!.latitude!, _locationData!.longitude!),
        zoom: 20,
      );

      controller1!.animateCamera(
        CameraUpdate.newCameraPosition(
            initPlace
        ),
      );

    });
  }

  // addToDatabase() async{
  //   var dataToSave = UserAddress(
  //     label: labelController.text,
  //     address: address.toString(),
  //     location: GeoPoint(_locationData!.latitude!, _locationData!.longitude!),
  //   );
  //
  //   print('Adding data to database');
  //   FirebaseFirestore.instance.collection('users').doc(Util.appUser!.uid).collection('addresses').doc().set(await dataToSave.toMap());
  //   print('Data added to database');
  // }

  var items = ['Home Place', 'Work Place', 'Other'];

  @override
  Widget build(BuildContext context) {
    checkPermissionAndFetchLocation();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Address"),
        backgroundColor: Colors.redAccent.shade100,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height*0.35,
                width: MediaQuery.of(context).size.width,
                child: widget.lat==null ? GoogleMap(
                  initialCameraPosition: initPlace,
                  mapType: MapType.normal,
                  trafficEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                    controller1 = controller;
                  },
                  markers: {
                    Marker(
                      markerId: MarkerId('atpl'),
                      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                      onTap: (){},
                      position: LatLng(_locationData!=null ? _locationData!.latitude as double : 30.9024779, _locationData!=null? _locationData!.longitude as double : 75.8201934),
                      // position: _locationData!=null? LatLng(_locationData!.latitude!, _locationData!.longitude!): LatLng(30.9024779, 75.8201934),
                      infoWindow: InfoWindow(
                        title: address!=null? address!.streetAddress : "",
                        snippet: address!=null? address!.countryName: "",
                        onTap: (){},
                      ),
                    ),
                  },
                ) : GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(widget.lat as double, widget.long as double),
                      zoom: 20,
                    ),
                    mapType: MapType.normal,
                    trafficEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: {
                      Marker(
                        markerId: MarkerId('atpl'),
                        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                        position: LatLng(widget.lat as double, widget.long as double),
                      ),
                    }
                )
            ),
            Container(
              // height: MediaQuery.of(context).size.height*0.3,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: address!=null? Column(
                      children: [
                        Text('Current Location - ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        Text('${address!.streetAddress}'),
                        Text('${address!.city}'),
                        Text('${address!.region}'),
                        Text('${address!.postal}'),
                        Text('${_locationData!.latitude}, ${_locationData!.longitude}'),
                      ],
                    ) : Container(),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // SizedBox(height: 15,),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.disabled, controller: labelController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: 'Label',
                                  filled: true,
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  suffixIcon: PopupMenuButton(
                                    // initialValue: 'Other Place',

                                    icon: Icon(Icons.arrow_drop_down),
                                    onSelected: (value) {
                                      labelController.text = value.toString();
                                    },
                                    itemBuilder: (context) {
                                      return items.map((e) {
                                        return PopupMenuItem(child: Text(e), value: e,);
                                      }).toList();
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        OutlinedButton(
                          onPressed: (){
                            // addToDatabase();
                            // Navigator.pushNamed(context, '/address');
                            // Navigator.popAndPushNamed(context, '/address');
                          },
                          child: Text('Add Address'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
