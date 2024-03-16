import 'dart:io';
import 'package:checkapi/Speaking.dart';
import 'package:checkapi/TextToSpeech.dart';
import 'package:checkapi/Topic_Selection.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

// String ans="";


void main(){
  runApp(MyApp());
}


// void main() async {
//   // Access your API key as an environment variable (see "Set up your API key" above)
//   final apiKey = "AIzaSyD4z8TqJJ-8aGwpNJBFZFMQqy2oCImrnxA";
//   if (apiKey == null) {
//     print('No \$API_KEY environment variable');
//     exit(1);
//   }
//   // For text-only input, use the gemini-pro model
//   final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
//   final content = [Content.text('My college life')];
//   final response = await model.generateContent(content);
//   ans!=response.text;
//   print(response.text);
//   runApp(MyApp(),);
//
// }
// class MyApp extends StatefulWidget {
//   String txt;
//    MyApp({super.key,required  this.txt});
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//
//   @override
//   late String tx1;
//   @override
//   void initState() async{
//     super.initState();
//
//   }
//
//
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Container(
//         child: Center(
//           child: Text(ans),
//         ),
//       ),
//     );
//   }
// }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Topic_Selection(),
    );
  }
}





