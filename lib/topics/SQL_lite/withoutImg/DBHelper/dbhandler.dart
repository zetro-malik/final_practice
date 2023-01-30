import 'package:final_practice/topics/SQL_lite/withoutImg/Model/studentmodel.dart';
import 'package:sqflite/sqflite.dart';
class DatabaseHandler
{
  DatabaseHandler._privateConstructor();
  static DatabaseHandler instance=DatabaseHandler._privateConstructor();

   Database? _database;
  Future<Database> get getdatabase  async{
    _database ??= await initializeDatabase();
    return _database!;

  }
  Future<Database> initializeDatabase()async
  {
    String dbpath=await getDatabasesPath();
    dbpath=dbpath+"/mydb.db";
    Database db=await openDatabase(dbpath,version: 1,onCreate: _createDB);
   return db;
  }
  void _createDB(Database db,int version)
  {
    String query='''
                  create table student(
                    ID INTEGER PRIMARY KEY AUTOINCREMENT,
                    name TEXT,
                    age INTEGER,
                    contact TEXT
                  )
                 ''';
                 db.execute(query);

  }



  Future<List<Student>> getData() async
  {

    Database db=await getdatabase;


    List<Map<String,dynamic>> rows= await db.query('student');
    List<Student> slist=[];
    for(int i=0;i<rows.length;i++)
    {
      Map<String,dynamic> row=rows[i];
      Student s=Student.fromMap(row);
      slist.add(s);
     
    }
    return slist;

  }

 Future<int> insertStudent(Student s)async
 {
  
  Database db=await getdatabase;

  
   int rowid=await db.insert('student', s.toMap());
   print('Row ID: $rowid');
   return rowid;
 }

 Future<int> insertStudentData(String name,String contact,int age) async{
  Database db=await getdatabase;
  String query=''' 
        INSERT INTO student(name, contact, age)
         VALUES ('$name', '$contact', '$age');
           ''';
          // db.raw
        int rowid  = await db.rawInsert(query);
        print('Row ID : $rowid');
        return rowid;

 }

 Future<int> deleteStudent(int id)async{
  Database db=await getdatabase;
  // String query='''
  //              delete from student where id=$id
  //              ''';
  //            int r = await db.rawDelete(query);
  //            return r;
  int r=await db.delete('student',where: "id=?",whereArgs: [id]);
  // delte from student where id=1 and age is greater than 17
  //db.delete('student',where: "id=? and age > ?",whereArgs: [1,17]);
  return r;
 }
 Future<int> updateStudent(Student s)async{
  Database db=await getdatabase;
  // String query='''
  //   update student set 
  //            name='${s.name}',
  //            contact='${s.contact}',
  //            age='${s.age}'
  //            where id='${s.id}'
  //             ''';
  //         int r =await db.rawUpdate(query);
       int r=await   db.update('student', 
                     s.toMap(),
                    where: "id=?",
                    whereArgs: [s.id]);
                  
      print('rows effected $r');

          return r;

 }
}














