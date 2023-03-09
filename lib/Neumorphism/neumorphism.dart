import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neumorphic Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> titles = [
    "Card 1",
    "Card 2",
    "Card 3",
    "Card 4",
    "Card 5",
    "Card 6"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE0E5EC),
      appBar: AppBar(
        title: Text('Neumorphic Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.convex,
                depth: 12,
                intensity: 5,
                color: Color(0xffE0E5EC),
                shadowLightColor: Color(0xffF1F6FB),
                shadowDarkColor: Color(0xffB8C2CC),
                lightSource: LightSource.topLeft,
              ),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Text(
                    titles[index],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'This is a subtitle',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.grey[200],
//         body: Center(
//           child: Container(
//             width: 150,
//             height: 150,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.grey[200],
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.white,
//                   offset: Offset(5.0, -0.5),
//                   blurRadius: 15.0,
//                   spreadRadius: 1.0,
//                 ),
//                 BoxShadow(
//                   color: Color(0xffaeacac),
//                   offset: Offset(5.0, -0.5),
//                   blurRadius: 15.0,
//                   spreadRadius: 1.0,
//                 ),
//               ]
//
//             ),
//             child: Center(
//               child: Icon(
//                 Icons.favorite,
//                 color: Colors.grey[400],
//                 size: 60.0,
//               ),
//             )
//           ),
//
//         ),
//       )
//
//     );
//   }
// }