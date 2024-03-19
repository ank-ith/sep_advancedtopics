import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../provider/counter_provider.dart';

class Multi_Provider extends StatelessWidget {
  const Multi_Provider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter value:',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<Count_provider>(context, listen: false)
                      .Increment();
                },
                child: Text('increment counter')),
            Text('Count value:${Provider.of<Count_provider>(context).count}'),
            SizedBox(
              height: 30,
            ),
            Text("Auth details"),
            ElevatedButton(
              onPressed: () {
                Provider.of<Auth_provider>(context,listen: false).login
                    ? Provider.of<Auth_provider>(context,listen: false).loggedout()
                    : Provider.of<Auth_provider>(context,listen: false).loggedin();
              },
              child: Text('Switch login'),
            ),
            Consumer<Auth_provider>(
                builder: (context, authprovider, child) => Text(
                    'User is :${authprovider.login ? 'logged in' : 'logged out'}'))
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
      home: MultiProvider(child: Multi_Provider(), providers: [
    ChangeNotifierProvider(create: (context) => Count_provider()),
    ChangeNotifierProvider(create: (context) => Auth_provider()),
  ])));
}
