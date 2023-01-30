import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(home: TextColorChangeExample(),));
}
class TextColorChangeExample extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _TextColorChangeExampleState();
  }
}
class _TextColorChangeExampleState extends State<TextColorChangeExample>
{
  String lblvalue="No Color";
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title:  Text("Text Color Change"),),
      body: Column(
        children: [
          Text(lblvalue,style: TextStyle(fontSize: 40,
          color: lblvalue=="RED"?Colors.red:lblvalue=="GREEN"?Colors.green:Colors.black ),),
          SizedBox(height: 40,),


          ElevatedButton(onPressed: (){
            setState(() {
              lblvalue="RED";
              
            });

          }, child: Text("RED"),


          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
          ),
          ),
          SizedBox(height: 40,),
          
          ElevatedButton(onPressed: (){
            setState(() {
              lblvalue="GREEN";
              
            });

          }, child: Text("GREEN"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
          ),
          )
        ],
      ),
    );
  }

}







