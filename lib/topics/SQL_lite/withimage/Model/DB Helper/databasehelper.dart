import 'dart:io';
import 'package:final_practice/topics/SQL_lite/withimage/Model/Model/doctormodel.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // database
  DatabaseHelper._privateConstructor(); // Name constructor to create instance of database
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  // getter for database

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS
    // to store database

    String path = await getDatabasesPath();
   path = path+"/doctors.db";

    // open/ create database at a given path
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );

    return db;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''Create TABLE tbl_doctor (
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  name TEXT,
                  experience INTEGER ,
                  spec TEXT,
                  image TEXT
                  )
    
    ''');
    
  }





  
  Future<int> insertDoctor(Doctor d)async{
    Database db=await instance.database;

     int r=await db.insert('tbl_doctor', d.toMap());
     return r;
  }



  Future<List<Doctor>> getAllDoctors()async{

    Database db=await instance.database;


    List<Map<String,dynamic>> rows=await db.query('tbl_doctor');
    List<Doctor> doctor_data=[];
    for(int i=0;i<rows.length;i++)
    {
      Map<String,dynamic> row=rows[i];
      Doctor obj=Doctor.fromMap(row);
      doctor_data.add(obj);
    }
    return doctor_data;

  } 



}






