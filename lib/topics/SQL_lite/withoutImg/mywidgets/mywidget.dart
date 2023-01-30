import 'package:flutter/material.dart';
double fontSize=20;
Text getTextWidget({required String data})
{
  return Text(data,style: TextStyle(fontSize: fontSize),);
}
TextFormField getTextForm(String hinttext,
TextEditingController txtcontroller){
  return TextFormField(
    decoration: InputDecoration(
      hintText: hinttext,
      hintStyle: TextStyle(fontSize: fontSize)
    ),
    controller: txtcontroller,
  );
}

ElevatedButton getButton(String text,function){
  return ElevatedButton(
    child: getTextWidget(data:text),
    onPressed: function,
  );
}