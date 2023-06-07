import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:keep_notes_using_getx/notes/cotroller/notes_controller.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  NotesController controller = Get.put(NotesController());
  LocationPermission? permission;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Location",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
      ),
      floatingActionButton: InkWell(
        onTap: () {
          GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(
              controller.lat.value, controller.log.value),zoom: 11));
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Icon(
              Icons.location_on,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  permission = await Geolocator.checkPermission();
                  if (permission == LocationPermission.denied) {
                    await Geolocator.requestPermission();
                  } else {
                    Position position = await Geolocator.getCurrentPosition(
                        desiredAccuracy: LocationAccuracy.high);
                    print(controller.lat.value = position.latitude);
                    controller.lat.value = position.latitude;
                    controller.log.value = position.longitude;
                  }
                },
                child: Text(
                  "Get Coordinates",
                  style: TextStyle(color: Colors.black, letterSpacing: 1),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              ),
              SizedBox(height: 20),
              Container(
                height: 40,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                  child: Obx(
                    () => Text(
                      "${controller.lat} --  ${controller.log}",
                      style: TextStyle(
                          color: Colors.white, fontSize: 15, letterSpacing: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Divider(
                color: Colors.white,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  List<Placemark> placeList = await placemarkFromCoordinates(
                      controller.lat.value, controller.log.value);
                  controller.currentLoc.value = placeList[1];
                },
                child: Text(
                  "Get Location",
                  style: TextStyle(color: Colors.black, letterSpacing: 1),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              ),
              SizedBox(height: 20),
              Container(
                height: 400,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                  child: Obx(
                    () => Text(
                      "${controller.currentLoc}",
                      style: TextStyle(
                          color: Colors.white, fontSize: 15, letterSpacing: 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
