import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() {
  runApp( MaterialApp(home: CBExample()));
}

class CBExample extends StatefulWidget {
  const CBExample({Key? key}) : super(key: key);

  @override
  State<CBExample> createState() => _CBExampleState();
}



class _CBExampleState extends State<CBExample> {


  @override
  void initState() {
   

  }

  bool val=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Check Box")),
      body: Column(
        children: [
          CheckboxListTile(
            title: Text("PF"),
            subtitle: Text("biit"),
            activeColor: Colors.red,
            checkColor: Colors.blue,

            value: val,
            onChanged: (bool? v){
              setState(() {
                val=v!;
                
              });
            
    
          }),
          Card(
            shape: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
            elevation: 10.0,
            shadowColor: Colors.blueAccent,
            color: Colors.green,
            child: CheckboxListTile(
              title: Text("OOP"),
              subtitle: Text("biit"),
              activeColor: Colors.red,
              checkColor: Colors.blue,
              
              value: val, onChanged: (bool? v){
                setState(() {
                  val=v!;
                  
                });
             
              
            }),
          ),
           Divider(indent: 4,thickness: 4.0,color: Colors.blue,),
          CheckboxListTile(
            title: Text("DSA"),
            subtitle: Text("biit"),
            activeColor: Colors.red,
            checkColor: Colors.blue,
            
            value: val, onChanged: (bool? v){
              setState(() {
                val=v!;
                
              });
            
    
          })
        ],
        
      ),
    );
    
  }
}