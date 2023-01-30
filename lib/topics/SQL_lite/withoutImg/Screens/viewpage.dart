import 'package:final_practice/topics/SQL_lite/withoutImg/DBHelper/dbhandler.dart';
import 'package:final_practice/topics/SQL_lite/withoutImg/Model/studentmodel.dart';
import 'package:final_practice/topics/SQL_lite/withoutImg/Screens/editscreen.dart';
import 'package:final_practice/topics/SQL_lite/withoutImg/mywidgets/mywidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  List<Student> slist=[];
  void getData()async{
    slist=await DatabaseHandler.instance.getData();
    setState(() {
      
    });
  }
  void initState(){
    getData();
  }


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(title: Text('View Screen')),
      body:ListView.builder(
        itemCount: slist.length,
        itemBuilder: (context,index){
          Student sobj=slist[index];
          return ListTile(
            leading: IconButton(onPressed: (){
              showDialog(
                barrierDismissible: false,
                context: context, 
              builder:(context){

                return AlertDialog(
                  title: getTextWidget(data: 'Are you sure to delete?'),
                  actions: [
                    TextButton(onPressed: (){ }, 
                    child: getTextWidget(data: "YES")),
                    
                    TextButton(onPressed:(){}, 
                    child: getTextWidget(data: "NO"))
                  ],
                );
              }
              
              );

            },icon: Icon(Icons.delete),),


            title: getTextWidget(data: sobj.name),
            subtitle: getTextWidget(data: sobj.contact),


            trailing: IconButton(onPressed: ()async{
             await Navigator.push(context, 
              MaterialPageRoute(builder: (context){
                return EditScreen(sobj);
              }));
              setState(() {
                
              });

            },icon: Icon(Icons.edit),),



          

          );

        })
    );
    
  }
}