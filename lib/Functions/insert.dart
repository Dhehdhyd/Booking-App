import 'package:http/http.dart' as http;

class Insert{

  //------------------------------------------------------ارسال بيانات العميل------------------------------------------//
//تعديل اسماء الحقول
  SendDataclient (name,password,phone_no,iD_number,birthyear,image) async{
  try{
    http.Response response=await http.post(Uri.parse('http://34.133.61.239:8080/users'),
    //حقول json البرتقالي الابيض قيم الحقول الموجوده في تطبيق
  body:{"name":name.text,"password":password.text,"phoneno":phone_no.text,"identityno":iD_number.text,"birthdate":birthyear.toString(),"identity_image":image},
  );
  //اطبع الرد في نافذة الرد
   return response;

    }
    
      catch(Exc){
    print(Exc);
  }
  }
  //-------------------------------------------------------- تعديل بيانات العميل حسب رقم العميل----------------------------------//
  ModiflyDataclient (name,password,phone_no,iD_number,birthyear,image,id) async{
  try{
    http.Response response=await http.put(Uri.parse('http://34.133.61.239:8080/users/$id'),
    //حقول json البرتقالي الابيض قيم الحقول الموجوده في تطبيق
  body:{"name":name.text,"password":password.text,"phoneno":phone_no.text,"identityno":iD_number.text,"birthdate":birthyear.toString(),"identity_image":image},
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
    http.Response response=await http.post(Uri.parse('http://34.133.61.239:8080/booking_orders'),
    //حقول json البرتقالي الابيض قيم الحقول الموجوده في تطبيق
  body:{"trip_name":shprname,"client_identity_image":shprimage,"trip_id":tthis_trip_id,"trip_date":trip_date,
  "client_phoneno":shprphon_no,"booking_data":dateday,"payment_type":typepay},
  );
   return response;

    }
    
      catch(Exc){
    print(Exc);
  }
  }
   
}