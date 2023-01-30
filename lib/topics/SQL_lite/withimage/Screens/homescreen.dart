
import 'package:final_practice/topics/SQL_lite/withimage/Screens/insertionscreen.dart';
import 'package:final_practice/topics/SQL_lite/withimage/Screens/viewscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomScreen extends StatelessWidget {
  const HomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Home'),),
    body: Column(
      children: [
        ElevatedButton(onPressed:(){
          Navigator.push(context,MaterialPageRoute(builder: (context){
            return DoctorInsertionPage();
          }));

        }, child: Text('Insert ',style: TextStyle(fontSize: 30),)),
        SizedBox(height: 10,),
         ElevatedButton(onPressed:(){
           Navigator.push(context,MaterialPageRoute(builder: (context){
            return ViewDoctorPage();
          }));

        }, child: Text('View',style: TextStyle(fontSize: 30),))
      ],
    ),
    
    
    
    );
    
  }
}