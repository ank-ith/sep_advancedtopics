import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sep_advancedtopics/state_management/provider_example/controller/counter_controller.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => CounterProvider(),
        child: MyHomepage1(),
      ),
    );
  }
}

class MyHomepage1 extends StatelessWidget {
  const MyHomepage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('consumer with provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Text('Counter value:',style: TextStyle(fontSize: 20),),
            Consumer(builder: (context,CounterProvider,child){
              return Text('${counter}')
            })
          ],
        ),
      ),
    );
  }
}
