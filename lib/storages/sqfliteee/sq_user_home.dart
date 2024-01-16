import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/storages/sqfliteee/sql_functionn.dart';

class User_Home extends StatefulWidget {
  final data;
  User_Home({super.key, required this.data});

  @override
  State<User_Home> createState() => _User_HomeState();
}

class _User_HomeState extends State<User_Home> {
  var cemail = TextEditingController();
  var cname = TextEditingController();
  var name,email;
  @override
  void initState() {
    ///fetching the user details and assign it to these instance variables
    name = widget.data[0]['name'];
    email = widget.data[0]['email'];
    super.initState();
  }
  Widget build(BuildContext context) {

    var name = widget.data[0]['name'];
    var nameEditCtrl = TextEditingController();
    var emailEditCtrl = TextEditingController();
    void editData() {
      setState(() {
        ///setting the current user details to the text fields inside alert box
        cname.text  = name;
        cemail.text = email;
      });
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(title:Text(
              'edit data',
              style: TextStyle(fontSize: 15),
            ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  TextField(
                    controller: cname,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Edit Name'),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: cemail,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Edit Email'),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      name=cname.text;
                      email=cemail.text;
                    });
                    updateUser();
                    Navigator.of(context).pop();
                    //await SQL_Functions.updateUser(id,nameEditCtrl.text,emailEditCtrl.text);

                  }, child: Text('update data')),
                  MaterialButton(onPressed: (){

                  },child: Text('Cancel'),)
                ],
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $name'),
        elevation: 5,
      ),
      body: Card(
        child: ListTile(
          leading: Icon(Icons.person_outline_outlined),
          title: Text(
            '$name',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(
            '$email',
            style: TextStyle(fontSize: 20),
          ),
          trailing: IconButton(
            onPressed: () {
              editData();
            },
            icon: Icon(Icons.edit),
          ),
        ),
      ),
    );
  }

  void updateUser() async{
    await SQL_Functions.updateUser(widget.data[0]['id'], name, email);
  }
}
