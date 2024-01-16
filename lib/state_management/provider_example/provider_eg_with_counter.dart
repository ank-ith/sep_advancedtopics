import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/counter_controller.dart';

void main() {
  runApp(MaterialApp(
    home: ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: Counter_provider_ex(),
    ),
  ));
}

class Counter_provider_ex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counterController = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('you have pushed this button this many times'),
            SizedBox(
              height: 15,
            ),
            Text('counter value:${counterController.counter_value.value}'),
            ElevatedButton(
                onPressed: () {
                  counterController.increment_Count();
                },
                child: Text('Increment Value'))
          ],
        ),
      ),
    );
  }
}
