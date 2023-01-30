import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget
{
   TextEditingController number1=TextEditingController();
   TextEditingController number2=TextEditingController();
   TextEditingController result=TextEditingController();
    void add()
    {
      int n1=int.parse(number1.text);
      int n2=int.parse(number2.text);
      int res=n1+n2;
      result.text=res.toString();

   } 
  @override
  Widget build(BuildContext context) {
  return Container(color: Colors.grey,
           padding: EdgeInsets.all(20.0),
            child: Column(
              
              children: [
                TextFormField(controller: number1,
                style: TextStyle(fontSize: 50),
                decoration: InputDecoration(
                  hintText: "Value 1",
                 labelText: "Value 1",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                  )


                ),
                
                ),
                SizedBox(height: 20,),
                  TextFormField(controller: number2,),
                SizedBox(height: 20,),
                  TextFormField(controller: result,),
                SizedBox(height: 20,),
                Row(
                  children: [
                    ElevatedButton(onPressed: add, child: Text("ADD")),
                    SizedBox(width: 20,),
                    ElevatedButton(
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30)),
                         backgroundColor: MaterialStateProperty.all(Colors.white),
                         foregroundColor: MaterialStateProperty.all(Colors.black),
                         elevation: MaterialStateProperty.all(30.0)
                      ),
                      onPressed:(){
                      int n1=int.parse(number1.text);
                      int n2=int.parse(number2.text);
                      int res=n1-n2;
                     result.text=res.toString();
                    }, child: Text("Subtract"))

                  ],
                )

              ],
            ),
  
  );
  }

}