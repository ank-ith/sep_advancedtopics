import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/theme_controller.dart';

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).isDarkTheme
          ? ThemeData.dark()
          : ThemeData.light(),
      home: App_Theme_Changer(),
    );
  }
}

class App_Theme_Changer extends StatelessWidget {
  const App_Theme_Changer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Theme'),),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).switchTheme();
            },
            child: Text('Switch Theme')),
      ),
    );
  }
}

void main() {
  runApp(ChangeNotifierProvider(create: (BuildContext context) =>ThemeProvider(),
  child: MyApp1()));
}
