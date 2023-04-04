//import the Flutter Material packege to use its components
import 'package:flutter/material.dart';
import 'dart:math';

//define the main function as an entry point of the app
//Set MyApp as the root widget
void main() {
  runApp(MyApp());
}
//create a new stateless widget named Myapp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipe Gesture Example',
      home: Scaffold(
        body: SwipeGestureExample(),
      ),
    );
  }
}
//create new stateful widget named SwipeGestureExample
class SwipeGestureExample extends StatefulWidget{
  //ovveride the createState method to return new instance of _SwipeGestureExampleState
  @override
  _SwipeGestureExampleState createState() => _SwipeGestureExampleState();
}

class _SwipeGestureExampleState extends State<SwipeGestureExample>{

  Color containerColor = Colors.blue;
  // Define the changeColor method to change the container color
  void changeColor() {
    final randomColor = Color.fromRGBO(
      // Generate random RGB values
      200 + (DateTime.now().millisecondsSinceEpoch % 55),
      200 + (DateTime.now().millisecondsSinceEpoch % 33),
      200 + (DateTime.now().millisecondsSinceEpoch % 77),
      1,
    );
  // void changeColor() {
  //   setState(() {
  //     containerColor = _generateRandomColor();
  //   });
  // }
  //
  // Color _generateRandomColor() {
  //   Random random = Random();
  //   return Color.fromRGBO(
  //     random.nextInt(256),
  //     random.nextInt(256),
  //     random.nextInt(256),
  //     1,
  //   );
    //update the state with the new color
    setState(() {
      containerColor = randomColor;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipe Gesture Example'),
      ),
      body: Center(
        child: GestureDetector(
          //set the onHorizontalDraged callback
          onHorizontalDragEnd: (details){
            changeColor();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Color changed to $containerColor"),));
          },
          onForcePressEnd: (details){
            changeColor();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Color changed to $containerColor"),));
          },
          child: Container(
            width: 200.0,
            height: 200.0,
            color: containerColor,
            child: Center(
              child: Text('Swipe me!', style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
        )
      ),
    ));

  }
}


