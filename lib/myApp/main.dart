import 'package:demolab/Animations%20Demo/main.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('my first app'),
      centerTitle: true,
    ),
    body: Center(
      child: Text('hello ninjas!'),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Text('click');
      },

  ),
  )
));