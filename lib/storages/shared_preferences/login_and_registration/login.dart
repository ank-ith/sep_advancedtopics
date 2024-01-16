import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/storages/shared_preferences/login_and_registration/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(
    home: LoginShared(),
  ));
}

class LoginShared extends StatefulWidget {
  @override
  State<LoginShared> createState() => _LoginSharedState();
}

var formkey = GlobalKey<FormState>();
var uname_ctrl = TextEditingController();
var pass_ctrl = TextEditingController();
late SharedPreferences preferences;
late bool newUser;


class _LoginSharedState extends State<LoginShared> {
  @override
  void initState() {
    // TODO: implement initState
    check_ifUser_already_logged_in();
    super.initState();
  }
  void check_ifUser_already_logged_in() async{
    preferences=await SharedPreferences.getInstance();
    // ??-if the given condition is null second statement will be executed
    newUser =preferences.getBool('newUser')??true;
    if(newUser==false){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Shared_Home()));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                      controller: uname_ctrl,
                      decoration: InputDecoration(
                          hintText: 'email', border: OutlineInputBorder())),
                  TextFormField(
                      controller: pass_ctrl,
                      decoration: InputDecoration(
                          hintText: 'password', border: OutlineInputBorder())),
                  ElevatedButton(
                      onPressed: () {
                        var valid = formkey.currentState!.validate();
                        if (valid == true) {
                          validateInput();
                        }
                      },
                      child: Text('Login')),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register_Shared()));
                      },
                      child: Text('New user? register here!!'))
                ],
              )),
        ));
  }

  void validateInput() async {
    String uname = uname_ctrl.text;
    String pwd = pass_ctrl.text;
    preferences = await SharedPreferences.getInstance();
    //if a user is already logged in then mark it as nota a new user
    preferences.setBool('newUser', false);
    //read the registered username
    String? stored_uname = preferences.getString('username');
    String? stored_pass = preferences.getString('password');
    if (stored_uname == uname && stored_pass == pwd) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Shared_Home()));
    }
  }

}
