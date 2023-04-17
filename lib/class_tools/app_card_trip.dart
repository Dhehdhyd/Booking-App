import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../Functions/insert.dart';
import '../Functions/fetch.dart';
import '../main.dart';
import '../screens/create_an_account_traveler.dart';
import '../screens/trip_details_page.dart';
import '../screens/create_an_account_page.dart';
import 'dart:convert';
import '../screens/settings.dart';




//بطاقة الرحلة
//متغيرات سوف ترسل من اجل معرفة اي رحلة تم حجزها
String office_name="";
int tthis_trip_id=1;
//متغير جلب بيانات رحلة المحجوزه
  List<dynamic> booking_trip=[];


class AppCard extends StatefulWidget {

  @override

  _AppCardState createState() => _AppCardState();

}



class _AppCardState extends State<AppCard>{ 
  Insert s=Insert();
Fetch f=Fetch();


  @override



//التنقل بين الصفحات

  void select_page(BuildContext ctx,int index_page)

  {

    Navigator.of(ctx).push(MaterialPageRoute(

      builder: (_){

      

        

 return   index_page==1?Trip_details_page():index_page==2?Mycreate_account():index_page==3?Create_account():MyHomePage();

//arguments: {

//مفتاح وقيمة'id':indexpage==1?10:20وهكذا كل القيم التي تحتاج لتمريرها



}  ),

    );

     }

myDialog(){

  

     final AlertDialog ad=AlertDialog(

title:Text("حجز الرحلة  ") ,

content: Container(

height: 25.h,

child: Column(

  children: [

    Divider(color: Colors.black,),

    Container(

      width: 100.w,

    child: 

   

   ElevatedButton(

     style: ElevatedButton.styleFrom(

      primary: fristappcolor,

       shape:  RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(40.0)

    ),

    ),

      child: Row(

        children: [

          Icon(Icons.person),

           SizedBox(width: 2.5.w,),

          Text("حجز لي",style: TextStyle(color: Colors.white),),

         

           

        ],

      ),

      onPressed: ()async{
                           f.fetchbooking(tthis_trip_id).then((Value){
               setState(() {

booking_trip=[(Value![0])];
   
}

);      
   select_page(context, 1);     
                              });
SharedPreferences prefs=await SharedPreferences.getInstance();
  //بعض من بيانات العميل يتم حفظها مثل الاسم والصوره ورقم الهاتف من اجل ارسالها عند الحاجة
          create_account=prefs.getBool("create_account")as bool;
          shprname=prefs.getString("shprname").toString();
          shprphon_no=prefs.getString("shprphon_no").toString();
          shprimage=prefs.getString("shprimage").toString();
// هل قد انشاء حساب من قبل ام لاأذا انشاء ينتقل الى اتمام الحجز او الى صفحة الانشاء

   //احدد رقم الصفحة
  // رقم رحلة معينه
 


  ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         content: Text("شكرا لك لختيرك الرحلة المقدمة من مكتب"+" "+booking_trip[0]['office_name']+tthis_trip_id.toString()+booking_trip[0]['arrival_city']),
         behavior: SnackBarBehavior.floating,
       )
     ); 
        



         //جلب بيانات الحجز لداخل متغير Booking من اجل عرضها في صفحة تاكيد الحجز


      // غلق نافذة الرسالة 




      


   
          Navigator.of(context,

   //يغلق النافذة عند النقر على اي مكان في الشاشة

   rootNavigator: true).pop('dialog');   

    },

    ),

    ),

    SizedBox(height: 2.5.h,),

       Container(

      width: 100.w,

    child:   ElevatedButton(

     style: ElevatedButton.styleFrom(

      primary: fristappcolor,

       shape:  RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(40.0)

    ),

    ),

      child: Row(

        children: [

           Icon(Icons.man),

           SizedBox(width: 2.5.w,),

          Text("حجز لمسافر",style: TextStyle(color: Colors.white)),

          

         

        ],

      ),

      onPressed: (){

 

select_page(context, 3);

   Navigator.of(context,rootNavigator: true).pop('dialog');         

    

 

      },

    ),

    ),  ],

)

),



      );

               



  

        showDialog(builder: (context) => ad, context:context);

          

     

  }




  Widget build(BuildContext context) {

List<dynamic> tripss=[];

   return  Container(

        width: 90.w,

        height:70.h,

        child:
         FutureBuilder(
          future:f.checktrip(filter_trips) ,

          builder:(context, snapshot) {
tripss=snapshot.data as List<dynamic>;

                       if(snapshot.data!=null&&tripss.length!=0)
                       
                      {
     
                       // var data=(snapshot.data as List<dynamic>).toList();
                       
                        return ListView.builder(

                          itemCount:tripss.length,

                          itemBuilder: (context, index) {

return          Card(

          

           shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(25.0),

        side: BorderSide(color: fristappcolor,width: 0.5.w),

    ),

        color: lightcolor,

            child: SingleChildScrollView(

                      child: Column(

             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

            Container(
              child: Row(

      

                children: [

SizedBox(width: 20.w),


                  //صورة شعار الشركة
 
                  Container(

                    margin: EdgeInsets.only(top: 5),

                   width: 14.w,

                   height: 8.h,

                   alignment: Alignment.topLeft,
                   child: Image.memory(base64Decode((String.fromCharCodes( tripss[index]['logo_image']['data'].cast<int>())).split(',').last),alignment: Alignment.center,fit: BoxFit.fill,)

                   ),

              


SizedBox(width: 30.w),

                    

                    //اسم المكتب

                   Container(
                 

                     child: Text(tripss[index]['office_name'],style:TextStyle(color:secondtextcolor,fontSize: 10.sp,fontFamily: 'Lobster',height:0.01.h,fontWeight: FontWeight.bold,

          ),

          ),

                   ),

                      ],

              ),
            ),

               



                   Container(
                     child: Row(

            



              children: [

               //موعد الحضور

                       Container(

                margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),



                     child: Text("موعد الحضور",style:TextStyle(color: secondtextcolor,fontSize: 10.sp,fontFamily: 'Lobster',fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                  

             //الساعة

                 Container(

                 margin: EdgeInsets.only(right: 40),



                     child: Text(tripss[index]['attendance_time'],style:TextStyle(color: thridtextcolor,fontSize: 8.sp,fontFamily: 'Lobster',fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                 //من مدينة

                         Container(

                 margin: EdgeInsets.only(right: 60),



                     child: Text("من :  ",style:TextStyle(color:secondtextcolor,fontSize: 10.sp,fontFamily: 'Lobster',fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                         //من مدينة

                         Container(

                 margin: EdgeInsets.only(right: 8),



                     child: Text(tripss[index]['departure_city'],style:TextStyle(color:thridtextcolor,fontSize: 10.sp,fontFamily: 'Lobster',fontWeight: FontWeight.bold,

          ),

          ),

                 ), ],

            ),
                   ),
       Row(

             



              children: [

               //موعد الانتظار بالساعات

                     Container(

                 margin: EdgeInsets.only(right:20),



                   child: Text("مدة الانتظار ",style:TextStyle(color:secondtextcolor,fontSize: 10.sp,fontFamily: 'Lobster',fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                  

             //الساعة

                 Container(

                 margin: EdgeInsets.only(right: 65),



                   child: Text(tripss[index]['waiting_time'],style:TextStyle(color: thridtextcolor,fontSize: 8.sp,fontFamily: 'Lobster',fontWeight: FontWeight.bold,

          ),

          ),

                 ),

               Container(

                 margin: EdgeInsets.fromLTRB(8, 0.5, 8, 0.5),



                   child: Text("دقيقة",style:TextStyle(color: secondtextcolor,fontSize: 9.sp,fontFamily: 'Lobster',fontWeight: FontWeight.bold,

          ),

          ),

                 ),


                    ],

            ),



                   Row(

         



              children: [

               //موعد الانطلاق 

                     Container(

                margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),
              



                   child: Text("موعد  الانطلاق",style:TextStyle(color:secondtextcolor,fontSize: 10.sp,fontFamily: 'Lobster',fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                  

             //الساعة

                 Container(

                 margin: EdgeInsets.only(right: 40),



                   child: Text(tripss[index]['departure_time'],style:TextStyle(color:thridtextcolor,fontSize: 8.sp,fontFamily: 'Lobster',fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                 //الى مدينة

                       Container(

                 margin: EdgeInsets.only(right: 60),



                   child: Text("الى : ",style:TextStyle(color:secondtextcolor,fontSize: 10.sp,fontFamily: 'Lobster',fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                   //الى مدينة

                       Container(

                 margin: EdgeInsets.only(right: 8),



                   child: Text(tripss[index]['arrival_city'],style:TextStyle(color: thridtextcolor,fontSize: 10.sp,fontFamily: 'Lobster',fontWeight: FontWeight.bold,

          ),

          ),

                 ), ],

            ),   

                   Row(

            



              children: [

               //نوع الباص  

                     Container(

                margin: EdgeInsets.fromLTRB(30, 0.5, 30, 0.5),
                 



                   child: Text("نوع الباص ",style:TextStyle(color: secondtextcolor,fontSize: 10.sp,fontFamily: 'Lobster',fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                  

             //نوع

                 Container(

                 margin: EdgeInsets.only(right: 40),



                   child: Text(tripss[index]['bus_type'],style:TextStyle(color:thridtextcolor,fontSize: 8.sp,fontFamily: 'Lobster',fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                 

                        //حالة الرحلة

                    Container(

                 margin: EdgeInsets.only(right: 65),



                   child: Text(tripss[index]['status'],style:TextStyle(color: thridtextcolor,fontSize: 8.sp,fontFamily: 'Lobster',fontWeight: FontWeight.bold,

          ),

          ),

                 ),   ],

            ),

  
                   Row(

             



              children: [

               // سعر الرحلة  

                     Container(

                 margin: EdgeInsets.only(right: 30),



                   child: Text("سعر الرحلة",style:TextStyle(color: secondtextcolor,fontSize: 10.sp,fontFamily: 'Lobster',fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                  

             //سعر

                 Container(

                 margin: EdgeInsets.only(right: 60),



                   child: Text(tripss[index]['ticket_price'],style:TextStyle(color: thridtextcolor,fontSize: 8.sp,fontFamily: 'Lobster',fontWeight: FontWeight.bold,

          ),

          ),

                 ),

             //نوع العملة

                 Container(

                 margin: EdgeInsets.only(right: 5),



                   child: Text("ر.ي",style:TextStyle(color: secondtextcolor,fontSize: 9.sp,fontFamily: 'Lobster',fontWeight: FontWeight.bold,

          ),

          ),

                 ),

           ],

            ), 

        //زر الحجز
               



              Container(

               

                child: Column(

  children: [

      ElevatedButton(

     style: ElevatedButton.styleFrom(

      primary: secondappcolor,

 

textStyle:TextStyle(color:Colors.white,),

       shape:  RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(25.0)

    ),

    ),

     

    

    onPressed:(){

  

      //يختبر هل الشخص يملك حساب او لا 

        if(create_account==false)

     { final AlertDialog booking=AlertDialog(

title:Container(

alignment: Alignment.center,

  child: Column(

    children: [

      Row(

        children: [

            Icon(Icons.warning_sharp,color: fristappcolor,size: 40,),

          SizedBox(width: 4.w,),

          Text("ارجاء إنشاء حساب لك في التطبيق  ",style: TextStyle(color:secondappcolor,fontSize: 10.sp,fontWeight: FontWeight.bold),),

        ],

      ),

     SizedBox(height: 5.h,),



    Row(

      children: [

        Container(

          width: 30.w,

        

        child: ElevatedButton(

     style: ElevatedButton.styleFrom(

      primary: secondappcolor,

 

textStyle:TextStyle(color:Colors.white,),

       shape:  RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(40.0)

    ),

    ),

          child: Center(child: Text("انشاء حساب",style: TextStyle(color: Colors.white),)),

          onPressed: (){

  

       select_page(context, 2);

   Navigator.of(context,rootNavigator: true).pop('booking');   

     

        



          },

        ),

        ),

     

    SizedBox(width: 2.w,),

       Container(

         

      width: 30.w,

   

    child: ElevatedButton(

     style: ElevatedButton.styleFrom(

      primary: secondappcolor,

 

       shape:  RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(40.0)

    ),

    ),

      child: Center(child: Text("تراجع",style: TextStyle(color: Colors.white),)),

      onPressed: (){



   Navigator.of(context,rootNavigator: true).pop('booking');         

      

   

           



      },

      

    ),

    ), 

     ],

    ),

    ],

 

  ),

  ) ,



      );

               



         showDialog(builder: (context) => booking, context:context);



  }

  //اذا الشخص قد انشاء حساب 

  else  if(create_account==true)

    {

      //اذا الرحلة غير متاحة

      if(tripss[index]['status']=="غير متاحة")

       {

     ScaffoldMessenger.of(context).showSnackBar(

       SnackBar(

         content: Text("الرحلة غير متاحة حالياً"),

         behavior: SnackBarBehavior.floating,

       )

     );

   }

   else

     { myDialog();
     setState(() {
            office_name=tripss[index]['office_name'];
    tthis_trip_id=tripss[index]['trip_id'];
          });
     
  

     }

    }  
    
    },

    child: Text('إحجز رحلتك الآن',style: TextStyle(fontSize: 10.sp,color:Colors.white,)),

    

    

    ),

    

  ],

       crossAxisAlignment: CrossAxisAlignment.center, 

    ),

), 

],    

    ),

      ),

        );

                                                  }
                                           );

          }
 else
           {
 //لو لم يعد الرحلات يظهر الحلقة الدواره

                        return Column(
                          children: [
                             Container(
                           child: Text("انت غير متصل بالانترنت او انك تبحث  عن رحلة غير متوفرة لدينا",
                           style: TextStyle(color: secondtextcolor,fontSize: 10.sp,fontWeight: FontWeight.bold),),
                         ),

          Container(
width: 50.w,
height:50.h,
            child: Image.asset("assets/images/net.png",alignment: Alignment.center,fit: BoxFit.fill,)),

                            CircularProgressIndicator(),
                         ],
                        );
                  
 
                      }          

                    }

                    ) ,

        

     

      );

  }

}
