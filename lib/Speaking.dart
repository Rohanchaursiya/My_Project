// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';
// class Speaking extends StatefulWidget {
//   const Speaking({super.key});
//   @override
//   State<Speaking> createState() => _SpeakingState();
// }
//
// class _SpeakingState extends State<Speaking> {
//   String generatedText = '';
//   @override
//   void initState() {
//     super.initState();
//     generateText();
//   }
//   Future<void> generateText() async {
//     final apiKey = "AIzaSyD4z8TqJJ-8aGwpNJBFZFMQqy2oCImrnxA";
//     // print("ji");
//     if (apiKey == null) {
//       print('No \$API_KEY environment variable');
//       return;
//     }
//     //print("h");
//     final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
//     final content = [Content.text('Love')];
//     final response = await model.generateContent(content);
//     setState(() {
//       // print(response);
//       //print("hi");
//       generatedText = response.text.toString();
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     double hi=MediaQuery.of(context).size.height;
//     double wi=MediaQuery.of(context).size.width;
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           height: hi,
//           width: wi,
//           color: Colors.pink.shade200,
//
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//
//               Container(
//                 margin: EdgeInsets.all(10),
//                 height: hi*0.46,
//                 width: wi*0.98,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//                 child: SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     child:Padding(
//                         padding: EdgeInsets.all(20),
//                         child: Text(generatedText)),
//                 ),
//               ),
//               Container(
//                 //implement text to speech in this container and speak the data generated from above api
//
//                 margin: EdgeInsets.all(10),
//                 height: hi*0.46,
//                 width: wi*0.98,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//               )
//             ],
//           ),
//
//         ),
//       ),
//     );
//   }
// }


// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';
// import 'package:flutter_tts/flutter_tts.dart';
//
// class Speaking extends StatefulWidget {
//   const Speaking({Key? key}) : super(key: key);
//
//   @override
//   State<Speaking> createState() => _SpeakingState();
// }
//
// class _SpeakingState extends State<Speaking> {
//   String generatedText = '';
//   late FlutterTts flutterTts;
//
//   @override
//   void initState() {
//     super.initState();
//     generateText();
//     flutterTts = FlutterTts();
//   }
//
//   Future<void> generateText() async {
//     final apiKey = "AIzaSyD4z8TqJJ-8aGwpNJBFZFMQqy2oCImrnxA";
//     if (apiKey == null) {
//       print('No \$API_KEY environment variable');
//       return;
//     }
//     final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
//     final content = [Content.text('Love')];
//     final response = await model.generateContent(content);
//     setState(() {
//       generatedText = response.text.toString();
//     });
//   }
//
//   Future<void> speak(String text) async {
//     await flutterTts.setLanguage('en-US');
//     await flutterTts.setPitch(1);
//     await flutterTts.setSpeechRate(0.5);
//     await flutterTts.speak(text);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double hi = MediaQuery.of(context).size.height;
//     double wi = MediaQuery.of(context).size.width;
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           height: hi,
//           width: wi,
//           color: Colors.pink.shade200,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Container(
//                 margin: EdgeInsets.all(10),
//                 height: hi * 0.46,
//                 width: wi * 0.98,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: Padding(
//                     padding: EdgeInsets.all(20),
//                     child: Text(generatedText),
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   speak(generatedText);
//                 },
//                 child: Container(
//                   margin: EdgeInsets.all(10),
//                   height: hi * 0.46,
//                   width: wi * 0.98,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'Tap to Speak',
//                       style: TextStyle(fontSize: 24),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class Speaking extends StatefulWidget {
  String text;
   Speaking({super.key,required this.text});

  @override
  State<Speaking> createState() => _SpeakingState();
}

class _SpeakingState extends State<Speaking> {
  //variable declaration
  String generatedText = '';
  FlutterTts flutterTts = FlutterTts();
  @override
  //init state for text Generation
  void initState() {
    super.initState();
    generateText();
  }

  //Using API KEY generating text and speaking
  Future<void> generateText() async {
    final apiKey = "AIzaSyD4z8TqJJ-8aGwpNJBFZFMQqy2oCImrnxA";
    if (apiKey == null) {
      print('No \$API_KEY environment variable');
      return;
    }
    final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
    final content = [Content.text('write a ${widget.text} story for 30 Second')];
    final response = await model.generateContent(content);
    setState(() {
      generatedText = response.text.toString();
      speak(generatedText);
    });
  }
  //Language,pitch and speech rate
  Future<void> speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(0.7);
    await flutterTts.setSpeechRate(0.8);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    double hi = MediaQuery.of(context).size.height;
    double wi = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: hi,
          width: wi,
          color: Colors.pink.shade200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: hi * 0.44,
                width: wi * 0.98,
                decoration: const BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: generatedText.isEmpty ?  SizedBox(
                  height: 10,
                  width: 10,
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                  ),
                ):SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(generatedText),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

