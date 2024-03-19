import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:DashboardApp() ,));
}

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> jobs = [
      'Designer',
      'Developer',
      'Doctor',
      'Gym Trainer',
      'Electritian',
      'Manager',
      'Teacher',
      'Sales Man',
      'More'
    ];
    List<IconData> icons = [
      Icons.insert_chart,
      Icons.abc,
      Icons.ac_unit,
      Icons.accessibility,
      Icons.person,
      Icons.book,
      Icons.laptop,
      Icons.home,
      Icons.screen_lock_landscape_outlined,
    ];
    return Scaffold(
        appBar: AppBar(leading: Icon(Icons.arrow_back),elevation: 0,backgroundColor: Colors.deepPurple[600],
          title: Text('Dashboard'),
        ),
        body:
          Column(
            children: [
              Align(alignment:Alignment.centerLeft,child: Text('Find jobs',style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),)),
              Expanded(
                child: Container(
                  child: GridView.builder(
                    itemCount: jobs.length,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemBuilder: (context, index) {
                     return Column(
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(height: 50,width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.primaries[
                                  Random().nextInt(Colors.primaries.length)]),
                              child: Icon(icons[index]),
                            ),
                          ),
                          Text(
                            jobs[index],
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.deepPurple[600],elevation: 12.0,items:[
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.grey,),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.grey),label: 'account'),
          BottomNavigationBarItem(icon: Icon(Icons.settings,color: Colors.grey),label: 'settings'),
        ]),
        );
  }
}
