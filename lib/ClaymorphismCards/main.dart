import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Claymorphism Card Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClaymorphismCard(),
    );
  }
}

class ClaymorphismCard extends StatefulWidget {
  @override
  _ClaymorphismCardState createState() => _ClaymorphismCardState();
}

class _ClaymorphismCardState extends State<ClaymorphismCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initializing animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

    // Initializing animation with curve
    _animation = Tween<double>(
      begin: 1.0,
      end: 0.9,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    // Disposing animation controller
    _animationController.dispose();

    super.dispose();
  }

  void _onCardPressed() {
    // Playing animation when card is pressed
    _animationController.forward().then((value) {
      _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB4E3C7), // new pastel green color
      appBar: AppBar(
        title: Text('Claymorphism Card Example'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: GestureDetector(
            onTapDown: (_) {
              _onCardPressed();
            },
            onTapUp: (_) {
              _animationController.reverse();
            },
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFD1D9E6),
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Study More',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Studying is not just important for educational development, but also builds personal skills. Having good study skills can improve your confidence, competence, and self-esteem. ',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xff333333),
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0.5,
                        height: 1,
                        decoration: TextDecoration.none,
                        fontFamily: 'Poppins-Light',
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     TextButton(
                    //       onPressed: () {},
                    //       child: Text(
                    //         'Learn more',
                    //         style: TextStyle(
                    //           fontSize: 16.0,
                    //           color: Colors.blueAccent,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
