import 'dart:io';

import 'package:final_practice/topics/api_sign_login/Utilities/Global/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import '../Models/usermodels.dart';

class AdminHomePage extends StatelessWidget {
  String ip='http://192.168.15.113/appapisection2/api';
String imgpath='http://192.168.15.113/appapisection2/Content/Uploads/';
  User u;
AdminHomePage(this.u);
File? imgfile;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        
        title: Text('Admin Home Page'),
        actions: [
          TextButton(onPressed: (){

          }, child: Text('Logout',style: TextStyle(color: Colors.white),))
        ],
      
      
      ),
      drawer: Drawer(
        child: Column(
          children:[
            SafeArea(
              child: Container(
                height: 200,
                width: 300,
                color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:u.img==null?null:
                          NetworkImage(imgpath+u.img!),
                        ),
                        Positioned(
                          top: 70,
                          right: 30,
                          left: 50,
                          child: GestureDetector(
                            onTap: ()async{
                             XFile? file=await ImagePicker().pickImage(
                                               source: ImageSource.camera
                                               );
                            if(file!=null)
                            {
                              imgfile=File(file.path);
                              u.uploadPic(imgfile!);
                            }

                            },
                            
                            child: Icon(Icons.camera_alt_outlined)))
                      ],
                    )
                  ],
                ),
              ),
            )

          ]
        ),

      ),
    

      body: Center(
        child: Text(u.email,style: TextStyle(fontSize: 30),),
      ),

    );
    
  }
}