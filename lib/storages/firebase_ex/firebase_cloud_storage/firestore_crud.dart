import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDSe8hQb-00Cdfsesoyqecmal1zGeEA2T8",
          appId: "1:960760904715:android:9c6ee0b75f972ca7721b0e",
          messagingSenderId: "",
          projectId: "fir-new-6ea87",
          storageBucket: "fir-new-6ea87.appspot.com"));
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(
    home: FirebaseCrud(),
  ));
}

class FirebaseCrud extends StatefulWidget {
  const FirebaseCrud({super.key});

  @override
  State<FirebaseCrud> createState() => _FirebaseCrudState();
}

class _FirebaseCrudState extends State<FirebaseCrud> {
  var name_cntrl = TextEditingController();
  var email_cntrl = TextEditingController();
  late CollectionReference _userCollection;

  @override
  void initState() {
    _userCollection = FirebaseFirestore.instance.collection('users');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('firebase cloud storage')),
      body: Column(
        children: [
          TextField(
            controller: name_cntrl,
            decoration: InputDecoration(
                labelText: 'name',
                border: OutlineInputBorder(),
                hintText: 'name'),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: email_cntrl,
            decoration: InputDecoration(
                labelText: 'email',
                border: OutlineInputBorder(),
                hintText: 'email'),
          ),
          ElevatedButton(
              onPressed: () {
                addUsers();
              },
              child: Text('add users')),
          SizedBox(
            height: 15,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('error${snapshot.error}');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                final users = snapshot.data!.docs;
                return Expanded(
                    child: ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          final userId = user.id;
                          final userName = user['name'];
                          final userEmail = user['email'];
                          return ListTile(
                            title: Text(
                              '$userName',
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text(
                              '$userEmail',
                              style: TextStyle(fontSize: 15),
                            ),
                            trailing: Wrap(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      editUser(userId);
                                    },
                                    icon: Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {
                                      deleteUser(userId);
                                    },
                                    icon: Icon(Icons.delete))
                              ],
                            ),
                          );
                        }));
              })
        ],
      ),
    );
  }

  Future<void> addUsers() async {
    return _userCollection.add(
        {'name': name_cntrl.text, 'email': email_cntrl.text}).then((value) {
      print('user added successfully');
      name_cntrl.clear();
      email_cntrl.clear();
    }).catchError((error) {
      print('failed to add user $error');
    });
  }

//read
  Stream<QuerySnapshot> getUser() {
    return _userCollection.snapshots();
  }

  void editUser(var id) {
    showDialog(
        context: context,
        builder: (context) {
          final newname_ctrl = TextEditingController();
          final newemail_ctrl = TextEditingController();
          return AlertDialog(
            title: Text('Update user'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: newname_ctrl,
                  decoration: InputDecoration(hintText: 'enter name'),
                ),
                TextField(
                  controller: newemail_ctrl,
                  decoration: InputDecoration(hintText: 'enter name'),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    updateUser(id, newemail_ctrl.text, newemail_ctrl.text)
                        .then((value) {
                      Navigator.pop(context);
                    });
                  },
                  child: Text('update'))
            ],
          );
        });
  }

  Future<void> updateUser(var id, String newname, String newemail) {
    return _userCollection
        .doc(id)
        .update({'name': newname, 'email': newemail}).then((value) {
      print('user updated successfully');
    }).catchError((error) {
      print('user data updation failed');
    });
  }

  Future<void> deleteUser(var id) {
    return _userCollection.doc(id).delete().then((value) {
      print('user deleted successfully');
    }).catchError((error) {
      print('user data deletion failed');
    });
  }
}
