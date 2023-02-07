import 'package:http/http.dart' as http;
import 'dart:convert';

import '../screens/create_an_account_page.dart';
import '../screens/create_an_account_traveler.dart';
import '../screens/modifly_my_account_data.dart';

class Insert{

  //------------------------------------------------------ارسال بيانات العميل------------------------------------------//
 Future SendDataclient (name,password,phone_no,iD_number,birthyear,image) async{
    String mcname=name;
  String mphoneno=phone_no;
  String midentityno=iD_number;
  String mcidentity_image=image.toString();
  String mclient_identity_image="data:"+"$cnameimage"+"/"+"$ctypeimage"+";base64,"+"$mcidentity_image";
  String mbirthdate=birthyear;
  String mcpassword=password;
 
  try{
   var headers = {
  'Content-Type': 'application/json'
};
var request = http.Request('POST', Uri.parse('http://34.133.61.239:8080/users'));
request.body = json.encode({
  "name": mcname,
  "phoneno": mphoneno,
  "identityno": midentityno,
  "identity_image":"data:image/png;base64,"+"$mcidentity_image",
  "birthdate": mbirthdate,
  "password": mcpassword
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
   String mbirthdate=birthyear;
  String mcpassword=password;
  String mcid=id;
  try{

   var headers = {
  'Content-Type': 'application/json'
};
var request = http.Request('PUT', Uri.parse('http://34.133.61.239:8080/users/$mcid'));
request.body = json.encode({
  "name": mcname,
  "phoneno": mphoneno,
  "identityno": midentityno,
  "identity_image":"data:image/png;base64,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",
  "birthdate": mbirthdate,
  "password": mcpassword
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();


 return response.statusCode;

    }
    
      catch(Exc){
    print(Exc);
  }
  }  
   //--------------------------------------------------------   ارسال بيانات الحجز  للمساعدة في عملية تاكيدالحجز----------------------------------//
  Future  SendBooking_data(shprname,shprimage,shprphon_no,tthis_trip_id,ttrip_date,typepay) async{
    
  int trip_id=tthis_trip_id;
  String client_name=shprname;
  String client_phoneno=shprphon_no;
  String image=shprimage.toString();
  String client_identity_image="data:"+"$nameimage"+"/"+"$typeimage"+";base64,"+"$image";
   String trip_date=ttrip_date;
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