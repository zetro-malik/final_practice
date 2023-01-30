
import 'package:final_practice/topics/api_sign_login/Utilities/CustomWidgets/custombutton.dart';
import 'package:final_practice/topics/api_sign_login/Utilities/CustomWidgets/customtextform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Models/usermodels.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String role='admin';
  String? response;
  TextEditingController emailcont=new TextEditingController();
  TextEditingController passwordcont=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
              GestureDetector(
                onTap:(){
                  setState(() {
                    role='admin';
                  });

                },
                child: Container(
                  child: Text('Admin',style: TextStyle(fontSize: 20),),
                  height: 30,
                  width: 100,
                  decoration:BoxDecoration(
                    color: role=='admin'?Color.fromARGB(255, 4, 60, 106):
                                   Colors.grey,
                    border: Border.all(color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(15.5),
                  ) ,
                ),
              ),
              GestureDetector(
                onTap:(){
                  setState(() {
                    role='Teacher';
                  });

                },
                child: Container(
                  child: Text('Teacher',style: TextStyle(fontSize: 20),),
                  height: 30,
                  width: 100,
                  decoration:BoxDecoration(
                    color: role=='Teacher'?Color.fromARGB(255, 4, 60, 106):Colors.grey,
                    border: Border.all(color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(15.5),
                  ) ,
                ),
              ),
              GestureDetector(
                onTap:(){
                  setState(() {
                    role='Student';
                  });

                },
                child: Container(
                  child: Text('Student',style: TextStyle(fontSize: 20),),
                  height: 30,
                  width: 100,
                  decoration:BoxDecoration(
                    color: role=='Student'?Color.fromARGB(255, 4, 60, 106):Colors.grey,
                    border: Border.all(color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(15.5),
                  ) ,
                ),
              )
             ],
            ),
            SizedBox(height: 10,),
            CustomTextForm('Email', 'Email',null,false,emailcont,
            Icon(Icons.email)),
    
            SizedBox(height: 10,),
            Text(response==null?'':response!,
            style: TextStyle(fontSize:30 ),),
            SizedBox(height: 10,),
            CustomTextForm('Password', 'Password',null,false,passwordcont,
            Icon(Icons.email)),
            SizedBox(height: 10,),
            CustomButton('Sign up Query',()async{
              User u=User();
              u.role=role;
              u.email=emailcont.text;
              u.password=passwordcont.text;
             response=await u.signupQuery();
             if(response==null)
             response='Error..';
             else if(response=="\"\Exsist\"")
             response='Already exsist';
             else{
              response='Account created';
             }
             setState(() {
               
             });

            }),
            CustomButton('Sign up Object',()async{
              User u=User();
              u.role=role;
              u.email=emailcont.text;
              u.password=passwordcont.text;
             response=await u.signupObject();
             if(response==null)
             response='Error..';
             else if(response=="\"\Exsist\"")
             response='Already exsist';
             else{
              response='Account created';
             }
             setState(() {
               
             });

            }),
            CustomButton('Sign up Multipart',()async{
              User u=User();
              u.role=role;
              u.email=emailcont.text;
              u.password=passwordcont.text;
             response=await u.signupMutliPart();
             if(response==null)
             response='Error..';
             else if(response=="\"\Exsist\"")
             response='Already exsist';
             else{
              response='Account created';
             }
             setState(() {
               
             });

            }),

          ],

        ),
      ),

    );
    
  }
}