class Student
{
  late int id,age;
  late String contact,name;
  Student();
  Student.fromMap(Map<String,dynamic> row){
    id=row["ID"];
    name=row["name"];
    contact=row["contact"];
    age=row["age"];

  }
  Map<String,dynamic> toMap(){
    Map<String,dynamic> mp=Map<String,dynamic>();
  mp["name"]=name;
  mp["contact"]=contact;
  mp["age"]=age;
  return mp;
  }
}