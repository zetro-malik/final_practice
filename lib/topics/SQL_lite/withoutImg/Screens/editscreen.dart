import 'package:final_practice/topics/SQL_lite/withoutImg/DBHelper/dbhandler.dart';
import 'package:final_practice/topics/SQL_lite/withoutImg/Model/studentmodel.dart';
import 'package:final_practice/topics/SQL_lite/withoutImg/mywidgets/mywidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


class EditScreen extends StatefulWidget {
   Student sobj;
   EditScreen(this.sobj);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController contname=TextEditingController();
  TextEditingController contage=TextEditingController();
  TextEditingController contcontact=TextEditingController();
  @override
  Widget build(BuildContext context) {
    contname.text=widget.sobj.name;
    contage.text=widget.sobj.age.toString();
    contcontact.text=widget.sobj.contact;
    return Scaffold(
      appBar: AppBar(title: getTextWidget(data: 'Edit Screen')),
      body: Column(
        children: [
          TextFormField(controller: contname,),
          TextFormField(controller: contcontact,),
            TextFormField(controller: contage,),
            ElevatedButton(onPressed: () async {
              widget.sobj.age=int.parse(contage.text);
              widget.sobj.name=contname.text;
              widget.sobj.contact=contcontact.text;
              await DatabaseHandler.instance.updateStudent(widget.sobj);
              Navigator.pop(context);
            }, child: Text("Update"))

        ],


      )

    );
    
  }
}





