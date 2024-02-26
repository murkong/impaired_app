import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class MarkerImageLoader {
  Future<Uint8List> getBytesFromAsset(
      {required String path, required int width}) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<Uint8List> loadCustomMarker() async {
    return await getBytesFromAsset(
      path:
          'assets/images/personlocation.jpg', // Replace with your custom image path
      width: 50, // Adjust size of custom image as marker
    );
  }
}

// Example usage:
// MarkerImageLoader markerImageLoader = MarkerImageLoader();
// Uint8List customMarker = await markerImageLoader.loadCustomMarker();
