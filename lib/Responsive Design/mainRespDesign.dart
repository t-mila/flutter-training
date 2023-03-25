import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Responsive Builder Example")),
        body: ScreenTypeLayout(
          mobile: _buildMobileLayout(),
          tablet: _buildTabletLayout(),
          desktop: _buildDesktopLayout(),

        ),
      ),
    );
  }

  Widget _buildMobileLayout(){
    return Center(
      child: Text("Mobile Layout", style: TextStyle(fontSize: 24)),
    );
  }

  Widget _buildTabletLayout(){
    return Center(
        child: Text("Tablet Layout", style: TextStyle(fontSize: 24)),
    );
  }

  Widget _buildDesktopLayout(){
    return Center(
        child: Text("Desktop Layout", style: TextStyle(fontSize: 24)),
    );
  }
}