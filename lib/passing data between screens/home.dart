import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/passing%20data%20between%20screens/to%20stateful/statefulScreen.dart';
import 'package:sep_advancedtopics/passing%20data%20between%20screens/to%20stateless/StatelessScreen.dart';

class DataHome extends StatelessWidget {
  String name = 'luminar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 3,
        title: Text('Data Passing'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Screen2(name: name, place: 'kakkanad')));
                },
                child: Text("to Stateless Screen")),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Screen1(name: name, place: 'kakkanad',)));

            }, child: Text("to Stateful Screen"))
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(theme: ThemeData(useMaterial3: true),
    home: DataHome(),

  ));
}
