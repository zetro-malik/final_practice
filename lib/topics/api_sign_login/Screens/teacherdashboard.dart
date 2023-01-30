import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TeacherHomePage extends StatelessWidget {
  String email;
TeacherHomePage(this.email);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Teacher Home Page'),),
      body: Center(
        child: Text(email,style: TextStyle(fontSize: 30),),
      ),

    );
    
  }
}