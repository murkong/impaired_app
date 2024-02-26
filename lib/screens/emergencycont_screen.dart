import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergSupportScreen extends StatefulWidget {
  const EmergSupportScreen({Key? key}) : super(key: key);

  @override
  State<EmergSupportScreen> createState() => _EmergSupportScreenState();
}

class _EmergSupportScreenState extends State<EmergSupportScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(""),
        ),
        body: Center(
            child: ElevatedButton(
          onPressed: () async {
            String phoneNumber = "+254758077251";
            Uri numberUri = Uri(scheme: 'tel', path: phoneNumber);
            if (!await launchUrl(numberUri))
              throw 'Could not launch $numberUri';
          },
          child: const Text('Call Contact1'),
        )),
      );
}
