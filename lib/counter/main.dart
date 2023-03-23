import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
//state object for myhomepage
class _MyHomePageState extends State<MyHomePage> {
  //initial starting point, the _counter variable keeps track of the number of times the button has been pressed
  int _counter = 0;

//incrementcounter function is called when the floatingactionbutton is pressed.
  void _incrementCounter() {
    //the setstate function is called to update the state of the app
    setState(() {
      _counter++; //counter = counter + 1
    });
    //The navigator widget is used to navigate to the mysecondpage widget
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MySecondPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            //the updated counter variable and the updated count
            Text(
              '$_counter',
              //the text style is set using the current theme of the app
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),

      //button that when pressed runs the incrementcounter
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class MySecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text(
          'This is the second page!',
        ),
      ),
    );
  }
}