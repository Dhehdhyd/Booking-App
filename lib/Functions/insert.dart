import 'package:http/http.dart' as http;
import 'dart:convert';

import '../screens/create_an_account_page.dart';
import '../screens/create_an_account_traveler.dart';
import '../screens/modifly_my_account_data.dart';

class Insert{

  //------------------------------------------------------ارسال بيانات العميل------------------------------------------//
 Future SendDataclient (name,password,phone_no,iD_number,birthyear,image) async{
    String cname=name;
  String phoneno=phone_no;
  String identityno=iD_number;
  String cidentity_image=image.toString();
  String client_identity_image="data:"+"$cnameimage"+"/"+"$ctypeimage"+";base64,"+"$cidentity_image";
   int birthdate=birthyear;
  String cpassword=password;
 
  try{
var headers = {
  'Content-Type': 'application/json'
};
   var request = http.Request('POST', Uri.parse('http://34.133.61.239:8080/users'));
request.body = json.encode({
  "name": cname,
  "phoneno": phoneno,
  "identityno": identityno,
  "identity_image": client_identity_image,
  "birthdate": birthdate,
  "password": cpassword
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

 return response.statusCode;


    }
    
      catch(Exc){
    print(Exc);
  }
  }
  //-------------------------------------------------------- تعديل بيانات العميل حسب رقم العميل----------------------------------//
 Future ModiflyDataclient (name,password,phone_no,iD_number,birthyear,image,id) async{
  String mcname=name;
  String mphoneno=phone_no;
  String midentityno=iD_number;
  String mcidentity_image=image.toString();
  String mclient_identity_image="data:"+"$mcnameimage"+"/"+"$mctypeimage"+";base64,"+"$mcidentity_image";
   int mbirthdate=birthyear;
  String mcpassword=password;
  int mcid=id;
  try{

   var headers = {
  'Content-Type': 'application/json'
};
var request = http.Request('PUT', Uri.parse('http://34.133.61.239:8080/users/$mcid'));
request.body = json.encode({
  "name": mcname,
  "phoneno": mphoneno,
  "identityno": midentityno,
  "identity_image": mclient_identity_image,
  "birthdate": mbirthdate,
  "password": mcpassword
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 201) {
 return response.statusCode;
}
    }
    
      catch(Exc){
    print(Exc);
  }
  }  
   //--------------------------------------------------------   ارسال بيانات الحجز  للمساعدة في عملية تاكيدالحجز----------------------------------//
  Future  SendBooking_data(shprname,shprimage,shprphon_no,tthis_trip_id,ttrip_date,dateday,typepay) async{
    
  int trip_id=tthis_trip_id;
  String client_name=shprname;
  String client_phoneno=shprphon_no;
  String image=shprimage.toString();
  String client_identity_image="data:"+"$nameimage"+"/"+"$typeimage"+";base64,"+"$image";
   String trip_date=ttrip_date;
  String booking_date=dateday;
    String payment_type=typepay;
  try{
   var headers = {
  'Content-Type': 'application/json'
};
var request = http.Request('POST', Uri.parse('http://34.133.61.239:8080/bookingorders'));
request.body = json.encode({
 "trip_id": trip_id,
  "client_name": client_name,
  "client_phoneno": client_phoneno,
  "client_identity_image": client_identity_image,
  "trip_date": trip_date,
  "booking_date": booking_date,//من وديان ارجع احذفة
  "payment_type":payment_type
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 201) {
 return response.statusCode;
}

  
  }
      catch(Exc){
    print(Exc);
  }
  }
   
}