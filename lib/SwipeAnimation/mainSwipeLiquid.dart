import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:neon_widgets/neon_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final pages = [
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://images.pexels.com/photos/1044989/pexels-photo-1044989.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          fit: BoxFit.cover,
        ),
      ),
      // ),
      child: Center(
        child: GestureDetector(
          onDoubleTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailsPage()),
            );
          },
          child: FlickerNeonText(
              text: "Let's dance",
              flickerTimeInMilliSeconds: 600,
              spreadColor: Colors.blue,
              blurRadius: 20,
              textSize: 74,
          ),
        ),
              // child: FlickerNeonText(
              //   text: "Let's dance",
              //   flickerTimeInMilliSeconds: 600,
              //   spreadColor: Colors.blue,
              //   blurRadius: 20,
              //   textSize: 74,
              // ),
      ),
    ),
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://images.pexels.com/photos/11802020/pexels-photo-11802020.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          fit: BoxFit.cover,
        ),
      ),
      // ),
      child: Center(
        child: FlickerNeonText(
          text: "Light is everywhere!",
          flickerTimeInMilliSeconds: 600,
          spreadColor: Colors.deepPurple,
          blurRadius: 40,
          textSize: 74,
        ),
      ),
    ),
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://images.pexels.com/photos/1677573/pexels-photo-1677573.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          fit: BoxFit.cover,
        ),
      ),
      // ),
      child: Center(
        child: FlickerNeonText(
          text: "Music!",
          flickerTimeInMilliSeconds: 600,
          spreadColor: Colors.blue,
          blurRadius: 20,
          textSize: 74,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      pages: pages,
      fullTransitionValue: 300.0,
      enableLoop: true,
    );
  }
}
class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Text('This is the details page.'),
      ),
    );
  }
}


