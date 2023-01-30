import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListViewExample extends StatefulWidget {
  const ListViewExample({Key? key}) : super(key: key);

  @override
  State<ListViewExample> createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List View')),
      body: Container(
        height: 300,
        child: ListView(
          //scrollDirection: Axis.horizontal,
          children: [
            Text('A',style: TextStyle(fontSize: 40),),
            SizedBox(height: 10,),
             Text('B',style: TextStyle(fontSize: 40),),
            SizedBox(height: 10,),
             Text('B',style: TextStyle(fontSize: 40),),
            SizedBox(height: 10,),
             Text('C',style: TextStyle(fontSize: 40),),
            SizedBox(height: 10,),
             Text('D',style: TextStyle(fontSize: 40),),
            SizedBox(height: 10,),
            Text('A',style: TextStyle(fontSize: 40),),
            SizedBox(height: 10,),
             Text('B',style: TextStyle(fontSize: 40),),
            SizedBox(height: 10,),
             Text('B',style: TextStyle(fontSize: 40),),
            SizedBox(height: 10,),
             Text('C',style: TextStyle(fontSize: 40),),
            SizedBox(height: 10,),
             Text('D',style: TextStyle(fontSize: 40),),
            SizedBox(height: 10,)


          ],
        ),
        
      ),
    );
    
  }
}