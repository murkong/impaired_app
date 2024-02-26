// Future<void> _checkLocationPersmission(ServiceDetails selectedProvider) async {
//   try{
//     perm.PermissionStatus status = 
//     await perm.Permission.locationWhenInUse.status:
//     print("Location Permission status: &status");
//     if(status.isDenied) {
//       print("Requesting location permission...");
//       await perm.Permission.localWhenInUse.request();
//     } else {
//       if (status.isGranted) {
//         //Print the coordintates to the console 
//         debugPrint("Provider Name: ${selectedProvider.providerName}");
//         debugPrint("Coordinates: ${selectedProvider.coordinates}");

//         //Navigate to MyPage with the coordinates
//         Get.to(MyPage(
//           providerPOsition: LatLng(
//             double.parse(selectedaProvider.corrdinates![0]),
//             double.parse(selectedaProvider.corrdinates![1]),
//           ),
//           userPosition:
//             LatLng(-0.392213, 36.958676),//SET A EFAULT USR POSITION 
//           ));
//       }
//     }
//   }catch (e) {
//     print("Error checking or requesting location permission: $e");
//     Get.snackbar("Info!", "Please enable location in settings!");
//   }
// }