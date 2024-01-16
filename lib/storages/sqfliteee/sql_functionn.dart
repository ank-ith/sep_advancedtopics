import 'package:sqflite/sqflite.dart'as sql;
class SQL_Functions{
  //create database
  static Future<sql.Database>openOrCreateDB() async{
    return sql.openDatabase('users',version: 1,onCreate: (sql.Database db,int version) async{
      await createTable(db);
    });
  }
  static Future<int> addUser(String name, String email, String password) async{
    var db=await SQL_Functions.openOrCreateDB();//to open database
    var data={'name':name,'email':email,'password':password};
    var id=db.insert('userdata', data);
    return id;
  }
//create table to store user data
  static Future<void> createTable(sql.Database db) async{
    await db.execute('CREATE TABLE userdata (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, email TEXT, password TEXT)');
  }
//check if user & password exist in  the table
  static Future<List<Map>> checkUserExist(String email, String pwd) async{
    var db=await SQL_Functions.openOrCreateDB();
    final data=await db.rawQuery("SELECT * FROM userdata WHERE email='$email' AND password='$pwd'");
    if(data.isNotEmpty){
      return data;
    }
    else{
      return data;
    }
  }

  static Future<List<Map>> checkUser_already_exist(String email) async{
    var db=await SQL_Functions.openOrCreateDB();
    final user=await db.rawQuery("SELECT * FROM userdata WHERE email='$email'");
    if(user.isNotEmpty){
      return user;
    }
    else{
      return user;
    }
  }
  //to read all data
  static Future<List<Map<String,dynamic>>> printDb() async{
    var db=await SQL_Functions.openOrCreateDB();
    final database=await db.rawQuery("SELECT * FROM userdata");
    return database;
  }
  //to delete users
  static Future deleteUser(id) async{
    var db=await SQL_Functions.openOrCreateDB();
    db.delete('userdata',where: 'id=?',whereArgs: [id]);
  }

  static Future<int> updateUser(int id, String uname, String uemail) async{
    var db=await SQL_Functions.openOrCreateDB();
    final newdata={'name':uname,'email':uemail};
    final newid=await db.update('userdata', newdata,where: 'id=?',whereArgs: [id]);
    return newid;
  }

}