import 'package:final_practice/topics/SQL_lite/withoutImg/DBHelper/dbhandler.dart';
import 'package:final_practice/topics/SQL_lite/withoutImg/Model/studentmodel.dart';
import 'package:final_practice/topics/SQL_lite/withoutImg/mywidgets/mywidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
class InsertPage extends StatelessWidget {

  TextEditingController name=TextEditingController();
  TextEditingController age=TextEditingController();
  TextEditingController contact=TextEditingController();
  void InsertStudent() async{
    Student s=Student();
    s.age=int.parse(age.text);
    s.contact=contact.text;
    s.name=name.text;
    await DatabaseHandler.instance.insertStudent(s);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: getTextWidget(data: 'Insert Page')),
      body:Column(
        children: [
          getTextForm('Enter name', name),
          SizedBox(height: 10,),
          getTextForm('Enter age', age),
          SizedBox(height: 10,),
          getTextForm('Enter Contact', contact),
        getButton('Insert', InsertStudent)


        ],
      ) ,
    );
    
  }
}