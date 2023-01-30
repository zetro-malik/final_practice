import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatelessWidget {
  String text;
  dynamic method;
  CustomButton(this.text,this.method);

  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: method, 
      child: Text(text,style: TextStyle(fontSize: 25),)
      );
    
  }
}




