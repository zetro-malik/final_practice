import 'package:final_practice/topics/checkboxs/checklistTile/hobby.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CheckListViewExample extends StatefulWidget {
  const CheckListViewExample({Key? key}) : super(key: key);

  @override
  State<CheckListViewExample> createState() => _CheckListViewExampleState();
}

class _CheckListViewExampleState extends State<CheckListViewExample> {
  int total=0;
  List<Hobbies> hlist=[];
  void initState()
  { 
    Hobbies h=Hobbies(hname: 'Playing Cricket', 
                            isselected: false);
      hlist.add(h);
      h=Hobbies(hname: 'Reading Book', 
                    isselected: false);
      hlist.add(h);                      
      h=Hobbies(hname: 'Watching Movies', 
                    isselected: false);
      hlist.add(h);                      

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Check List Example')
    
    ),
    body: Column(
      children: [
        Text('Choose your Hobbies..',
              style: TextStyle(fontSize: 30.5),),
          Container(
            height: 300,
            child: ListView.builder(
              itemCount: hlist.length,
              itemBuilder:(contx,index){
                Hobbies h=hlist[index];
                return CheckboxListTile(
                  title:Text(h.hname,style: TextStyle(fontSize: 20)),
                  value: h.isselected, 
                  onChanged: (v){
                    setState(() {
                      h.isselected=v!;
                    });
                    
                  });
              }),
          ),
          ElevatedButton(onPressed: (){
            total=0;
            setState(() {
              for(int i=0;i<hlist.length;i++)
              {
                if(hlist[i].isselected)
                total++;
              }
            });

          }, child:Text('Submit')),
          Text(total.toString(),style: TextStyle(fontSize: 40),)    



      ],
    ),
    
    );
    
  }
}