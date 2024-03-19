import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/test1/test_dash.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final email_ctrl = TextEditingController();
    final pwd_ctrl = TextEditingController();

    return Scaffold(resizeToAvoidBottomInset: true,
      backgroundColor: Colors.deepPurple[600],
      appBar: AppBar(
        toolbarHeight: 200,
        title: Align(
          alignment: Alignment.topRight,
          child: Text(
            'a',
            style:
            TextStyle(fontSize: 150, color: Colors.grey.withOpacity(0.5)),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(45.0)),
              //circular(50),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Welcome Back',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextFormField(
                            controller: email_ctrl,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'eg:jhondoe@gmail.com',
                                labelText: "Email address",
                                suffixIcon: Icon(
                                  Icons.done_outline_sharp,
                                  color: Colors.lightGreen,
                                )),
                          ),
                          TextFormField(
                            controller: pwd_ctrl,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Password",
                                suffixIcon: Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.lightGreen,
                                )),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Text('Forgot Password?')),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Log in'),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple[600],
                                shape: StadiumBorder()),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Dont have an account?',
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextButton(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.deepPurple[600]),
                                ),
                                onPressed: () {
                                  auth.signInWithEmailAndPassword(email: email_ctrl.text, password: pwd_ctrl.text).then((result){if(result==null){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => DashboardApp()));
                                  }
                                  else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        backgroundColor: Colors.blue, content: Text('error')));
                                  }}
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDSe8hQb-00Cdfsesoyqecmal1zGeEA2T8",
          appId: "1:960760904715:android:9c6ee0b75f972ca7721b0e",
          messagingSenderId: "",
          projectId: "fir-new-6ea87",
          storageBucket: "fir-new-6ea87.appspot.com"));
  runApp(MaterialApp(
    home: Login(),
  ));
}
