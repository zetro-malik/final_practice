
import 'package:flutter/material.dart';
class CheckListTileExample extends StatefulWidget {
  const CheckListTileExample({Key? key}) : super(key: key);

  @override
  State<CheckListTileExample> createState() => _CheckListTileExampleState();
}


class _CheckListTileExampleState extends State<CheckListTileExample> {
  bool crick=false,read=false,watch=false;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Check List Tile"),),
      body: Column(
        children: [
          Text('Selct your hobbies',style: TextStyle(fontSize: 30.5),),
          SizedBox(height: 10.5,),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text("Playing Cricket",style: TextStyle(fontSize: 20.5),),
            value: crick, 
          onChanged: (bool? v){
            setState(() {
              crick=v!;
            });
          }),
          CheckboxListTile(
            title: Text("Reading",style: TextStyle(fontSize: 20.5),),
            value: read, 
          onChanged: (bool? v){
            setState(() {
              read=v!;
            });
          }),
          CheckboxListTile(
            title: Text("WAtching Movies",style: TextStyle(fontSize: 20.5),),
            value: watch, 
          onChanged: (bool? v){
            setState(() {
              watch=v!;
            });
          }),

        
        ],
      ),

    );

  }
}