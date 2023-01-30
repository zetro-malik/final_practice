import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextForm extends StatefulWidget {
  String hinttext;
  String labeltext;
  bool obsecuretext;
  String? obsecurechar;
  TextEditingController controller;
  Icon icon;
  CustomTextForm(this.hinttext,this.labeltext,
        this.obsecurechar,this.obsecuretext,this.controller,
        this.icon
        );

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}





class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 30),
      controller:widget.controller,
      obscureText: widget.obsecuretext,
      obscuringCharacter: widget.obsecurechar!=null?widget.obsecurechar!:"*",
      decoration: InputDecoration(
        
      border: OutlineInputBorder(),
      
        hintText: widget.hinttext,
        labelText: widget.labeltext,
        prefixIcon: widget.icon
      ),


    );
    
  }
}