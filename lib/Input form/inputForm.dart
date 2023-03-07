//import the material library - provides us with the necessary widget
import 'package:flutter/material.dart';

//define the main function which runs the app
void main() {
  //Run the app by creating an instance of MyApp and calling runApp();
  runApp(MyApp());
}

//Define the MyApp widget, which is the root of the app
class MyApp extends StatefulWidget {
  //Create a stateful widget by extending StatefulWidget and overriding createState()
  @override
  _MyAppState createState() => _MyAppState();
}

//Define the _MyAppState class which extends State and holds the mutable state of the widget
class _MyAppState extends State<MyApp> {
  //Create a global key that uniquely identifies the form
  final _formKey = GlobalKey<FormState>();

  //Declare two varaibles to hold the form input data
  String _name = '';
  String _email = '';

//Define a function to handle form submission
  void _submitForm() {
    //validate the form input
    if (_formKey.currentState!.validate()) {
      //save the form input to variables
      _formKey.currentState!.save();

      //print the form input data to the console
      print('Name: $_name');
      print('Email: $_email');
    }
  }

//Building the widget tree by defining the widget hierarchy and layout
  @override
  Widget build(BuildContext context) {
    //Create a material app which sets up the DEFAULT material design visual elements
    return MaterialApp(
      //set the apps title
      title: 'Flutter Input Form',
      //Create a scaffold for the app which provides a basic app structure and layout
      home: Scaffold(
        //creates app bar sets title for the page
        appBar: AppBar(
          //sets the text for the app bar
          title: Text('Input Form'),
        ),

        //Create a container to hold the form and add padding around it
        body: Container(
          padding: EdgeInsets.all(20),
          //Create a form with a GLOBAL key and a column of form fields
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Create a text form field for the name input
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                  ),

                  //validate the input and return an error message if its invalid
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  //save the input to the name variable
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }

                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                //add some space between the form fields
                SizedBox(height: 20),

                //create a submit button to submit the form
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}