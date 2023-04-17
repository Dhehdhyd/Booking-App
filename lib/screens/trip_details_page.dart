import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Functions/fetch.dart';
import '../Functions/insert.dart';
import '../class_tools/app_card_trip.dart';
import '../main.dart';
import '../screens/create_an_account_page.dart';
import '../screens/settings.dart';
import 'create_an_account_traveler.dart';
class Trip_details_page extends StatefulWidget {
  @override
  _Trip_details_pageState createState() => _Trip_details_pageState();
}

class _Trip_details_pageState extends State<Trip_details_page> {
 int _radiovalue=0;
  String result="";
  int numberselect=0;
  String typepay="";
  Insert s=Insert();
 Fetch f=Fetch();

 

   myDialog(){
    if(numberselect==0)
     { final AlertDialog ok1=AlertDialog(
title:Container(
alignment: Alignment.center,
  child: Row(
    children: [
        Icon(Icons.warning_sharp,color: fristappcolor,size: 40,),
      SizedBox(width: 4.w,),
      Text("الرجاء تحديد طريقة الدفع",style: TextStyle(color:secondappcolor,fontSize: 13.sp,fontWeight: FontWeight.bold),),
    ],
  ),) ,

      );
               

         showDialog(builder: (context) => ok1, context:context);
  }
else if(numberselect==1)
{
   ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         content: Text("إضغط تم لاكمال العملية"),
         behavior: SnackBarBehavior.floating,
       )
     ); 
   final AlertDialog ok2=AlertDialog(
title:Container(
alignment: Alignment.center,
  child: Column(
    children: [
      Text(" الرجاء المسارعه بدفع الى مقر المكتب تم استلام الطلب بنجاح سوف تصلك رسالة SMS برقم الحجز الخاص بك",style: TextStyle(color: secondtextcolor,fontSize: 12.sp,fontWeight: FontWeight.bold),),
     Container(
    
    height: 5.h,
    
    child:Icon(Icons.alarm,color:fristappcolor,size: 50,)
    
    
    
    ),
    SizedBox(height: 4.h,),
    Center(
      child: Container(
            width: 25.w,
          height: 9.h,
          child: ElevatedButton(
       style: ElevatedButton.styleFrom(
        primary: secondappcolor,
 
textStyle:TextStyle(color:Colors.white,),
         shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0)
      ),
      ),
            child: Center(child: Text(" تم",style: TextStyle(color: Colors.white),)),
            onPressed: (){
  setState(() {
     
        //ارسل بيانات لتاكيد الحجز مثل اسم مقدم الطلب  وصورتة ورقم هاتفة وتاريخ الرحلةورقم الرحلة وتاريخ الحجز الذي هو تاريخ الرحلة  وكذا نوع الدفع 
 s.SendBooking_data(shprname, shprimage, shprphon_no, tthis_trip_id, trip_date, typepay) ;
 

 
  });
      // غلق نافذة الرسالة 
   Navigator.of(context, rootNavigator: true).pop('ok2');         

//الانتقال الى الصفحة الرئسية
                    Navigator.of(context).push(MaterialPageRoute(
      builder: (_){
      
        
 return  MyHomePage();


}  ),
    );
          

            },
          ),
          ),
    ), ],
  )
  ) ,

  

       

      );
         showDialog(builder: (context) => ok2, context:context);
               
     


   }

else if(numberselect==2)
{
   ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         content: Text("إضغط تم لاكمال العملية"),
         behavior: SnackBarBehavior.floating,
       )
     ); 
   final AlertDialog ok3=AlertDialog(
title:Container(
alignment: Alignment.center,
  child: Column(
    children: [
      Text("تم استلام طلبك بنجاح سوف تصلك رسالة SMS برقم الحجز الخاص بك بعد تاكد مكتبنا من استلام اشعار الدفع",style: TextStyle(color: secondtextcolor,fontSize: 12.sp,fontWeight: FontWeight.bold),),
     Container(
    
    height: 8.h,
    
    child:Icon(Icons.alarm,color:fristappcolor,size: 50,)
    
    
    
    ),
    SizedBox(height: 4.h,),
    Center(
      child: Container(
            width: 25.w,
          height: 9.h,
          child: ElevatedButton(
       style: ElevatedButton.styleFrom(
        primary: secondappcolor,
 
textStyle:TextStyle(color:Colors.white,),
         shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0)
      ),
      ),
            child: Center(child: Text(" تم",style: TextStyle(color: Colors.white),)),
            onPressed: (){
  setState(() {
          //ارسل بيانات لتاكيد الحجز مثل اسم مقدم الطلب  وصورتة ورقم هاتفة وتاريخ الرحلةورقم الرحلة وتاريخ الحجز الذي هو تاريخ الرحلة  وكذا نوع الدفع 
 s.SendBooking_data(shprname, shprimage, shprphon_no, tthis_trip_id, trip_date, typepay) ;

  });
      // غلق نافذة الرسالة 
   Navigator.of(context, rootNavigator: true).pop('ok3');         

//الانتقال الى الصفحة الرئسية
                    Navigator.of(context).push(MaterialPageRoute(
      builder: (_){
      
        
 return  MyHomePage();


}  ),
    );
          

            },
          ),
          ),
    ), ],
  )
  ) ,

  

       

      );
         showDialog(builder: (context) => ok3, context:context);
               
     


   }
   
 
  }
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
               appBar: AppBar(
          
         actions: 
          [ Padding(
             padding: EdgeInsets.only(left: 210.0),

             child: Text(' تاكيد الحجز',style:TextStyle(fontSize: 16.sp,fontFamily: 'Lobster',height: 1.7,color:lightcolor)),
           ),

          ],backgroundColor: secondappcolor,
    
        ),
      body: SingleChildScrollView(
              child: Column(
          children: [
            
//بيانات الرحلة
             Container(
               margin: EdgeInsets.only(top: 20),
               width: 190.w,
        height: 65.h,
               child: Card(
                 
           shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(color: secondappcolor,width: 0.5.w),
    ),
        color: lightcolor,
child: Column(
  children: [
        Center(child: Text("بيانات الرحلة",style: TextStyle(fontSize: 15.sp,color: secondtextcolor,fontWeight: FontWeight.bold),),),
 Row(
   children: [
     
     Container(
                 margin: EdgeInsets.only(right: 35),

       child: Text('اسم المكتب',style: TextStyle(fontSize: 12.sp,color: secondtextcolor,fontWeight: FontWeight.bold)
       )
       ),
         Container(
                 margin: EdgeInsets.only(right: 65),

       child: Text(booking_trip[0]['office_name'],style: TextStyle(fontSize: 12.sp,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),
        ],
 ),
       SizedBox(height: 1.h,) ,
       
     Row(
       children: [
         Container(
                     margin: EdgeInsets.only(right: 35),

           child: Text(' تاريخ الرحلة',style: TextStyle(fontSize: 12.sp,color: secondtextcolor,fontWeight: FontWeight.bold)
           )
           ),
       
         Container(
                 margin: EdgeInsets.only(right: 65),

       child: Text(trip_date,style: TextStyle(fontSize: 12.sp,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),
        ],
     ),
       SizedBox(height: 1.h,) ,
       
     Row(
       children: [
         Container(
                     margin: EdgeInsets.only(right: 35),

           child: Text('من مدينة ',style: TextStyle(fontSize: 12.sp,color: secondtextcolor,fontWeight: FontWeight.bold)
           )
           ),
        
         Container(
                 margin: EdgeInsets.only(right: 100),

       child: Text(booking_trip[0]['departure_city'],style: TextStyle(fontSize: 12.sp,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),
        ],
     ),
       SizedBox(height: 1.h,) ,
       
     Row(
       children: [
         Container(
                     margin: EdgeInsets.only(right: 35),

           child: Text('الى مدينة',style: TextStyle(fontSize: 12.sp,color: secondtextcolor,fontWeight: FontWeight.bold)
           )
           ),
       
         Container(
                 margin: EdgeInsets.only(right: 100),

       child: Text(booking_trip[0]['arrival_city'],style: TextStyle(fontSize: 12.sp,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),
        ],
     ), 
     
       SizedBox(height: 1.h,) ,

         Row(
           children: [
             Container(
                     margin: EdgeInsets.only(right: 35),

       child: Text('موعد الحضور',style: TextStyle(fontSize: 12.sp,color: secondtextcolor,fontWeight: FontWeight.bold)
       )
       ),
        
       
     Container(
                 margin: EdgeInsets.only(right: 70),

       child: Text(booking_trip[0]['attendance_time'],style: TextStyle(fontSize: 12.sp,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ), 
          ],
         ),
       SizedBox(height: 1.h,), 
         Row(
           children: [
             Container(
                     margin: EdgeInsets.only(right: 35),

       child: Text('مدة الانتظار ',style: TextStyle(fontSize: 12.sp,color: secondtextcolor,fontWeight: FontWeight.bold)
       )
       ),
          
       
     Container(
                 margin: EdgeInsets.only(right: 70),

       child: Text(booking_trip[0]['waiting_time'],style: TextStyle(fontSize: 12.sp,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ), 
        ],
         ),
       SizedBox(height: 1.h,) ,

         Row(
           children: [
             Container(
                     margin: EdgeInsets.only(right: 35),

       child: Text('موعد الانطلاق ',style: TextStyle(fontSize: 12.sp,color:secondtextcolor,fontWeight: FontWeight.bold)
       )
       ),
         
       
     Container(
                 margin: EdgeInsets.only(right: 70),

       child: Text(booking_trip[0]['departure_time'],style: TextStyle(fontSize: 12.sp,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),
         ],
         ), 
       SizedBox(height: 1.h,) ,

         Row(
           children: [
             Container(
                     margin: EdgeInsets.only(right: 35),

       child: Text('محطة انطلاق الباص ',style: TextStyle(fontSize: 12.sp,color: secondtextcolor,fontWeight: FontWeight.bold)
       )
       ),
          
       
     Container(
                 margin: EdgeInsets.only(right: 30),

       child: Text(booking_trip[0]['departure_station'],style: TextStyle(fontSize: 12.sp,color:thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),  
        ],
         ),
       SizedBox(height: 1.h,) ,

         Row(
           children: [
             Container(
                     margin: EdgeInsets.only(right: 35),

       child: Text(' محطة وصول الباص',style: TextStyle(fontSize: 12.sp,color: secondtextcolor,fontWeight: FontWeight.bold)
       )
       ),
         
       
     Container(
                 margin: EdgeInsets.only(right: 30),

       child: Text(booking_trip[0]['arrival_station'],style: TextStyle(fontSize: 12.sp,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),
         ],
         ), 
       SizedBox(height: 1.h,) ,
         Row(
           children: [
             Container(
                     margin: EdgeInsets.only(right: 35),

       child: Text(' سعر التذكرة',style: TextStyle(fontSize: 12.sp,color: secondtextcolor,fontWeight: FontWeight.bold)
       )
       ),
         
       
     Container(
                 margin: EdgeInsets.only(right: 80),

       child: Text(booking_trip[0]['ticket_price'],style: TextStyle(fontSize: 12.sp,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),    
   ],
 )
  ],
),
),
             ),
             SizedBox(height: 5.h,),
             //بيانات المسافر
             Container(
               width: 350.w,
        height: 35.h,
               child: Card(
                 
         shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(color: secondappcolor,width: 0.5.w),
    ),
        color: lightcolor,
child: Column(
  children: [
        Center(child: Text("بيانات المسافر",style: TextStyle(fontSize: 17.sp,color: secondtextcolor,fontWeight: FontWeight.bold),),),
 Row(
   children: [
     
     Container(
                 margin: EdgeInsets.only(right: 35),

       child: Text('اسم المسافر',style: TextStyle(fontSize: 12.sp,color: secondtextcolor,fontWeight: FontWeight.bold)
       )
       ),
         Container(
                 margin: EdgeInsets.only(right: 85),

       child: Text('رقم هاتف المسافر',style: TextStyle(fontSize: 12.sp,color: secondtextcolor,fontWeight: FontWeight.bold)
       )
       ),
        ],
 ),
     SizedBox(height: 5.h,),
      Row(
        children: [
          Expanded(
                      child: Container(
                       margin: EdgeInsets.only(right: 2),

             child: Text(shprname,style: TextStyle(fontSize: 12.sp,color: thridtextcolor,fontWeight: FontWeight.bold)
             )
             ),
          ),
     
         Expanded(
                    child: Container(
                   margin: EdgeInsets.only(right: 50),

       child: Text(shprphon_no,style: TextStyle(fontSize: 12.sp,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),
         ),  
     ],
      ),
  ],
),
),
             ),
              SizedBox(height: 5.h,),
              Container(
               width: 350.w,
        height: 70.h,
               child: Card(
                 
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(color: secondappcolor,width: 0.5.w),
    ),
        color: lightcolor,
child: Column(
  children: [
        Center(child: Text("سياسة الحجز في الشركة",style: TextStyle(fontSize: 17.sp,color: secondtextcolor,fontWeight: FontWeight.bold),),),
 
     
     
         Padding(
           padding: const EdgeInsets.all(15.0),
           child: Container(
                       margin: EdgeInsets.only(right: 35),

             child: Text(booking_trip[0]['booking_policy'],
             style: TextStyle(fontFamily: 'Lobster',fontSize: 12.sp,fontWeight: FontWeight.bold,height: 2,color: thridtextcolor)
             )
             ),
         ),
     
       
  ],
),
),
             ),
              SizedBox(height: 5.h,),
//بيانات الدفع
            Container(
               width: 350.w,
        height: 55.h,
               child: Card(
                 
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(color: secondappcolor,width: 0.5.w),
    ),
        color: lightcolor,
child: Column(
  children: [
        Center(child: Text(" بيانات الدفع ",style: TextStyle(fontSize: 17.sp,color: secondtextcolor,fontWeight: FontWeight.bold),),),
  Row(
   children: [
     
     Container(
                 margin: EdgeInsets.only(right: 35),

       child: Text(' مقر المكتب',style: TextStyle(fontSize: 12.sp,color: secondtextcolor,fontWeight: FontWeight.bold)
       )
       ),
         Container(
                 margin: EdgeInsets.only(right: 30),

       child: Text(booking_trip[0]['location'],style: TextStyle(fontSize: 12.sp,color:thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),
        ],
 ),
     SizedBox(height: 1.h,),
     
      Row(
        children: [
          Container(
                     margin: EdgeInsets.only(right: 35),

           child: Text('الحساب البنكي ',style: TextStyle(fontSize: 12.sp,color: secondtextcolor,fontWeight: FontWeight.bold)
           )
           ),
     
         Container(
                 margin: EdgeInsets.only(right: 10),
           padding: const EdgeInsets.all(15.0),

       child: Text(booking_trip[0]['bank_account'],style: TextStyle(fontSize: 12.sp,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),  
     ],
      ),
      SizedBox(height: 1.h,),
     
      Row(
        children: [
          Container(
                     margin: EdgeInsets.only(right: 35),

           child: Text('اسم البنك ',style: TextStyle(fontSize: 12.sp,color: secondtextcolor,fontWeight: FontWeight.bold)
           )
           ),
     
         Container(
                 margin: EdgeInsets.only(right: 35),
           padding: const EdgeInsets.all(15.0),

       child: Text(booking_trip[0]['bank_name'],style: TextStyle(fontSize: 12.sp,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),  
     ],
      ),
     SizedBox(height: 2.h,),
          Container(
                     margin: EdgeInsets.only(right: 30),

           child: Text(' طريقة الدفع ',style: TextStyle(fontSize: 12.sp,color: secondtextcolor,fontWeight: FontWeight.bold)
           )
           ),
     SizedBox(height: 3.h,),
     Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Radio(
              
            value: 1,
            groupValue: _radiovalue,
            onChanged: <int>(value){
              setState(() {
                              _radiovalue=value;
                              numberselect=1;
                              typepay="كاش";

                            });
            },
          ),
          Text('الدفع نقدا',style: TextStyle(fontSize: 12.sp,color: thridtextcolor),),
                Radio(
              
            value: 2,
            groupValue: _radiovalue,
            onChanged: <int>(value){
              setState(() {
                              _radiovalue=value;
                              numberselect=2;
                              typepay="الكتروني";
                            });
            },
          ),
          Text('التحويل البنكي',style: TextStyle(fontSize: 12.sp,color:thridtextcolor),),
        ],
      ),
      
    ),
      // AppRadio(),
       
     
      
     
       
  ],
),
),
             ),
             // زر التاكيد
              Container(child: Column(
  children: [
    
     ElevatedButton(
     style: ElevatedButton.styleFrom(
      primary: secondappcolor,
 textStyle: TextStyle(color: Colors.white),

       shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
    ),
    ),
    
    onPressed: (){
   setState(() {
       myDialog(); 
     
      });
     
    },
    child: Text('تأكيد الحجز',style: TextStyle(fontSize: 13.sp,color: lightcolor)),
    
    
    ),
    
  ],
       crossAxisAlignment: CrossAxisAlignment.stretch, 
    ),
), 
   
          ],
        ),
      ),
    );
  }
}