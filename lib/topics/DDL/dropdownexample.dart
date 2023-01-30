import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DropDownExample extends StatefulWidget {
  const DropDownExample({Key? key}) : super(key: key);

  @override
  State<DropDownExample> createState() => _DropDownExampleState();
}

class _DropDownExampleState extends State<DropDownExample> {
  String ? selectedvalue;
  List<String> countries=["PAK","INDIA","CHINA","IRAN"];
  List<DropdownMenuItem<String>> getMenuItems()
  {
    List<DropdownMenuItem<String>> menulist=[];
    countries.forEach((element) {
      DropdownMenuItem<String> item =DropdownMenuItem<String>(
        child: Text(element,style: TextStyle(fontSize: 20),),
        value: element,

      );
      menulist.add(item);
    });
    return menulist;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drop Down Example')),
      body: Column(
        children: [
          DropdownButton(
            isExpanded: true,
          value: selectedvalue,
            items: getMenuItems(),
          onChanged: (value){
            setState(() {
            selectedvalue=value.toString();
            // selectedvalue="America";
        
            
            });

          }),
          Text(selectedvalue==null?"":selectedvalue!,
               style:TextStyle(fontSize: 20),)

        ],
      ),

    );
    
  }
}