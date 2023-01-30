import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListViewBuilderExample extends StatefulWidget {
  const ListViewBuilderExample({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderExample> createState() => _ListViewBuilderExampleState();
}

class _ListViewBuilderExampleState extends State<ListViewBuilderExample> {
  Widget buildItem(contxt,index){
          return Container(
            height: 100,
            width: 100,
            color: index%2==0?Colors.red:Colors.amber,
            child: Text(index.toString(),style: TextStyle(fontSize: 40),),
          );
        } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List View Builder')),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder:buildItem),

    );
    
  }
}