import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RadioExample extends StatefulWidget {
  const RadioExample({Key? key}) : super(key: key);

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  String gval='none',msg='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Radio Example'),),
      body:Column(
        children: [
          Text('National game of Pakistan is hockey?',
                  style: TextStyle(fontSize: 30.5),),
          SizedBox(height: 10,),
          RadioListTile(
               title: Text('True',
                           style: TextStyle(fontSize: 20.5),),
               value: 'True', 
               groupValue: gval, 
               onChanged: (v){
                setState(() {
                  gval=v.toString();
                });

               }),
               RadioListTile(
               title: Text('False',
                           style: TextStyle(fontSize: 20.5),),
               value: 'False', 
               groupValue: gval, 
               onChanged: (v){
                setState(() {
                  gval=v.toString();
                });

               }),
               ElevatedButton(
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20.5))),
                onPressed: (){
                  setState(() {
                    if(gval=='True'){
                       msg='Correct';
                    }
                    else if(gval=='False'){
                      msg='Incorrect';
                    }
                    else{
                      msg='Select answer';
                    }
                    
                  });
                  

               }, child: Text('Submit')),
               Text(msg,style: TextStyle(fontSize: 30.5),)
        ],
      ) ,
    );
    
  }
}