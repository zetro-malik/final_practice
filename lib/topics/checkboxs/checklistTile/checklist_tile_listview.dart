
import 'package:final_practice/topics/checkboxs/checklistTile/hobby.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CheckListTileListView extends StatefulWidget {
  const CheckListTileListView({Key? key}) : super(key: key);

  @override
  State<CheckListTileListView> createState() => _CheckListTileListViewState();
}

class _CheckListTileListViewState extends State<CheckListTileListView> {
  List<Hobbies> hlist=[];
  int total=0;
  void initState()
  {
    Hobbies h=Hobbies(hname: "Playing Cricket", isselected:false);
    hlist.add(h);
    h=Hobbies(hname: "Reading books", isselected: false);
    hlist.add(h);
    h=Hobbies(hname: "Watchin Movies", isselected: false);
    hlist.add(h);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Check List View")),
      body: Column(
        children: [
          Text('Select Hobbies',style: TextStyle(fontSize: 30),),
          Container(
            height:300,
            child: ListView.builder(
              itemCount: hlist.length,
              itemBuilder:(cont,index){
                Hobbies h=hlist[index];
                return CheckboxListTile(
                  title:Text(h.hname,style: TextStyle(fontSize: 20),) ,
                  value: h.isselected, onChanged: (bool? v){
                    setState(() {
                      h.isselected=v!;
                    });
                    
                  }
                  );

              } ,

            ),
            ),
            SizedBox(height: 10,),
            Text('Total items checked = $total'),
            ElevatedButton(onPressed: (){
              setState(() {
                total=0;
              //  var v= hlist.where((element) => element.isselected);
              //   v.length;
                for(int i=0;i<hlist.length;i++)
                {
                  if(hlist[i].isselected)
                  total++;
                }
              });

            }, child: Text('Submit',style: TextStyle(fontSize: 20.0),))
        ],
      ),

    );
    
  }
}