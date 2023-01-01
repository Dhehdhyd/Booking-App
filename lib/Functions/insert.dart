import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class Insert{
final String apiKey='5437535434789096';
  //------------------------------------------------------ارسال بيانات العميل------------------------------------------//

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
  }//--------------------------------------------------------ارسال بيانات مسافر----------------------------------------//
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
  //--------------------------------------------------------تعديل بيانات العميل----------------------------------//
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
   //--------------------------------------------------------  ارسال بيانات للمساعدة في عملية جلب بيانات الحجز----------------------------------//
   SendBooking_data(client_name,office_name,trip_id) async{
  try{
    http.Response response=await http.post(Uri.parse('https://newsapi.org/h/jjj=jjj?hg&apiKey=$apiKey'),
    //حقول json البرتقالي الابيض قيم الحقول الموجوده في تطبيق
  body:{"client_name":client_name.text,"office_name":office_name,"trip_id":trip_id.toString(),},
  );
   return response;

    }
    
      catch(Exc){
    print(Exc);
  }
  }
   //--------------------------------------------------------  ارسال بيانات للمساعدة في عملية تاكيدالحجز----------------------------------//
   SendBookingdata(client_name,office_name,trip_id,typepay) async{
  try{
    http.Response response=await http.post(Uri.parse('https://newsapi.org/h/jjj=jjj?hg&apiKey=$apiKey'),
    //حقول json البرتقالي الابيض قيم الحقول الموجوده في تطبيق
  body:{"client_name":client_name.text,"office_name":office_name,"trip_id":trip_id.toString(),"typepay":typepay},
  );
   return response;

    }
    
      catch(Exc){
    print(Exc);
  }
  }
}