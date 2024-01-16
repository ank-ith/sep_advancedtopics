import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/storages/sqfliteee/sql_functionn.dart';

class AdminHome extends StatefulWidget {
  AdminHome({super.key});


  @override
  State<AdminHome> createState() => _AdminHomeState();
}


class _AdminHomeState extends State<AdminHome> {
  List<Map<String, dynamic>> users =
      [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllUsers();
  }
  //empty list to read users from database
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Admin Home Page'),
        ),
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(child: Text('${users[index]['id']}')),
                  title: Text(users[index]['name']),
                  subtitle: Text(users[index]['email']),
                  trailing: IconButton(
                      onPressed: () {
                        delete(users[index]['id']);
                      },
                      icon: Icon(Icons.delete)),
                ),
              );
            }));
  }

  void delete(int id) async {
    await SQL_Functions.deleteUser(id);
    getAllUsers();//to refresh the list while users are deleted
  }

  void getAllUsers() async{
    var usersfromdb=await SQL_Functions.printDb();
    setState(() {
      users=usersfromdb;
    });
  }
}
