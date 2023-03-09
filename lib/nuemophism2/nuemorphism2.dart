import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber[50],
        body: Center(
          child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber[50],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.shade200,
                      offset: Offset(10.0, -5.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                      color: Colors.amber.shade200,
                      offset: Offset(5.0, -5.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                    ),
                  ]),
              child: Center(
                child: Icon(
                  Icons.access_time,
                  color: Colors.grey[400],
                  size: 60.0,
                ),
              )),
        ),
      ),
    );
  }
}