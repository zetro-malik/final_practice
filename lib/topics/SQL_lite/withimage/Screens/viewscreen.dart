import 'dart:convert';


import 'package:final_practice/topics/SQL_lite/withimage/Model/DB%20Helper/databasehelper.dart';
import 'package:final_practice/topics/SQL_lite/withimage/Model/Model/doctormodel.dart';
import 'package:flutter/material.dart';




class ViewDoctorPage extends StatefulWidget {
  const ViewDoctorPage({Key? key}) : super(key: key);

  @override
  State<ViewDoctorPage> createState() => _ViewDoctorPageState();
}

class _ViewDoctorPageState extends State<ViewDoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('View '),),
      body: FutureBuilder(
        future: DatabaseHelper.instance.getAllDoctors(),
        builder:(BuildContext cont,AsyncSnapshot<List<Doctor>> snapshot){
          if(snapshot.hasData){
            List<Doctor> doctor_list=snapshot.data!;
            if(doctor_list.length==0){
              return Center(
                child: Text('No Record Exsist',style: TextStyle(fontSize: 30),),

              );
               }
            else{
              return ListView.builder(
                itemCount: doctor_list.length,
                itemBuilder: (cont,index){
                  Doctor doctor=doctor_list[index];
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child:Image.memory(
                            
                            base64Decode(doctor.picture),
                            fit: BoxFit.fill,) ,
                        ),
                        Column(
                          children: [
                            Text(doctor.name,style: TextStyle(fontSize: 30),),
                            Text(doctor.exp.toString(),style: TextStyle(fontSize: 30),)
                          ],
                        )
                      ],
                    ),

                  );

                });

            }

          }
          else{
            return Center(
              child: CircularProgressIndicator(),

            );
          }
        } ,

      ),
    );
    
  }
}