// class LocationController extends GetxController {
//   late Position? posinitial;
//   final lat = 0.0.obs;
//   final lng = 0.0.obs;

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
