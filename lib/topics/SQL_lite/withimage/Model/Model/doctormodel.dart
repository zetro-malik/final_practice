class Doctor
{
  late int id,exp;
  late String name,specialization,picture;
  Doctor(this.exp,this.name,this.specialization,this.picture);

  // comming from sqflite or API
  Doctor.fromMap(Map<String,dynamic> doctor_map){
    name=doctor_map["name"];
    exp=doctor_map["experience"];
    specialization= doctor_map["spec"];
    picture=doctor_map["image"];
    id=doctor_map["id"];

  }

  Map<String,dynamic> toMap(){
    var doctor_map=Map<String,dynamic>();
    doctor_map["name"]=name;
    doctor_map["experience"]=exp;
    doctor_map["spec"]=specialization;
    doctor_map["image"]=picture;

    return doctor_map;

  }

}