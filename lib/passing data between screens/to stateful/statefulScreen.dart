import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  String name;
  String place;
  Screen1({super.key, required this.name, required this.place});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome ${widget.name},${widget.place}',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
