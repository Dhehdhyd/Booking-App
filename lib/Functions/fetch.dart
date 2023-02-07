
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:date_format/date_format.dart';
import '../class_tools/app_drawer.dart';
import '../main.dart';


 String messageerre="";

String trip_date="";

     List trips=[];
     String select_date=datetrip;
String select_date1=datetrip1;
String ?from_city=selectedItem;
String ?to_city=selectedItem1;
String Dateday=years+mounths+days;


class Fetch
{
  //دالة جلب الرحلات من السرفر


 Future<List<dynamic>?> fetchTrips() async{
  try{
  
    var request =await http.get( Uri.parse('http://34.133.61.239:8080/trips'));
 
    if(request.statusCode==200)
    {

       return   json.decode(request.body);
    }
    
    

 }
  catch(Exc){
 
     print(Exc);
  }
  
}
//--------------------------------------------دالة جلب بيانات العميل من اجل التعديل-------------------------------//
 Future<List<dynamic>?> fetchclient(String passwordforupdate) async{
   
  try
  {
  
    http.Response response=await http.get(Uri.parse('http://34.133.61.239:8080/users/$passwordforupdate'));
    if(response.statusCode==200)
    {
       if(response.body.isNotEmpty)
   return json.decode(response.body) ;
  
   
    }

  }
  catch(Exc){
   messageerre= Exc.toString();
  }
  

}

//--------------------------------------------------------------------------------------//

//-------------------------------------------  دالة جلب بيانات الحجز لصفحة تاكيد الحجز حسب رقم الرحلة  -------------------------------//
 Future<List<dynamic>?> fetchbooking(int id) async{
  try{
    http.Response response=await http.get(Uri.parse('http://34.133.61.239:8080/trips/id=$id'));
    if(response.statusCode==200)
    {
       
   return json.decode(response.body) ;
  
      
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
Day='الأحد';
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




Future<List<dynamic>?> checktrip(int filter)async{

List<dynamic>? filtertrips=await fetchTrips();
filtertrips2=[];
trips_date_now=[]; 
trips_inc_and_dec_date=[];
trips_search_button=[];  
if(filter==1)
{
//تاريخ الرحلة
//يساوي التاريخ الحالي 

  //نضيف الرحلات التي في نفس التاريخ الى قائمة
 for(int i=0;i<filtertrips!.length;i++)
  
 { if(change(Dateday)==filtertrips[i]['trip_day'])
  {
    trips_inc_and_dec_date.add(filtertrips[i]);

  }
 }
 trip_date=days+'-'+mounths+'-'+years;
filtertrips2.addAll(trips_inc_and_dec_date);


}
 
else if(filter==0)
{
  //تاريخ الرحلة

 //تاريخ اليوم بدون مايضفط على اي زر اول مايشتغل التطبيق
 for(int i=0;i<filtertrips!.length;i++)
 { if(filtertrips[i]['trip_day']==change(Dateday))
  {
    trips_date_now.add(filtertrips[i]);
  }

 }
  //تاريخ الرحلة

  trip_date=dateday;

filtertrips2.addAll(trips_date_now);

}
else if(filter==2)
{
 
 //نضيف الرحلات التي في نفس التاريخ وكذا في نفس مدينة الوصول والمغادرة
 for(int i=0;i<filtertrips!.length;i++)

 {if(filtertrips[i]['trip_day']==change(select_date)&&filtertrips[i]['arrival_city']==to_city.toString()&&filtertrips[i]['departure_city']==from_city.toString())
    
  {
    
    trips_search_button.add(filtertrips[i]);

  }

 }



  trip_date=select_date1;



filtertrips2.addAll(trips_search_button);

}

return filtertrips2;
}

}

