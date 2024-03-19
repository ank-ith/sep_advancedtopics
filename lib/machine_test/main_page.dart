import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/machine_test/search_screen.dart';
import 'package:sep_advancedtopics/machine_test/signup_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int index = 0;

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const SignUpScreen(),
      const SearchScreen(),
      const SearchScreen()
    ];

    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF4EF037),
          selectedItemColor: Colors.grey,
          unselectedItemColor: Colors.white,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '',
                ),
            BottomNavigationBarItem(icon: Icon(Icons.person_search), label: ''),
          ]),
    );
  }
}
