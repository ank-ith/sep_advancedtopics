import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  String name; //name is received through constructor
  String place;
  Screen2(
      {super.key,
      required this.name,
      required this.place}); //to access name globally

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to $name located at $place',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
