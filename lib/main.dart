import 'package:flutter/material.dart';

void main() {
  runApp(WorkoutApp());
}

//model class
class Workout {
  final String sport;

  Workout({required this.sport});
}

//controller class
class WorkoutController {
  List<Workout> _sp = [
    Workout(sport: "Football"),
    Workout(sport: "Cycling"),
    Workout(sport: "Running"),
    Workout(sport: "Swimming"),
    Workout(sport: "Skying"),
  ];

  List<Workout> get sports => _sp;
}

//view class
class WorkoutView extends StatelessWidget {
  final WorkoutController controller;

  WorkoutView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workout Collection"),
      ),
      backgroundColor: Color(0xFFF081),
      body: ListView.builder(
        itemCount: controller.sports.length,
        itemBuilder: (context, index) {
          Workout d = controller.sports[index];
          return ListTile(
            title: Text(
              d.sport,
              style: TextStyle(
                fontSize: 24,
                color: Colors.deepPurple[900],
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                wordSpacing: 4.0,
              ),
            ),
          );
        },
      ),
    );
  }
}

class WorkoutApp extends StatelessWidget {
  final WorkoutController controller = WorkoutController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Workout App",
      home: WorkoutView(controller: controller),
    );
  }
}
