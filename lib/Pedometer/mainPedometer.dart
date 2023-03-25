// import 'package:flutter/material.dart';
// import 'package:pedometer/pedometer.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       home: PedometerExample(),
//     );
//   }
// }
//
// class PedometerExample extends StatefulWidget{
//   @override
//   _PedometerExampleState createState() => _PedometerExampleState();
// }
// class _PedometerExampleState extends State<PedometerExample>{
//   late Stream<StepCount> _stepCountStream;
//   late Stream<PedestrianStatus> _pedestrianStatusSteam;
//
//   int _steps = 0;
//   String _status = "unknown";
//
//   @override
//   void initState(){
//     super.initState();
//
//     initPlatformState();
//   }
//
//   Future<void> initPlatformState() async{
//     _stepCountStream = await Pedometer.stepCountStream;
//     _pedestrianStatusSteam = await Pedometer.pedestrianStatusSteam;
//
//     _stepCountStream.listen(onStepCount).onError(onStepCountError);
//     _pedestrianStatusSteam.listen(onPedestrianStatusChanged).onError(onPedestrianStatusChangedError);
//   }
//
//
// }
