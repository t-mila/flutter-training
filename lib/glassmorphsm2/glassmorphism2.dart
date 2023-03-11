import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'dart:ui';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GlassmorphicContainer Example',
      home: GlassmorphicSample(),
    );
  }
}

class GlassmorphicSample extends StatefulWidget {
  @override
  State<GlassmorphicSample> createState() => GlassmorphicSampleState();
}

class GlassmorphicSampleState extends State<GlassmorphicSample> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Image.network(
              "https://images.pexels.com/photos/2400594/pexels-photo-2400594.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              scale: 1,
            ),
            SafeArea(
              child: Center(
                child: GlassmorphicContainer(
                    width: 300,
                    height: 250,
                    borderRadius: 20,
                    blur: 5,
                    alignment: Alignment.topCenter,
                    border: 1,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xff3c4931).withOpacity(0.025),
                          Color(0xFFEED995).withOpacity(0.05),
                        ],
                        stops: [
                          0.1,
                          1,
                        ]),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff110f00).withOpacity(1),
                        Color((0xFFFFFFFF)).withOpacity(0.5),
                      ],
                    ),
                    child:Center(
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}