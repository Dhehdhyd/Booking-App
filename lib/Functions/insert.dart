import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class Insert{
final String apiKey='5437535434789096';

  SendDataclient (name,password,passwoord1,phone_no,iD_number,birthyear,image) async{
  try{
    http.Response response=await http.post(Uri.parse('https://newsapi.org/h/jjj=jjj?hg&apiKey=$apiKey'),
    //حقول json البرتقالي الابيض قيم الحقول الموجوده في تطبيق
  body:{"name":name.text,"password":password.text,"passwoord1":passwoord1.text,"phone_no":phone_no.text,"iD_number":iD_number.text,"iD_number":iD_number.text,"birthyear":birthyear.toString(),"image":image.toString()},
  );
   return response;

    }
    
      catch(Exc){
    print(Exc);
  }
  }//------------------------------------------------------------------------------------------------//
    SendDatatraveler (name,phone_no,iD_number,birthyear,image) async{
  try{
    http.Response response=await http.post(Uri.parse('https://newsapi.org/h/jjj=jjj?hg&apiKey=$apiKey'),
    //حقول json البرتقالي الابيض قيم الحقول الموجوده في تطبيق
  body:{"name":name.text,"phone_no":phone_no.text,"iD_number":iD_number.text,"iD_number":iD_number.text,"birthyear":birthyear.toString(),"image":image.toString()},
  );
   return response;

    }
    
      catch(Exc){
    print(Exc);
  }
  }
  //------------------------------------------------------------------------------------------//
  ModiflyDataclient (name,password,phone_no,iD_number,birthyear,image) async{
  try{
    http.Response response=await http.post(Uri.parse('https://newsapi.org/h/jjj=jjj?hg&apiKey=$apiKey'),
    //حقول json البرتقالي الابيض قيم الحقول الموجوده في تطبيق
  body:{"name":name.text,"password":password.text,"phone_no":phone_no.text,"iD_number":iD_number.text,"iD_number":iD_number.text,"birthyear":birthyear.toString(),"image":image.toString()},
  );
   return response;

    }
    
      catch(Exc){
    print(Exc);
  }
  }
}