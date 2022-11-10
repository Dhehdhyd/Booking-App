import '../Models/clients_model.dart';
import '../Models/data_booking.dart';
import '../Models/data_confirmation.dart';
import '../Models/trip_model.dart';
import '../Models/trips_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import '../class_tools/counter_date_main.dart';
import '../main.dart';
Clients client=Clients();
Booking booking=Booking();
Data_confirmation data_confirmation=Data_confirmation();
class Fetch
{

  //دالة جلب الرحلات من السرفر
final String apiKey='5437535434789096';

 fetchTrips() async{
  try{
    http.Response response=await http.get(Uri.parse('https://newsapi.org/h/jjj=jjj?hg&apiKey=$apiKey'));
    if(response.statusCode==200)
    {
      var jsonData=json.decode(response.body);
  
      Trips trips=Trips.fromJson(jsonData);
      List <Trip>tripslist=trips.trips.map((e)=>Trip.fromJson(e)).toList();
      
      return  tripslist;
    }
else
{
  //لو اريد الطبع رسالة الخط ابحث عن اداة حاليا هذا لي فقط
  print('اطبع لوحصل مشكلة= ${response.statusCode}');
}
  }
  catch(Exc){
    print(Exc);
  }
  

}
//--------------------------------------------دالة جلب بيانات العميل من اجل التعديل-------------------------------//
fetchclient() async{
  try{
    http.Response response=await http.get(Uri.parse('https://newsapi.org/h/jjj=jjj?hg&apiKey=$apiKey'));
    if(response.statusCode==200)
    {
      var jsonData=json.decode(response.body);
  
  client=Clients.fromJson(jsonData);
      
      
      
    }

  }
  catch(Exc){
    print(Exc);
  }
  

}
//--------------------------------------------------------------------------------------//

//--------------------------------------------دالة جلب بيانات الحجز-------------------------------//
fetchbooking() async{
  try{
    http.Response response=await http.get(Uri.parse('https://newsapi.org/h/jjj=jjj?hg&apiKey=$apiKey'));
    if(response.statusCode==200)
    {
      var jsonData=json.decode(response.body);
  
  booking=Booking.fromJson(jsonData);
      
      
      
    }

  }
  catch(Exc){
    print(Exc);
  }
  

}
//--------------------------------------------------------------------------------------//

//--------------------------------------------دالة جلب بيانات التأكيد-------------------------------//
fetchdata_confirmation() async{
  try{
    http.Response response=await http.get(Uri.parse('https://newsapi.org/h/jjj=jjj?hg&apiKey=$apiKey'));
    if(response.statusCode==200)
    {
      var jsonData=json.decode(response.body);
  
  data_confirmation=Data_confirmation.fromJson(jsonData);
      
      
      
    }

  }
  catch(Exc){
    print(Exc);
  }
  

}
//-----------------------------------------------دالة فلترة الرحلات---------------------------------------//
change(String date)
{

// يرجع اليوم في هذا التاريخ الاثنين مثلا
 String Day=formatDate(DateTime.parse(date),[D]);
 //نحول الاختصارات الى الايام الانه ترسل من المكتب ايام
 if(Day=='Sat')
 Day=='السبت';
 else if(Day=='Sun')
Day=='الأحد';
 else if(Day=='Mon')
Day=='الأثنين';
 else if(Day=='Tues')
Day=='الثلاثاء';
 else if(Day=='Wed')
Day=='الأربعاء';
 else if(Day=='Thurs')
Day=='الخميس';
 else if(Day=='Fri')
Day=='الجمعة';
return Day;
}
// الرحلات المفلترة باستخدام حقل الزيادة والنقصان او تاريخ اليوم الماخوذ من نفس الحقل
List trips_inc_and_dec_date=[]; 
//رحلات اليوم
List trips_date_now=[]; 
//الرحلات المفلترة باستخدام زر البحث
List trips_search_button=[]; 

int counter_trips=0;
checktrip(int filter){
List listtrips=fetchTrips();
//قد يكون تاريخ اليوم ,التاريخ في حقل الزيادة والنقصان
String Dateday=year.toString() +"/"+mounth.toString()+"/"+day.toString();
//مايتم الفلتره على اساسه تاريخ الرحلة ومدينة الوصول ومدينة المغادرة
String select_date=selectedDate;
String ?from_city=selectedItem;
String ?to_city=selectedItem1;

//يساوي التاريخ الحالي 

  //نضيف الرحلات التي في نفس التاريخ الى قائمة
  for(var trip in listtrips)
 { if(trip.trip_day==change(Dateday))
  {
    trips_inc_and_dec_date[counter_trips]=trip;
counter_trips++;
  }

 }
 counter_trips=0;
 //تاريخ اليوم بدون مايضفط على اي زر اول مايشتغل التطبيق
 for(var trip in listtrips)
 { if(trip.trip_day==change(Dateday))
  {
    trips_date_now[counter_trips]=trip;
counter_trips++;
  }

 }
 counter_trips=0;
 //نضيف الرحلات التي في نفس التاريخ وكذا في نفس مدينة الوصول والمغادرة
  for(var trip in listtrips)
 { if(trip.trip_day==change(select_date)&&trip.to_city==to_city&&trip.from_city==from_city)
  {
    
    trips_search_button[counter_trips]=trip;
counter_trips++;
  }

 }
 counter_trips=0;
if(filter==1)
return trips_inc_and_dec_date;
else if(filter==2)
return trips_search_button;
else if(filter==0)
return trips_date_now;
}

}

