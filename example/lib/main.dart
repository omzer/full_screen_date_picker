import 'package:flutter/material.dart';
import 'package:full_screen_date_picker/full_screen_date_picker.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

// Stateful widget
class _MyAppState extends State<MyApp> {
  String selectedDate = 'Press the fab to selected a date';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // View selected date in the screen
      body: Center(child: Text(selectedDate)),
      // Button to show the date dialog
      floatingActionButton: FloatingActionButton(onPressed: () => onPressed()),
    );
  }

  void onPressed() async {
    DateTime result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => FullScreenDatePicker()),
    );

    if (result != null) {
      setState(() => this.selectedDate = result.toString());
    }
  }
}
