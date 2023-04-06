import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Gestures Example',
      home: BasicGestureExample(),
    );
  }
}

class BasicGestureExample extends StatefulWidget {
//override the createstate method to return a new instance of _myappstate
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<BasicGestureExample> {
  //initial color
  Color containerColor = Colors.blue;

  //function for random colors
  void changeColor() {
    final randomColor = Color.fromRGBO(
      //generate random RGB values
      200 + (DateTime.now().millisecondsSinceEpoch % 55),
      200 + (DateTime.now().millisecondsSinceEpoch % 33),
      200 + (DateTime.now().millisecondsSinceEpoch % 77),
      1,
    );

    setState(() {
      containerColor = randomColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Basic Gesture Example"),
        ),

        //set the body of the app
        body: Center(
            child: GestureDetector(
                onLongPress: () {
                  changeColor();
                },
                child: Container(
                    height: 200.0,
                    width: 300.0,
                    color: containerColor,
                    child: Center(
                        child: Text(
                          'Click me!',
                          style: TextStyle(fontSize: 24.0, color: Colors.white),
                        ))))));
  }
}