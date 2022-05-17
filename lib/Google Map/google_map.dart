import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
class GooogleMap extends StatefulWidget {
  const GooogleMap({Key? key}) : super(key: key);

  @override
  _GooogleMapState createState() => _GooogleMapState();
}

class _GooogleMapState extends State<GooogleMap> {
  Completer<GoogleMapController> _controller = Completer();
  LatLng? currentPostion;
  MapType mapType = MapType.normal;
  List<Marker> lstMarker = [];
  List<Marker> list = [
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(21.240867, 72.871701),
        infoWindow: InfoWindow(title: "Dmart")),
    Marker(
        markerId: MarkerId("2"),
        position: LatLng(21.180017, 72.766209),
        infoWindow: InfoWindow(title: "Devilla")),
    Marker(
        markerId: MarkerId("3"),
        position: LatLng(21.229367, 72.896835),
        infoWindow: InfoWindow(title: "DeepKamal")),
    Marker(
        markerId: MarkerId("4"),
        position:LatLng(21.145184, 72.757418),
        infoWindow: InfoWindow(title: "VrMall")),
    Marker(
        markerId: MarkerId("5"),
        position: LatLng(21.219631, 72.805446),
        infoWindow: InfoWindow(title: "CozWay")),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkPermision();
    setMarker();
    _getUserLocation();
    // getAddress();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: currentPostion != null
            ? Stack(
                children: [
                  GoogleMap(
                    onTap: _handleTap,
                    zoomControlsEnabled: false,
                    mapType: mapType,
                    compassEnabled: false,
                    markers: Set<Marker>.of(list),
                    initialCameraPosition: CameraPosition(
                      target: LatLng(currentPostion?.latitude ?? 0,
                          currentPostion?.longitude ?? 0),
                      zoom: 19.151926040649414,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                  Column(
                    children: [
                      InkWell(
                          onTap: () {
                            _goToPosition(21.240867, 72.871701);
                          },
                          child: buttons("Dmart")), //21.240867,72.871701
                      InkWell(
                          onTap: () {
                            _goToPosition(21.180017, 72.766209);
                          },
                          child: buttons("Devilla")),
                      //21.180017,72.766209
                      InkWell(
                          onTap: () {
                            setState(() {
                              _goToPosition(21.229367, 72.896835);
                            });
                          },
                          child: buttons("Deepkamal")), //21.229367,72.896835
                      InkWell(
                          onTap: () {
                            setState(() {
                              _goToPosition(21.145184, 72.757418);
                            });
                          },
                          child: buttons("VR Mall")), //21.145184,72.757418
                      InkWell(
                          onTap: () {
                            setState(() {
                              _goToPosition(21.219631, 72.805446);
                            });
                          },
                          child: buttons("CozWay")),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _getUserLocation();
                            });
                          },
                          child: buttons("Current")),//21.219631,72.805446
                    ],
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                mapType = MapType.normal;
                                print("Normal set");
                              });
                            },
                            child: buttons("Normal")),
                        InkWell(
                            onTap: () {
                              setState(() {
                                mapType = MapType.hybrid;
                              });
                            },
                            child: buttons("Hybrid")),
                        InkWell(
                            onTap: () {
                              setState(() {
                                mapType = MapType.terrain;
                              });
                            },
                            child: buttons("Terrian")),
                        InkWell(
                            onTap: () {
                              setState(() {
                                mapType = MapType.satellite;
                              });
                            },
                            child: buttons("Satelite")),
                      ],
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     setState(() {
                  //       _getUserLocation();
                  //     });
                  //   },
                  //   child: Container(
                  //       alignment: Alignment.bottomRight, child: buttons("My")),
                  // )
                ],
              )
            : Container(),
      ),
    );
  }

  Widget buttons(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        height: 55,
        width: 55,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.lightBlueAccent),
        child: FittedBox(
            child: Text(
          text,
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }

  _goToPosition(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(lat, long),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414)));
  }

  setMarker() {
    lstMarker.add(_putMarker("1", 21.7645, 72.1519));
  }

  Marker _putMarker(String id, double lat, double long) {
    return Marker(markerId: MarkerId(id), position: LatLng(lat, long));
  }

  void _getUserLocation() async {
    var position = await GeolocatorPlatform.instance
        .getCurrentPosition(locationSettings: LocationSettings());
    setState(() {
      currentPostion = LatLng(position.latitude, position.longitude);
    });
    _goToPosition(position.latitude, position.longitude);
    list.add(
      Marker(
          markerId: MarkerId("8"),
          position: LatLng(position.latitude, position.longitude),
          infoWindow: InfoWindow(title: "Me")),
    );
  }

  Future<void> checkPermision() async {
    var location = Location();
    bool enabled = await location.serviceEnabled();
    bool appPermission = await Permission.location.isGranted;
    if (enabled) {
      if (appPermission) {
        _getUserLocation();
      } else {
        await Permission.location.request();
        checkPermision();
      }
    } else {
      await location.requestService();
      checkPermision();
    }
  }

  _handleTap(LatLng argument) {
    setState(() {
      lstMarker = [];
      lstMarker.add(
          Marker(markerId: MarkerId(argument.toString()), position: argument));
    });
  }

  // void getAddress() async {
  //   List<Placemark> placemarks = await placemarkFromCoordinates(
  //       21.229367, 72.896835);
  //   Placemark place = placemarks[0];
  //   print(place);
  // }
}
