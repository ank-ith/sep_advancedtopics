import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/storages/shared_preferences/login_and_registration/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register_Shared extends StatefulWidget {
  @override
  State<Register_Shared> createState() => _Register_SharedState();
}

class _Register_SharedState extends State<Register_Shared> {
  var formkey = GlobalKey<FormState>();
  var uname_ctrl = TextEditingController();
  var pass_ctrl = TextEditingController();
  var phone_ctrl = TextEditingController();
  late SharedPreferences preferences;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Center(
          child: Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      controller: uname_ctrl,
                      validator: (username) {
                        if (username!.isEmpty || !username.contains('@')) {
                          return 'Invalid Username';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: 'username', border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'phone', border: OutlineInputBorder()),
                      controller: phone_ctrl,
                      validator: (phone) {
                        if (phone!.isEmpty || phone.length < 10) {
                          return 'invalid Phone number';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'password', border: OutlineInputBorder()),
                        controller: pass_ctrl,
                        validator: (password) {
                          if (password!.isEmpty || password.length < 6) {
                            return 'Password is empty /Password should be greater than 6 charachters';
                          } else {
                            return null;
                          }
                        }),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var valid = formkey.currentState!.validate();
                        if (valid == true) {
                          storeData();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Invalid Input!!!')));
                        }
                      },
                      child: Text('Register')),
                ],
              )),
        ));
  }

  void storeData() async {
    String email = uname_ctrl.text.trim();
    String password = pass_ctrl.text.trim();
    int phone = int.parse(phone_ctrl.text);
    preferences = await SharedPreferences.getInstance();
    preferences.setString('username', email);
    preferences.setString('password', password);
    preferences.setInt('phone', phone);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginShared()));
  }
}
