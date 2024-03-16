import 'package:checkapi/Speaking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Topic_Selection extends StatefulWidget {
  const Topic_Selection({super.key});

  @override
  State<Topic_Selection> createState() => _Topic_SelectionState();
}

class _Topic_SelectionState extends State<Topic_Selection> {
  @override
  Widget build(BuildContext context) {
    double hi = MediaQuery.of(context).size.height;
    double wi = MediaQuery.of(context).size.width;
    final TextEditingController textEditingController=TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(height: hi*0.07,),
            Center(
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 12),
                height: hi*0.43,
                width: wi*0.80,
                decoration: BoxDecoration(
                  color: Colors.amber[100],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:12),
                  child: TextField(
                    //maxLines: 4,
                    maxLength: 20,
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: ('Write a topic name'),
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: hi*0.01,),
            CupertinoButton(
              color: Colors.greenAccent,
                child: Text("Next"), onPressed:(){
              Navigator.push(context,MaterialPageRoute(builder:(context)=> Speaking(text:textEditingController.text.trim())));
            }),
          ],
        ),
      ),
    );
  }
}
