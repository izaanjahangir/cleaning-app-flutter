import 'dart:async';
import 'package:cleaning_app/components/button/button.dart';
import 'package:cleaning_app/config/theme_colors.dart';
import 'package:cleaning_app/screens/book_job_step_4/book_job_step_4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:cleaning_app/utils/location.dart";

import "package:cleaning_app/components/app_header/app_header.dart";

class BookJobStep3 extends StatefulWidget {
  static String screenName = "book-job-step-3";

  @override
  _BookJobStep3State createState() => _BookJobStep3State();
}

class _BookJobStep3State extends State<BookJobStep3> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = {};

  static final CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future<void> goToLocation(double latitde, double longitude,
      {bool shouldNotZoom = false}) async {
    final GoogleMapController controller = await _controller.future;
    double zoom;

    if (shouldNotZoom) {
      zoom = await controller.getZoomLevel();
    } else {
      zoom = 19.151926040649414;
    }

    CameraPosition cameraPosition = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(latitde, longitude),
        zoom: zoom);

    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  void initState() {
    getCurrentLocation();

    super.initState();
  }

  void getCurrentLocation() async {
    try {
      var p = await Location.determinePosition();
      GoogleMapController controller;

      if (_controller.isCompleted) {
        controller = await _controller.future;
      }

      goToLocation(p.latitude, p.longitude);
      Marker currentLocationMarker = Marker(
          markerId: MarkerId("current-location-marker"),
          infoWindow: InfoWindow(
              title: "Your Location", snippet: "We will come at this location"),
          position: LatLng(p.latitude, p.longitude));

      setState(() {
        markers.add(currentLocationMarker);
      });

      if (_controller != null) {
        await Future.delayed(Duration(seconds: 1));
        controller.showMarkerInfoWindow(MarkerId("current-location-marker"));
      }
    } catch (e) {
      EasyLoading.showError(e["message"]);
    }
  }

  void centerMap() {
    final Marker marker = markers.elementAt(0);
    goToLocation(marker.position.latitude, marker.position.longitude);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    Map<String, dynamic> arguments = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              AppHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Step 3 of 4",
                          style: TextStyle(
                              fontSize: 20,
                              color: ThemeColors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("Address Details",
                            style: TextStyle(
                                fontSize: 26,
                                color: ThemeColors.blue,
                                fontWeight: FontWeight.bold)),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: height * 0.45,
                                width: double.infinity,
                                child: GoogleMap(
                                  mapType: MapType.normal,
                                  myLocationEnabled: true,
                                  myLocationButtonEnabled: true,
                                  initialCameraPosition: initialCameraPosition,
                                  onTap: (LatLng coordinates) {
                                    Marker currentLocationMarker = Marker(
                                        markerId:
                                            MarkerId("current-location-marker"),
                                        infoWindow: InfoWindow(
                                            title: "Your Location",
                                            snippet:
                                                "We will come at this location"),
                                        position: LatLng(coordinates.latitude,
                                            coordinates.longitude));

                                    setState(() {
                                      markers.clear();
                                      markers.add(currentLocationMarker);
                                    });

                                    _controller.future
                                        .then((GoogleMapController controller) {
                                      controller.showMarkerInfoWindow(
                                          MarkerId("current-location-marker"));
                                    });
                                  },
                                  markers: markers,
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    _controller.complete(controller);
                                  
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    Button(
                                        onPressed: centerMap,
                                        label: "Center the map")
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        label: "Back"),
                    Button(
                        onPressed: () {
                          final Marker marker = markers.elementAt(0);

                          final Map location = {
                            "latitude": marker.position.latitude,
                            "longitude": marker.position.longitude,
                          };

                          Navigator.of(context).pushNamed(
                              BookJobStep4.screenName,
                              arguments: {...arguments, "location": location});
                        },
                        label: "Next")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
