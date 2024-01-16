import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/storages/sqfliteee/sq_login.dart';
import 'package:sep_advancedtopics/storages/sqfliteee/sql_functionn.dart';

class SQ_Register extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var name_ctrl = TextEditingController();
  var email_ctrl = TextEditingController();
  var pass_ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void registerUser(String name, String email, String password) async {
      var id = await SQL_Functions.addUser(
          name, email, password); //id returns when we add new users
      print(id);
      if (id != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Sq_Login()));
      }
    }

    return Scaffold(
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: name_ctrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: email_ctrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Email'),
                  validator: (email) {
                    if (email!.isEmpty || !email.contains('@')) {
                      return 'Invalid Email Format';
                    } else
                      return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: pass_ctrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Password'),
                    validator: (pass) {
                      if (pass!.isEmpty || pass.length < 6) {
                        return 'Invalid Password Format';
                      } else
                        return null;
                    }),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () async {
                    var valid = formkey.currentState!.validate();
                    if (valid == true) {
                      var users = await SQL_Functions.checkUser_already_exist(
                          email_ctrl.text);
                      if (users.isEmpty) {
                        registerUser(
                            name_ctrl.text, email_ctrl.text, pass_ctrl.text);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('User already exists')));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Please Verify All The Fields')));
                    }
                  },
                  child: const Text("Register Now")),
              TextButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Sq_Login())),
                  child: Text('Already registered? Login here'))
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SQ_Register(),
  ));
}
