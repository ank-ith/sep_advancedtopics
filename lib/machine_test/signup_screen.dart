import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/machine_test/search_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          'Sign Up',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [Icon(Icons.more_vert)],
        toolbarHeight: 90,
        backgroundColor: Color(0xFF4EF037),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('I\'m looking for a teacher'),
              height: 150,
              minWidth: double.infinity,
              onPressed: () {},
              color: Color(0xFF4EF037),
              focusColor: Color(0xFF4EF037),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              child: Text('I\'m looking a teacher'),
              height: 150,
              minWidth: double.infinity,
              onPressed: () {},
              color: Colors.white,
              focusColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              child: Text('I\'m looking for a teacher'),
              height: 150,
              minWidth: double.infinity,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen(),));
              },
              color: Colors.white,
              focusColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}
