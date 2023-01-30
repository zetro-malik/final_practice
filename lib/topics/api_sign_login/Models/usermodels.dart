import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../Utilities/Global/global.dart';
class User
{
  late String email,password,role;
  String? img;
  late int id;
  User();
  User.fromMap(Map<String,dynamic> map)
  {
    email=map["email"];
    password=map["password"];
    role=map["role"];
    img=map["image"];
    id=map["id"];
    

  }
  Map<String,dynamic> tomap()
  {
    return <String,dynamic>{
      'email':email,
      'password':password,
      'role':role
    };

  }

String ip='http://192.168.15.113/appapisection2/api';
String imgpath='http://192.168.15.113/appapisection2/Content/Uploads/';

  Future<String?> login() async
  {
    String url='${ip}/user/login?email=${email}&password=${password}';
    Uri uri=Uri.parse(url);
    var response=await http.get(uri);
    if(response.statusCode==200)
         return response.body;

         return null;
  }




  Future<String?> signupQuery()async{
    String url='${ip}/user/CreateNewAccount?email=${email}&password=${password}&role=${role}';
    Uri uri=Uri.parse(url);
       var reseponse =await   http.post(uri);
       if(reseponse.statusCode==200)
         return reseponse.body;

       return null;
  
  }
  Future<String?> signupObject()async{
    String url='${ip}/user/Signup';
    Uri uri=Uri.parse(url);
  //  var body=jsonEncode(<String,dynamic>{
  //   'email':email,
  //   'password':password,
  //   'role':role
  //  });

       var reseponse =await   http.post(uri,
                                        body:jsonEncode(tomap()),
                                        headers: <String,String>{
                                          'Content-Type':'application/json'
                                        }
       
                                 );
       if(reseponse.statusCode==200)
       reseponse.body;

       return null;
  
  }
  Future<String?> signupMutliPart()async{
    String url='${ip}/user/NewAccount';
      var request   = http.MultipartRequest('POST',Uri.parse(url));
      request.fields['email']=email;
      request.fields['password']=password;
      request.fields['role']=role;
        var response=await request.send();
        if(response.statusCode==200)
        return response.stream.bytesToString();
        return null;
  }
  Future<String?> uploadPic(File f)async
  {
    String url='${ip}/user/UpdateProfileImage';
    Uri uri=Uri.parse(url);
   var request= http.MultipartRequest('POST',uri);
   request.fields["id"]=id.toString();
   http.MultipartFile newfile=await http.MultipartFile.fromPath('photo',f.path);
   request.files.add(newfile);
   var response=await request.send();
   if(response.statusCode==200)
   return 'Uploaded';

   return null;

  }

}










