import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/storages/sqfliteee/sq_admin_home.dart';
import 'package:sep_advancedtopics/storages/sqfliteee/sq_registration.dart';
import 'package:sep_advancedtopics/storages/sqfliteee/sq_user_home.dart';
import 'package:sep_advancedtopics/storages/sqfliteee/sql_functionn.dart';

class Sq_Login extends StatelessWidget {
  var formkey=GlobalKey<FormState>();
  var email_ctrl=TextEditingController();
  var pass_ctrl=TextEditingController();


  @override
  Widget build(BuildContext context) {

    void loginUser(String email, String pwd) async{
      //admin login
      if(email=='admin@gmail.com'&&pwd=='admin123'){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminHome()));
      }
      else{
        //check if user is existing in DB
        var data=await SQL_Functions.checkUserExist(email,pwd);
        if(data.isNotEmpty){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>User_Home(data: data,)));
        }
      }
    }

    return Scaffold(
      body: Center(
        child: Form(key: formkey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(controller: email_ctrl,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Email'),
                  validator: (email) {
                    if (email!.isEmpty || !email.contains('@')) {
                      return 'Invalid Email Format';
                    }
                    else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(controller: pass_ctrl,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Password'),
                    validator: (pass) {
                      if (pass!.isEmpty || pass.length < 6) {
                        return 'Invalid Password Format';
                      }
                      else {
                        return null;
                      }
                    }),
              ),
              const SizedBox(height: 25,),
              ElevatedButton(onPressed: (){
                var valid=formkey.currentState!.validate();
                if(valid){
                  loginUser(email_ctrl.text,pass_ctrl.text);
                }else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please Verify All The Fields')));
                }
              }, child: const Text("Login")),
              TextButton(onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context) =>SQ_Register() ,)), child: Text('New User? Register Here'))
            ],
          ),
        ),
      ),
    );
  }
}
