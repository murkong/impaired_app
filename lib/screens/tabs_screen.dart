import 'package:flutter/material.dart';
import 'package:map_location/screens/emergencycont_screen.dart';
import 'package:map_location/screens/map_d_screen.dart';
import 'package:map_location/screens/speechttext_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.mic_external_on), text: 'Caption'),
                  Tab(icon: Icon(Icons.location_on), text: 'Maps'),
                  Tab(icon: Icon(Icons.message_outlined), text: 'Contact Help'),
                ],
              ),
              title: const Text(''),
            ),
            body: const TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  SpeechtoText(),
                  map_D_Screen(),
                  EmergSupportScreen(),
                ])));
  }
}
