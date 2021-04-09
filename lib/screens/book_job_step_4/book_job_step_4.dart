import 'package:cleaning_app/components/app_drawer/app_drawer.dart';
import 'package:cleaning_app/components/button/button.dart';
import 'package:cleaning_app/config/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import "package:cleaning_app/utils/location.dart";

import "package:cleaning_app/components/app_header/app_header.dart";

class BookJobStep4 extends StatefulWidget {
  static String screenName = "book-job-step-4";

  @override
  _BookJobStep4State createState() => _BookJobStep4State();
}

class _BookJobStep4State extends State<BookJobStep4> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future<void> goToLocation(double latitde, double longitude) async {
    final CameraPosition _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(latitde, longitude),
        zoom: 19.151926040649414);

    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  @override
  void initState() {
    getCurrentLocation();

    super.initState();
  }

  void getCurrentLocation() async {
    try {
      var p = await Location.determinePosition();

      goToLocation(p.latitude, p.longitude);
    } catch (e) {
      print("some error " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
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
                          "Step 4 of 4",
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
                                height: height * 0.5,
                                width: double.infinity,
                                child: GoogleMap(
                                  mapType: MapType.normal,
                                  myLocationEnabled: true,
                                  myLocationButtonEnabled: true,
                                  initialCameraPosition: _kGooglePlex,
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
                                child: Button(
                                    onPressed: () {
                                      // _goToTheLake();
                                    },
                                    label: "Select this location"),
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
                    Button(onPressed: () {}, label: "Next")
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
