import 'package:flutter/material.dart';

void main() {
  runApp(HabitsApp());
}

// Model class for a healthy habit
class Habit {
  final String name; // Name of the habit

  Habit({required this.name}); // Constructor for Habit
}

// Presenter class for managing the behavior of the Healthy Habits screen
class HabitsPresenter {
  late HabitsView _view;
  late HabitsController _controller;

  // Attach the view and controller to the presenter
  void attach(HabitsView view, HabitsController controller) {
    _view = view;
    _controller = controller;
  }

  // Get the list of healthy habits from the controller
  List<Habit> getHabits() {
    return _controller.habits;
  }
}

// View interface for displaying the Healthy Habits screen
abstract class HabitsView {
  void displayHabits(List<Habit> habits);
}

// View class for rendering the Healthy Habits screen
class HabitsScreen extends StatelessWidget implements HabitsView {
  final HabitsPresenter presenter;

  HabitsScreen({required this.presenter}); // Constructor for HabitsScreen

  @override
  Widget build(BuildContext context) {
    // Attach the view and controller to the presenter
    presenter.attach(this, HabitsController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Healthy Habits"),
      ),
      body: FutureBuilder<List<Habit>>(
        // Use the presenter to get the list of healthy habits
        future: Future(() => presenter.getHabits()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Display the list of healthy habits
            List<Habit> habits = snapshot.data!;
            return ListView.builder(
              itemCount: habits.length,
              itemBuilder: (context, index) {
                Habit habit = habits[index];
                return ListTile(
                  title: Text(habit.name),
                );
              },
            );
          } else {
            // Display a loading indicator while waiting for the data
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  // Display the list of healthy habits
  @override
  void displayHabits(List<Habit> habits) {
    // Not used in this implementation, but could be used in a more complex app
  }
}

// Controller class for managing healthy habits data
class HabitsController {
  // List of healthy habits
  List<Habit> _habits = [
    Habit(name: "Drink 8 cups of water"),
    Habit(name: "Eat 5 servings of fruits and vegetables"),
    Habit(name: "Exercise for 30 minutes"),
    Habit(name: "Get 8 hours of sleep"),
  ];

  // Getter for the list of healthy habits
  List<Habit> get habits => _habits;
}

// App class for running the Healthy Habits app
class HabitsApp extends StatelessWidget {
  final HabitsPresenter presenter = HabitsPresenter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Healthy Habits App",
      home: HabitsScreen(presenter: presenter),
    );
  }
}