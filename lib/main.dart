import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:map_location/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure that Flutter is initialized
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}
















// import 'package:flutter/material.dart';
// import 'package:map_location/archivetest/landing.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

// // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // in the below line, we are specifying title of our app.
//       title: 'GFG',
//       // in the below line, we are hiding our debug banner.
//       debugShowCheckedModeBanner: false,
//       // in the below line, we are specifying theme.
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       // First Screen of our App
//       home: const HomePage(),
//     );
//   }
// }



















// class MapScreen extends StatelessWidget {
//   final LocationController locationController = Get.put(
//     LocationController(
//         initialLat: 37.4219983, initialLng: -122.084085), // Example coordinates
//   );
//   //final LocationController locationController = Get.put(LocationController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Google Maps Example'),
//       ),
//       body: Obx(
//         () => GoogleMap(
//           initialCameraPosition: CameraPosition(
//             target: LatLng(
//                 locationController.lat.value, locationController.lng.value),
//             zoom: 15,
//           ),
//           markers: {
//             Marker(
//               markerId: const MarkerId('user_location'),
//               position: LatLng(
//                   locationController.lat.value, locationController.lng.value),
//               infoWindow: const InfoWindow(title: 'Your Location'),
//             ),
//           },
//         ),
//       ),
//     );
//   }
// }

// class PermissionToUser {
//   static Future<bool> permissionForLocation() async {
//     final request = await [Permission.location].request();
//     print(request[Permission.location].toString());
//     final status = await Permission.location.status;

//     if (status.isDenied || status.isRestricted || status.isLimited) {
//       return false;
//     } else {
//       return true;
//     }
//   }

//   static Future<Position?> determinePosition() async {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

//     if (!serviceEnabled) {
//       throw 'Location services are disabled.';
//     }

//     LocationPermission permission = await Geolocator.checkPermission();

//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         throw 'Location permissions are denied.';
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       throw 'Location permissions are permanently denied, we cannot request permissions.';
//     }

//     return await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//   }
// }

// class LocationController extends GetxController {
//   late Position? posinitial;
//   final lat = 0.0.obs;
//   final lng = 0.0.obs;

//   // Declare initial coordinates using RxDouble directly
//   final initialLat = RxDouble(0.2354);
//   final initialLng = RxDouble(36.5765);

//   LocationController({required double initialLat, required double initialLng}) {
//     // Pass values directly to RxDouble variables
//     this.initialLat.value = initialLat; // Set value directly
//     this.initialLng.value = initialLng; // Set value directly

//     // Update lat and lng observables
//     this.lat(initialLat);
//     this.lng(initialLng);
//   }
//   @override
//   void onInit() async {
//     super.onInit();
//     await PermissionToUser.permissionForLocation().then((value) async {
//       posinitial = await PermissionToUser.determinePosition();
//     }).whenComplete(() {
//       getPositionData();
//     });
//   }

//   getPositionData() {
//     if (posinitial != null) {
//       print("Latitude: ${posinitial!.latitude}");
//       print("Longitude: ${posinitial!.longitude}");
//       lat(posinitial!.latitude);
//       lng(posinitial!.longitude);
//     }
//   }
// }
