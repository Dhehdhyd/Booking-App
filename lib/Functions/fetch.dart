import '../Models/clients_model.dart';
import '../Models/data_booking.dart';
import '../Models/data_confirmation.dart';
import '../Models/trip_model.dart';
import '../Models/trips_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:date_format/date_format.dart';
import '../class_tools/app_drawer.dart';
import '../class_tools/counter_date_main.dart';
import '../main.dart';
Clients client=Clients();
Booking booking=Booking();
Data_confirmation data_confirmation=Data_confirmation();
String trip_date="";
String massage_error="";
     List tripslist=[];

class Fetch
{
  //دالة جلب الرحلات من السرفر


 Future fetchTrips() async{
  try{
    var response=await http.get(Uri.parse('http://34.133.61.239:8080/trips'));


    

   
    
    if(response.statusCode==200)
    {
    
       tripslist.addAll(json.decode(response.body));
//for(var item in tripslist){
  //Trip.fromJson(item);
//}
  // tripslist=jsonData.map((e)=>Trip.fromJson(e)).toList();
      
      return tripslist;

    }
else
{
  //لو اريد الطبع رسالة الخط ابحث عن اداة حاليا هذا لي فقط
  massage_error='اطبع لوحصل مشكلة= ${response.statusCode}';
} 
 }
  catch(Exc){
 massage_error=Exc.toString();
    
  }
  

}
//--------------------------------------------دالة جلب بيانات العميل من اجل التعديل-------------------------------//
 fetchclient(String passwordforupdate) async{
  try{
    http.Response response=await http.get(Uri.parse('http://34.133.61.239:8080/users/$passwordforupdate'));
    if(response.statusCode==200)
    {
      var jsonData=json.decode(response.body);
  
  client=Clients.fromJson(jsonData);
      
      return true;
      
    }
    
else
{
  //لو اريد الطبع رسالة الخط ابحث عن اداة حاليا هذا لي فقط
  massage_error='اطبع لوحصل مشكلة= ${response.statusCode}';
      return false;

}

  }
  catch(Exc){
    print(Exc);
  }
  

}
//--------------------------------------------------------------------------------------//

//-------------------------------------------  دالة جلب بيانات الحجز لصفحة تاكيد الحجز حسب رقم الرحلة  -------------------------------//
fetchbooking(int id) async{
  try{
    http.Response response=await http.get(Uri.parse('http://34.133.61.239:8080/trips/id=$id'));
    if(response.statusCode==200)
    {
      var jsonData=json.decode(response.body);
  
  booking=Booking.fromJson(jsonData);
      
      return booking;
      
    }

  }
  catch(Exc){
    print(Exc);
  }
  

}
//--------------------------------------------------------------------------------------//

//-----------------------------------------------دالة فلترة الرحلات---------------------------------------//
change(String date)
{

// يرجع اليوم في هذا التاريخ الاثنين مثلا
 String Day=formatDate(DateTime.parse(date),[D]);
 //نحول الاختصارات الى الايام الانه ترسل من المكتب ايام
 if(Day=='Sat')
 Day='السبت';
 else if(Day=='Sun')
Day='الاحد';
 else if(Day=='Mon')
Day='الأثنين';
 else if(Day=='Tue')
Day='الثلاثاء';
 else if(Day=='Wed')
Day='الأربعاء';
 else if(Day=='Thur')
Day='الخميس';
 else if(Day=='Fri')
Day='الجمعة';
return Day;
}
// الرحلات المفلترة باستخدام حقل الزيادة والنقصان او تاريخ اليوم الماخوذ من نفس الحقل
List<dynamic> trips_inc_and_dec_date=[]; 
//رحلات اليوم
List<dynamic> trips_date_now=[]; 
//الرحلات المفلترة باستخدام زر البحث
List<dynamic> trips_search_button=[]; 
List<dynamic> filtertrips2=[];
 
//قد يكون تاريخ اليوم ,التاريخ في حقل الزيادة والنقصان
//مايتم الفلتره على اساسه تاريخ الرحلة ومدينة الوصول ومدينة المغادرة

String select_date=datetrip;
String ?from_city=selectedItem;
String ?to_city=selectedItem1;
String Dateday=years+mounths+days;

String h=tripslist.length.toString();
String h1=tripslist.length.toString();

Future checktrip(int filter)async{

List<dynamic> filtertrips=await fetchTrips();


if(filter==1)
{
//تاريخ الرحلة
//يساوي التاريخ الحالي 

  //نضيف الرحلات التي في نفس التاريخ الى قائمة
 for(int i=0;i<filtertrips.length;i++)
  
 { if(change(Dateday)==filtertrips[i]['trip_day'])
  {
    trips_inc_and_dec_date.add(filtertrips[i]);

  }
 }
 trip_date=Dateday;
filtertrips2.addAll(trips_inc_and_dec_date);
//h=filtertrips[0]['trip_day'];
//h1=filtertrips2[0]['trip_day'];

}
 
else if(filter==0)
{
  //تاريخ الرحلة

 //تاريخ اليوم بدون مايضفط على اي زر اول مايشتغل التطبيق
 for(int i=0;i<filtertrips.length;i++)
 { if(filtertrips[i]['trip_day']=='السبت')//change(Dateday))
  {
    trips_date_now.add(filtertrips[i]);
  }

 }
  //تاريخ الرحلة

  trip_date=Dateday;

filtertrips2.addAll(trips_date_now);

}
else if(filter==2)
{
 
 //نضيف الرحلات التي في نفس التاريخ وكذا في نفس مدينة الوصول والمغادرة
 for(int i=0;i<filtertrips.length;i++)

 { if(filtertrips[i]['trip_day']==change(select_date)&&filtertrips[i]['arrival_city']==to_city.toString()&&filtertrips[i]['departure_city']==from_city.toString())
  {
    
    trips_search_button.add(filtertrips[i]);

  }

 }



  trip_date=select_date;



filtertrips2.addAll(trips_search_button);

}

return filtertrips2;
}

}

