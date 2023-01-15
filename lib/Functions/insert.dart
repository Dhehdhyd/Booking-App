import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class Insert{
final String apiKey='5437535434789096';
  //------------------------------------------------------ارسال بيانات العميل------------------------------------------//

  SendDataclient (name,password,phone_no,iD_number,birthyear,image) async{
  try{
    http.Response response=await http.post(Uri.parse('https://newsapi.org/h/jjj=jjj?hg&apiKey=$apiKey'),
    //حقول json البرتقالي الابيض قيم الحقول الموجوده في تطبيق
  body:{"name":name.text,"password":password.text,"phone_no":phone_no.text,"iD_number":iD_number.text,"iD_number":iD_number.text,"birthyear":birthyear.toString(),"image":image},
  );
  //اطبع الرد في نافذة الرد
   return response;

    }
    
      catch(Exc){
    print(Exc);
  }
  }//--------------------------------------------------------ارسال بيانات مسافر----------------------------------------//
    // من المحتمل عدم استخدام هذا الدالة
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
  //-------------------------------------------------------- تعديل بيانات العميل حسب رقم العميل----------------------------------//
  ModiflyDataclient (name,password,phone_no,iD_number,birthyear,image,id) async{
  try{
    http.Response response=await http.put(Uri.parse('https://newsapi.org/h/jjj=jjj?hg&apiKey/$id'),
    //حقول json البرتقالي الابيض قيم الحقول الموجوده في تطبيق
  body:{"name":name.text,"password":password.text,"phone_no":phone_no.text,"iD_number":iD_number.text,"iD_number":iD_number.text,"birthyear":birthyear.toString(),"image":image.toString()},
  );
   return response;

    }
    
      catch(Exc){
    print(Exc);
  }

  }
   //--------------------------------------------------------   ارسال بيانات الحجز  للمساعدة في عملية تاكيدالحجز----------------------------------//
   SendBooking_data(shprname,shprimage,shprphon_no,tthis_trip_id,trip_date,dateday,typepay) async{
  try{
    http.Response response=await http.post(Uri.parse('https://newsapi.org/h/jjj=jjj?hg&apiKey=$apiKey'),
    //حقول json البرتقالي الابيض قيم الحقول الموجوده في تطبيق
  body:{"shprname":shprname,"shprimage":shprimage,"tthis_trip_id":tthis_trip_id,"trip_date":trip_date,
  "shprphon_no":shprphon_no,"dateday":dateday,"typepay":typepay},
  );
   return response;

    }
    
      catch(Exc){
    print(Exc);
  }
  }
   
}