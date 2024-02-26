import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:map_location/screens/api_speechttext.dart';

class SpeechtoText extends StatefulWidget {
  //const SpeechtoText({super.key});
  const SpeechtoText({Key? key}) : super(key: key);

  @override
  State<SpeechtoText> createState() => _SpeechtoTextState();
}

class _SpeechtoTextState extends State<SpeechtoText> {
  String text = 'Press the button and start speaking';
  bool isListening = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(''),
            centerTitle: true,
            actions: [
              Builder(builder: (context) {
                return IconButton(
                  icon: Icon(Icons.content_copy),
                  onPressed: () async {
                    await FlutterClipboard.copy(text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Copied to clipboard')),
                    );
                  },
                );
              })
            ]),
        body: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.all(30).copyWith(bottom: 50),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 32.0,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(isListening ? Icons.mic : Icons.mic_none, size: 36),
          //onPressed: toggleRecording,
          onPressed: () async {
            await toggleRecording();
          },
        ),
      );
  Future<void> toggleRecording() async {
    await SpeechApi.toggleRecording(onResult: (resultText) {
      setState(() {
        text = resultText;
      });
    }, onListening: (isListening) {
      setState(() => this.isListening = isListening);
    });
  }
}
