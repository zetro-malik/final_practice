import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(MaterialApp(home:ClassA()));
}

class ClassA extends StatefulWidget {
  const ClassA({super.key});

  @override
  State<ClassA> createState() => _ClassAState();
}

class _ClassAState extends State<ClassA> {
  
  String? name=null; 

  late SharedPreferences _pref;
  void getSharedPref()async
  {  
    List<String> a = ['1','2','3'];
    _pref=await SharedPreferences.getInstance();
     _pref.setStringList("lst", a);
      List<String>? aa=   _pref.getStringList("lst");
    if(aa!=null)
    {
      aa.forEach((element) {
        print(element);
      })
    }
  }
   @override
  void initState() {
    getSharedPref();
    
  }

TextEditingController con = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(name==null?"nothing":name!),
          TextFormField(controller: con,),
          ElevatedButton(onPressed: (){
            _pref.setString("user", con.text);
            setState(() {
              name = _pref.getString("user");
            });
          }, child: Text("OK"))


        ],

      ),
      
    );
  }
}






class MyApp extends StatefulWidget {  
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  bool islogin=false;
  late SharedPreferences _pref;
  void getSharedPref()async
  {  
    _pref=await SharedPreferences.getInstance();
     bool? b=_pref.getBool("status");
    _pref.setString("user", "zetro");
    String? name = _pref.getString("user");
    
     if(b!=null){
      setState(() {
         islogin=b;
        
      });
     
     }
  }

  void initState()
  {
    getSharedPref();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Shared Preferences'),),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            setState(() {
             islogin=!islogin;
            _pref.setBool("status",islogin);
            print('Added ${_pref.getBool("status")}');   
             });
          },
          
          child:Text(islogin?"LOGOUT":"LOGIN",style: TextStyle(fontSize: 30),) ),
      ),

    );
    
  }
}
