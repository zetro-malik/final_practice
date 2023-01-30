import 'package:final_practice/topics/SQL_lite/withoutImg/Screens/insertscreen.dart';
import 'package:final_practice/topics/SQL_lite/withoutImg/Screens/viewpage.dart';
import 'package:final_practice/topics/SQL_lite/withoutImg/mywidgets/mywidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


class HomeScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen'),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){

Navigator.push(context, MaterialPageRoute(builder: (context){
  return InsertPage();

}));
            }, child: getTextWidget(data: 'Insert Page')),
            SizedBox(height:10 ,),
           ElevatedButton(onPressed: (){
             Navigator.push(context,
                  MaterialPageRoute(builder:(context){
                 return ViewPage();
             }));

           }, child: getTextWidget(data: 'Get Page'))
          ],
        ),
      ),
    );
    
  }
}