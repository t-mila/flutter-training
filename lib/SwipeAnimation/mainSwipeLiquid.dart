import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

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
        child: Stack (
          children: [
            Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: NetworkImage("https://images.pexels.com/photos/624015/pexels-photo-624015.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                    fit: BoxFit.cover,
                  ),
                )
            ),
            Center(
              child: Text(
                'Page 1',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
          ],
        )
    ),
    Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          'Page 2',
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
      ),
    ),
    Container(
      color: Colors.green,
      child: Center(
        child: Text(
          'Page 3',
          style: TextStyle(fontSize: 40, color: Colors.white),
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

// import 'package:flutter/material.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: MyHomePage(),
//       ),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   final pages = [
//     Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: NetworkImage(
//               'https://images.pexels.com/photos/3244513/pexels-photo-3244513.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Center(
//         child: Text(
//           'Page 1',
//           style: TextStyle(fontSize: 40, color: Colors.white),
//         ),
//       ),
//     ),
//     Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: NetworkImage(
//               'https://images.pexels.com/photos/624015/pexels-photo-624015.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Center(
//         child: Text(
//           'Page 2',
//           style: TextStyle(fontSize: 40, color: Colors.white),
//         ),
//       ),
//     ),
//     Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: NetworkImage(
//               'https://images.pexels.com/photos/2440061/pexels-photo-2440061.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Center(
//         child: Text(
//           'Page 3',
//           style: TextStyle(fontSize: 40, color: Colors.white),
//         ),
//       ),
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return LiquidSwipe(
//       pages: pages,
//       fullTransitionValue: 300.0,
//       enableLoop: true,
//       waveType: WaveType.liquidReveal,
//       positionSlideIcon: 0.8,
//     );
//   }
// }


