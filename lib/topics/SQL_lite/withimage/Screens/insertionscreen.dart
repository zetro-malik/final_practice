import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:final_practice/topics/SQL_lite/withimage/Model/DB%20Helper/databasehelper.dart';
import 'package:final_practice/topics/SQL_lite/withimage/Model/Model/doctormodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class DoctorInsertionPage extends StatefulWidget {
  const DoctorInsertionPage({Key? key}) : super(key: key);

  @override
  State<DoctorInsertionPage> createState() => _DoctorInsertionPageState();
}

class _DoctorInsertionPageState extends State<DoctorInsertionPage> {
  File? _image;
  TextEditingController namecont=TextEditingController();
  TextEditingController expcont=TextEditingController();
  List<String> spec_list=["Cardio","Medical","Ortho"];
  String? selected_spec;
  List<DropdownMenuItem<String>> getMenuItems(){
    List<DropdownMenuItem<String>> menuItems=[];
    spec_list.forEach((element) {
      DropdownMenuItem<String> menuItem=DropdownMenuItem<String>(
       value:element,
        child: Text(element,style: TextStyle(fontSize: 30),));
        menuItems.add(menuItem);
    }
    
    );
    return menuItems;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Insert")),
      body: Column(
        children:[
          Container(
            color: Colors.grey,
            height: 100,
            width: 100,
            child: _image==null?null:
                  Image.file(_image!,
                  fit: BoxFit.fill,),
          ),
          IconButton(onPressed: ()async{
           XFile? picked_image=await ImagePicker().pickImage(source: ImageSource.camera);
                if(picked_image!=null){
                  setState(() {
                    
                  _image=File(picked_image.path);
                  });
                }


          }, icon: Icon(Icons.camera_alt_rounded)),

          TextFormField(
            controller: namecont,
            style: TextStyle(fontSize: 30),
            decoration: InputDecoration(
              hintText: 'Enter Name',
              labelText: 'Name'
            ),
            
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: expcont,
            style: TextStyle(fontSize: 30),
            decoration: InputDecoration(
              hintText: 'Enter Experience',
              labelText: 'Experience'
            )),
            SizedBox(height: 10,),
            DropdownButton(
            value: selected_spec,  
            items: getMenuItems(), 
            onChanged: (value){
              setState(() {
                selected_spec=value.toString();
              });
            }),
            SizedBox(height: 10,),

            ElevatedButton(onPressed: ()async{
                   var v=await _image!.readAsBytes();
                   String convertedpic=base64Encode(v);
                   int exp=int.parse(expcont.text);
                   Doctor obj=Doctor(exp, namecont.text, 
                                               selected_spec!, convertedpic);
                 int r=await DatabaseHelper.instance.insertDoctor(obj);
                  print('Row id:${obj.id}');
            }, child: Text('Save',style: TextStyle(fontSize: 30),))


        ]
      ),
    );
    
  }
}