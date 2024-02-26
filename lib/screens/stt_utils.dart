// import 'package:flutter/material.dart';
// import 'package:map_location/screens/speechttext_screen.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Command {
//   static final all = [locateme, maps, call];

//   static const String locateme = 'get location';
//   static const maps = 'open map';
//   static const call = 'call';
// }

// class Utils {
//   //
//   //
//   static void scanText(String rawText) {
//     final text = rawText.toLowerCase();

//     if (text.contains(Command.locateme)) {
//       final body = _getTextAfterCommand(text: text, command: Command.locateme);
// openSpeechTextScreen(body: body, context: context);     // openSpeechTextScreen(body: body, context: null);
          
//     }
//   }
//    static void openSpeechTextScreen({
//     required String body,
//     required BuildContext context,
//   }) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => SpeechtoText(key: body)),
//     );
//   }


//   static String _getTextAfterCommand({
//     required String text,
//     required String command,
//   }) {
//     final indexCommand = text.indexOf(command);
//     final indexAfter = indexCommand + command.length;
//     if (indexCommand == -1) {
//       return ''; // null
//     } else {
//       {
//         String text;
//       }
//       return text.substring(indexAfter).trim();
//     }
//   }

// }
