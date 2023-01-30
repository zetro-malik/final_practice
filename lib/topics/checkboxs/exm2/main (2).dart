import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(home: MyApp()));
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
int total_hobbies=0;
bool checked_cricket=false,checked_reading=false,checked_movies=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Check Box Example ")),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Text("Select Your Hobbies ",style: TextStyle(fontSize: 40.0),),
            SizedBox(height: 20,),



            Row(children: [
              Checkbox(value: checked_cricket, onChanged:(bool? v){
                setState(() {
                  if(v!=null){
                  checked_cricket=v;
                  if(checked_cricket)
                  total_hobbies++;
                  else
                  total_hobbies--;
                  }
                });

              }),
              SizedBox(width: 10,),
              GestureDetector(onTap: (){
                setState(() {
                  
                  checked_cricket=!checked_cricket;
                  if(checked_cricket)
                  total_hobbies++;
                  else
                  total_hobbies--;
                });

              },child: Text("Playing Cricket",style: TextStyle(fontSize: 20.0),),)
              
            ],),




            
            SizedBox(height: 20,),
            Row(children: [
              Checkbox(value: checked_reading, onChanged:(bool? v){
                setState(() {
                  if(v!=null){
                  checked_reading=v;
                  if(checked_reading)
                  total_hobbies++;
                  else
                  total_hobbies--;
                  }
                });

              }),
              SizedBox(width: 10,),
              Text("Reading Books",style: TextStyle(fontSize: 20.0),)
            ],),
            SizedBox(height: 20,),
            Row(children: [
              Checkbox(value: checked_movies, onChanged:(bool? v){
                setState(() {
                  if(v!=null){
                  checked_movies=v;
                  if(checked_movies)
                  total_hobbies++;
                  else
                  total_hobbies--;
                  }
                });

              }),
              SizedBox(width: 10,),
              Text("Watching Movies",style: TextStyle(fontSize: 20.0),)
            ],),
            SizedBox(height: 10,),
            Text("Total Hobbies $total_hobbies",style: TextStyle(fontSize: 20.0),),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ButtonStyle(textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))),
              onPressed: (){
                setState(() {
                  total_hobbies=0;
                  if(checked_cricket)
                  total_hobbies++;
                  if(checked_movies)
                  total_hobbies++;
                  if(checked_reading)
                  total_hobbies++;
                });

            }, child: Text("Show "))
            
          ],
        ),
      ),
    );
    
  }
}
class ListViewExample extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return Scaffold(appBar: AppBar(title: Text("List View Example")),
   body:Container(height: 200,
  //  child: ListView(
  //   scrollDirection: Axis.horizontal,
  //   children: [
  //   Text("Line 1",style:TextStyle(fontSize: 20),),
  //   Text("Line 1",style:TextStyle(fontSize: 20),),
  //   Text("Line 1",style:TextStyle(fontSize: 20),),
  //   Text("Line 1",style:TextStyle(fontSize: 20),),
  //   Text("Line 1",style:TextStyle(fontSize: 20),),
  //   Text("Line 1",style:TextStyle(fontSize: 20),),
  //   Text("Line 1",style:TextStyle(fontSize: 20),),
  //   Text("Line 1",style:TextStyle(fontSize: 20),),
  //   Text("Line 1",style:TextStyle(fontSize: 20),),
  //   Text("Line 1",style:TextStyle(fontSize: 20),),
  //   Text("Line 1",style:TextStyle(fontSize: 20),),
  //   Text("Line 1",style:TextStyle(fontSize: 20),),
  //   Text("Line 1",style:TextStyle(fontSize: 20),),
  //   Text("Line 1",style:TextStyle(fontSize: 20),),

  //  ],),
  child:ListView.builder(
    itemCount: 20,
    itemBuilder: ((context, index) {
      return Text("Line $index",style: TextStyle(fontSize: 20),);
    }),
  )
   
   ),
   );
  }

}