import 'package:flutter/material.dart';


class RadioButtonExample extends StatefulWidget {
  const RadioButtonExample({Key? key}) : super(key: key);

  @override
  State<RadioButtonExample> createState() => _RadioButtonExampleState();
}

class _RadioButtonExampleState extends State<RadioButtonExample> {
  String gval="none";
  String message="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Radio Example')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('National game of Pakistan is Hockey?'),
        RadioListTile(
          title: Text("True",style: TextStyle(fontSize: 25),),
          value: "True", 
          groupValue: gval, 
          onChanged: (val){
            setState(() {
                gval="True";
            });
          
          }),
          RadioListTile(
          title: Text("False",style: TextStyle(fontSize: 25),),
          value: "False", 
          groupValue: gval, 
          onChanged: (val){
            setState(() {
                gval="False";
            });
          
          }),
          ElevatedButton(onPressed: (){
            setState(() {
              if(gval=="True")
                message="Correct";
              else if(gval=="False")
                message="Wrong";
              else
              message="Select Answer"; 
                 
                
            });


          }, child: Text('Submit')),
          Text(message)
      ],
      ),

    );
    
  }
}