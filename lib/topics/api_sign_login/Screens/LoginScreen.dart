import 'dart:convert';


import 'package:final_practice/topics/api_sign_login/Screens/admindashboard.dart';
import 'package:final_practice/topics/api_sign_login/Screens/signup.dart';
import 'package:final_practice/topics/api_sign_login/Screens/studentdashboard.dart';
import 'package:final_practice/topics/api_sign_login/Screens/teacherdashboard.dart';
import 'package:final_practice/topics/api_sign_login/Utilities/CustomWidgets/custombutton.dart';
import 'package:flutter/material.dart';

import '../Models/usermodels.dart';
import '../Utilities/CustomWidgets/customtextform.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);
  TextEditingController emailcont=TextEditingController();
  TextEditingController passwordcont=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Screen')),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children:[
            CustomTextForm('Email','Email',null,false, emailcont,
              Icon(Icons.email)
            ),
            SizedBox(height: 10,),
             CustomTextForm('Password','Password','*',true, 
              passwordcont,
              Icon(Icons.password)
            ),
            SizedBox(height: 10,),
            CustomButton('Login',()async{
              User u=new User();
              u.email=emailcont.text;
              u.password=passwordcont.text;
              String? response=await u.login();
              if(response==null)
              {
                //show alert of error
          
              }
              else if(response=="\"false\"")
              {
                //show alert invalued email password
              }
              else{
               dynamic map =jsonDecode(response);
               User u=User.fromMap(map);
               String role=u.role.toLowerCase();
               String email=u.email;
                
               if(role=="admin")
               {
               
                Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (context){
                  return AdminHomePage(u);

                }));

               }
               else if(role=="teacher")
               {
                Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (context){
                  return TeacherHomePage(email);

                }));

               }
               else if(role=="student")
               {
                Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (context){
                  return StudentHomePage(email);

                }));

               }

              }

            }),
            SizedBox(height: 10,),
            TextButton(onPressed: (){
               Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (context){
                  return SignupPage();

                }));


            }, child:Text('Create Account',style: TextStyle(fontSize: 25),))


          ]
          

        ),
      ),

    );
    
  }
}