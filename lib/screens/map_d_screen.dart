import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class map_D_Screen extends StatefulWidget {
  const map_D_Screen({Key? key}) : super(key: key);

  @override
  State<map_D_Screen> createState() => _map_D_ScreenState();
}

class _map_D_ScreenState extends State<map_D_Screen> {
  final Completer<GoogleMapController> _controller = Completer();
  final LocationController locationController = Get.put(
    LocationController(
        initialLat: 0.0, initialLng: 0.00), // Example coordinates
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Obx(
        () => GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                  locationController.lat.value, locationController.lng.value),
              zoom: 15,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('user_location'),
                position: LatLng(
                    locationController.lat.value, locationController.lng.value),
                // icon: BitmapDescriptor.fromBytes(),
                //infoWindow: const InfoWindow(title: ''),
              )
            },
            onMapCreated: (mapController) {
              _controller.complete(mapController);
            }),
      ),
    );
  }
}

class PermissionToUser {
  static Future<bool> permissionForLocation() async {
    final request = await [Permission.location].request();
    print(request[Permission.location].toString());
    final status = await Permission.location.status;

    if (status.isDenied || status.isRestricted || status.isLimited) {
      return false;
    } else {
      return true;
    }
  }

  static Future<Position?> determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw 'Location services are disabled.';
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw 'Location permissions are denied.';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw 'Location permissions are permanently denied, we cannot request permissions.';
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}

class LocationController extends GetxController {
  late Position? posinitial;
  final lat = 0.0.obs;
  final lng = 0.0.obs;

  // Declare initial coordinates using RxDouble directly
  final initialLat = RxDouble(0.2354);
  final initialLng = RxDouble(70.5765);

  LocationController({required double initialLat, required double initialLng}) {
    // Pass values directly to RxDouble variables
    this.initialLat.value = initialLat; // Set value directly
    this.initialLng.value = initialLng; // Set value directly

    // Update lat and lng observables
    this.lat(initialLat);
    this.lng(initialLng);
  }
  @override
  void onInit() async {
    super.onInit();
    await PermissionToUser.permissionForLocation().then((value) async {
      posinitial = await PermissionToUser.determinePosition();
    }).whenComplete(() {
      getPositionData();
    });
  }

  getPositionData() {
    if (posinitial != null) {
      print("Latitude: ${posinitial!.latitude}");
      print("Longitude: ${posinitial!.longitude}");
      lat(posinitial!.latitude);
      lng(posinitial!.longitude);
    }
  }
}
