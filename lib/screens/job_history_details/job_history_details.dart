import 'dart:async';
import 'package:cleaning_app/models/job.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:cleaning_app/screens/book_job_step_4/details.dart';
import "package:cleaning_app/components/app_header/app_header.dart";

class JobHistoryDetails extends StatefulWidget {
  static String screenName = "job-history-details";

  @override
  _JobHistoryDetailsState createState() => _JobHistoryDetailsState();
}

class _JobHistoryDetailsState extends State<JobHistoryDetails> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final Map args = ModalRoute.of(context).settings.arguments;
    final Job job = args["data"];
    final Set<Marker> markers = {
      Marker(
          markerId: MarkerId("current-location"),
          infoWindow: InfoWindow(title: "We came here"),
          position: LatLng(job.location["latitude"], job.location["longitude"]))
    };

    final CameraPosition cameraPosition = CameraPosition(
      target: LatLng(job.location["latitude"], job.location["longitude"]),
      zoom: 16,
    );

    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              AppHeader(showBackIcon: true),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: height * 0.3,
                                child: GoogleMap(
                                  scrollGesturesEnabled: false,
                                  markers: markers,
                                  mapType: MapType.normal,
                                  myLocationButtonEnabled: false,
                                  initialCameraPosition: cameraPosition,
                                  onMapCreated:
                                      (GoogleMapController controller) async {
                                    _controller.complete(controller);

                                    await Future.delayed(Duration(seconds: 1));
                                    controller.showMarkerInfoWindow(
                                        MarkerId("current-location"));
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    Details(
                                      data: job,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
