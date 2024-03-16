import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterTts flutterTts = FlutterTts();
  SpeechToText speechToText = SpeechToText();

  String textToSpeak = 'Hey Dilkhush! Are You Genius';
  String recognizedText = 'Press the button to start listening...';

  @override
  void initState() {
    super.initState();
    initTts();
    initSpeechToText();
  }

  Future<void> initTts() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(0.6);
    await flutterTts.setSpeechRate(0.2);
  }

  Future<void> initSpeechToText() async {
    bool isAvailable = await speechToText.initialize();
    if (!isAvailable) {
      print('Speech recognition is not available');
    }
  }

  Future<void> speak() async {
    await flutterTts.speak(textToSpeak);
  }

  Future<void> listen() async {
    if (!speechToText.isListening) {
      bool available = await speechToText.initialize();
      if (available) {
        speechToText.listen(
          onResult: (result) {
            setState(() {
              recognizedText = result.recognizedWords;
            });
          },
        );
      }
    } else {
      speechToText.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text-to-Speech & Speech-to-Text'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Text to Speak:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              textToSpeak,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: speak,
              child: Text('Speak Text'),
            ),
            SizedBox(height: 40),
            Text(
              'Recognized Text:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              recognizedText,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: listen,
              child: speechToText.isListening ? Text('Stop Listening') : Text('Start Listening'),
            ),
          ],
        ),
      ),
    );
  }
}

