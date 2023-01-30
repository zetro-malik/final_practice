import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: BulbOnOffScreen(),));
}

class BulbOnOffScreen extends StatefulWidget {
 

  @override
  State<BulbOnOffScreen> createState() => _BulbOnOffScreenState();
}

class _BulbOnOffScreenState extends State<BulbOnOffScreen> {
  bool isOn=false;
  void changeState()
  {
    setState(() {
         isOn=!isOn;
    });
 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bulb On OFF ")),
      body: Center(
        child: Column(children: [
          Image.asset(isOn?"assets/images/b1.png":"assets/images/b2.png",height: 100,width: 100,),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed:changeState, child: Text(isOn?"OFF":"ON"))
        ]),
    
      ),
    );
    
  }
}