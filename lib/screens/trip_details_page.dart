import 'package:flutter/material.dart';
import '../Functions/fetch.dart';
import '../Functions/insert.dart';
import '../screens/settings.dart';

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
  String booking_number=data_confirmation.booking_number;

   myDialog(){
    if(numberselect==0)
     { final AlertDialog ok1=AlertDialog(
title:Container(
alignment: Alignment.center,
  child: Row(
    children: [
        Icon(Icons.warning_sharp,color: fristappcolor,size: 40,),
      SizedBox(width: 8,),
      Text("الرجاء تحديد طريقة الدفع",style: TextStyle(color:secondappcolor,fontSize: 15,fontWeight: FontWeight.bold),),
    ],
  )) ,

      );
               

         showDialog(builder: (context) => ok1, context:context);
  }
  else if(numberselect==1)
     {
  final AlertDialog ok2=AlertDialog(
title:Container(
alignment: Alignment.center,
  child: Text('''الرجاء المسارعة في الدفع الى اقرب فرع للمكتب خلال 24 ساعة
 ورقم الحجز الخاص بك هو $booking_number ''',style: TextStyle(color:secondtextcolor,fontSize: 15,fontWeight: FontWeight.bold),)) ,
content: Container(
height: 50,
child:Row(
  children: [
        SizedBox(width: 20,),
        Icon(Icons.alarm,color: fristappcolor,size: 40,),
        SizedBox(width: 30,),
        Icon(Icons.airport_shuttle,color: fristappcolor,size: 40,),


  ],
)

),
      );
               

         showDialog(builder: (context) => ok2, context:context);
  }
  else if(numberselect==2)
     {
  final AlertDialog ok3=AlertDialog(
title:Container(
alignment: Alignment.center,
  child: Row(
    children: [
      Icon(Icons.beenhere,color: Colors.green,size: 30),
        SizedBox(width: 20,),
      Text( '''في حال تم وصول اشعار الإصال الى المكتب سوف ترسل لك صورة التذكره أرجاء المسارعة في السداد
       ورقم الحجز الخاص بك هو $booking_number''',style: TextStyle(color: secondtextcolor,fontSize: 15,fontWeight: FontWeight.bold),),
    ],
  )) ,
/*content: Container(
height: 50,
width: 50,
child: Text("صورة التذكره"),
),*/
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
             padding: const EdgeInsets.only(left: 240),

             child: Text("تأكيد الحجز ",style:TextStyle(fontSize: 22,fontFamily: 'Lobster',height: 1.7,color: lightcolor)),
           ),], 
          flexibleSpace: Container(
          decoration: BoxDecoration(
gradient: LinearGradient(colors: [
secondappcolor,
secondappcolor,
  


],),
          ),
          ),

        ),
      body: SingleChildScrollView(
              child: Column(
          children: [
            
//بيانات الرحلة
             Container(
               margin: EdgeInsets.only(top: 40),
               width: 390,
        height: 425,
               child: Card(
                 
           shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(color: secondappcolor,width: 2.5),
    ),
        color: lightcolor,
child: Column(
  children: [
        Center(child: Text("بيانات الرحلة",style: TextStyle(fontSize: 20,color: secondtextcolor,fontWeight: FontWeight.bold),),),
 Row(
   children: [
     
     Container(
                 margin: EdgeInsets.only(right: 35),

       child: Text('اسم المكتب',style: TextStyle(fontSize: 15,color: secondtextcolor,fontWeight: FontWeight.bold)
       )
       ),
         Container(
                 margin: EdgeInsets.only(right: 75),

       child: Text(booking.office_name,style: TextStyle(fontSize: 15,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),
        ],
 ),
       SizedBox(height: 10,) ,
       
     Row(
       children: [
         Container(
                     margin: EdgeInsets.only(right: 35),

           child: Text(' تاريخ الرحلة',style: TextStyle(fontSize: 15,color: secondtextcolor,fontWeight: FontWeight.bold)
           )
           ),
       
         Container(
                 margin: EdgeInsets.only(right: 65),

       child: Text(booking.trip_day,style: TextStyle(fontSize: 15,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),
        ],
     ),
       SizedBox(height: 10,) ,
       
     Row(
       children: [
         Container(
                     margin: EdgeInsets.only(right: 35),

           child: Text('من مدينة ',style: TextStyle(fontSize: 15,color: secondtextcolor,fontWeight: FontWeight.bold)
           )
           ),
        
         Container(
                 margin: EdgeInsets.only(right: 100),

       child: Text(booking.from_city.toString(),style: TextStyle(fontSize: 15,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),
        ],
     ),
       SizedBox(height: 10,) ,
       
     Row(
       children: [
         Container(
                     margin: EdgeInsets.only(right: 35),

           child: Text('الى مدينة',style: TextStyle(fontSize: 15,color: secondtextcolor,fontWeight: FontWeight.bold)
           )
           ),
       
         Container(
                 margin: EdgeInsets.only(right: 100),

       child: Text(booking.to_city.toString(),style: TextStyle(fontSize: 15,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),
        ],
     ), 
     
       SizedBox(height: 10,) ,

         Row(
           children: [
             Container(
                     margin: EdgeInsets.only(right: 35),

       child: Text('موعد الحضور',style: TextStyle(fontSize: 15,color: secondtextcolor,fontWeight: FontWeight.bold)
       )
       ),
        
       
     Container(
                 margin: EdgeInsets.only(right: 70),

       child: Text(booking.attendance_date,style: TextStyle(fontSize: 15,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ), 
          ],
         ),
       SizedBox(height: 10,), 
         Row(
           children: [
             Container(
                     margin: EdgeInsets.only(right: 35),

       child: Text('ساعات الانتظار ',style: TextStyle(fontSize: 15,color: secondtextcolor,fontWeight: FontWeight.bold)
       )
       ),
          
       
     Container(
                 margin: EdgeInsets.only(right: 70),

       child: Text(booking.wait_date,style: TextStyle(fontSize: 15,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ), 
        ],
         ),
       SizedBox(height: 10,) ,

         Row(
           children: [
             Container(
                     margin: EdgeInsets.only(right: 35),

       child: Text('موعد الانطلاق ',style: TextStyle(fontSize: 15,color:secondtextcolor,fontWeight: FontWeight.bold)
       )
       ),
         
       
     Container(
                 margin: EdgeInsets.only(right: 70),

       child: Text(booking.start_date,style: TextStyle(fontSize: 15,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),
         ],
         ), 
       SizedBox(height: 10,) ,

         Row(
           children: [
             Container(
                     margin: EdgeInsets.only(right: 35),

       child: Text('محطة انطلاق الباص ',style: TextStyle(fontSize: 15,color: secondtextcolor,fontWeight: FontWeight.bold)
       )
       ),
          
       
     Container(
                 margin: EdgeInsets.only(right: 30),

       child: Text(booking.bus_starting_station,style: TextStyle(fontSize: 15,color:thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),  
        ],
         ),
       SizedBox(height: 10,) ,

         Row(
           children: [
             Container(
                     margin: EdgeInsets.only(right: 35),

       child: Text(' محطة وصول الباص',style: TextStyle(fontSize: 15,color: secondtextcolor,fontWeight: FontWeight.bold)
       )
       ),
         
       
     Container(
                 margin: EdgeInsets.only(right: 30),

       child: Text(booking.bus_access_station,style: TextStyle(fontSize: 15,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),
         ],
         ), 
       SizedBox(height: 10,) ,
         Row(
           children: [
             Container(
                     margin: EdgeInsets.only(right: 35),

       child: Text(' سعر التذكرة',style: TextStyle(fontSize: 15,color: secondtextcolor,fontWeight: FontWeight.bold)
       )
       ),
         
       
     Container(
                 margin: EdgeInsets.only(right: 80),

       child: Text(booking.price,style: TextStyle(fontSize: 15,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),    
   ],
 )
  ],
),
),
             ),
             SizedBox(height: 10,),
             //بيانات المسافر
              Container(
               width: 390,
        height: 120,
               child: Card(
                 
         shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(color: secondappcolor,width: 2.5),
    ),
        color: lightcolor,
child: Column(
  children: [
        Center(child: Text("بيانات المسافر",style: TextStyle(fontSize: 20,color: secondtextcolor,fontWeight: FontWeight.bold),),),
 Row(
   children: [
     
     Container(
                 margin: EdgeInsets.only(right: 35),

       child: Text('اسم المسافر',style: TextStyle(fontSize: 15,color: secondtextcolor,fontWeight: FontWeight.bold)
       )
       ),
         Container(
                 margin: EdgeInsets.only(right: 90),

       child: Text('رقم هوية المسافر',style: TextStyle(fontSize: 15,color: secondtextcolor,fontWeight: FontWeight.bold)
       )
       ),
        ],
 ),
     SizedBox(height: 10,),
      Row(
        children: [
          Container(
                     margin: EdgeInsets.only(right: 35),

           child: Text(booking.traveler_name,style: TextStyle(fontSize: 15,color: thridtextcolor,fontWeight: FontWeight.bold)
           )
           ),
     
         Container(
                 margin: EdgeInsets.only(right: 120),

       child: Text(booking.id_number,style: TextStyle(fontSize: 15,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),  
     ],
      ),
  ],
),
),
             ),
              SizedBox(height: 10,),
              Container(
               width: 390,
        height: 400,
               child: Card(
                 
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(color: secondappcolor,width: 2.5),
    ),
        color: lightcolor,
child: Column(
  children: [
        Center(child: Text("سياسة الحجز في الشركة",style: TextStyle(fontSize: 20,color: secondtextcolor,fontWeight: FontWeight.bold),),),
 
     
     
         Padding(
           padding: const EdgeInsets.all(15.0),
           child: Container(
                       margin: EdgeInsets.only(right: 35),

             child: Text(booking.booking_policy,
             style: TextStyle(fontFamily: 'Lobster',fontSize: 17,fontWeight: FontWeight.bold,height: 2,color: thridtextcolor)
             )
             ),
         ),
     
       
  ],
),
),
             ),
              SizedBox(height: 10,),
//بيانات الدفع
            Container(
               width: 390,
        height: 350,
               child: Card(
                 
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(color: secondappcolor,width: 2.5),
    ),
        color: lightcolor,
child: Column(
  children: [
        Center(child: Text(" بيانات الدفع ",style: TextStyle(fontSize: 20,color: secondtextcolor,fontWeight: FontWeight.bold),),),
  Row(
   children: [
     
     Container(
                 margin: EdgeInsets.only(right: 35),

       child: Text(' مقر المكتب',style: TextStyle(fontSize: 15,color: secondtextcolor,fontWeight: FontWeight.bold)
       )
       ),
         Container(
                 margin: EdgeInsets.only(right: 30),

       child: Text(booking.company_headquarters,style: TextStyle(fontSize: 15,color:thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),
        ],
 ),
     SizedBox(height: 10,),
     
      Row(
        children: [
          Container(
                     margin: EdgeInsets.only(right: 35),

           child: Text('الحساب البنكي ',style: TextStyle(fontSize: 15,color: secondtextcolor,fontWeight: FontWeight.bold)
           )
           ),
     
         Container(
                 margin: EdgeInsets.only(right: 10),
           padding: const EdgeInsets.all(15.0),

       child: Text(booking.bank_account,style: TextStyle(fontSize: 15,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),  
     ],
      ),
      SizedBox(height: 5,),
     
      Row(
        children: [
          Container(
                     margin: EdgeInsets.only(right: 35),

           child: Text('اسم البنك ',style: TextStyle(fontSize: 15,color: secondtextcolor,fontWeight: FontWeight.bold)
           )
           ),
     
         Container(
                 margin: EdgeInsets.only(right: 35),
           padding: const EdgeInsets.all(15.0),

       child: Text(booking.bank_name,style: TextStyle(fontSize: 15,color: thridtextcolor,fontWeight: FontWeight.bold)
       )
       ),  
     ],
      ),
     SizedBox(height: 20,),
          Container(
                     margin: EdgeInsets.only(right: 30),

           child: Text(' طريقة الدفع ',style: TextStyle(fontSize: 15,color: secondtextcolor,fontWeight: FontWeight.bold)
           )
           ),
     SizedBox(height: 20,),
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
          Text('الدفع نقدا',style: TextStyle(fontSize: 15,color: thridtextcolor),),
                Radio(
              
            value: 2,
            groupValue: _radiovalue,
            onChanged: <int>(value){
              setState(() {
                              _radiovalue=value;
                              numberselect=2;
                              typepay="إلكتروني";
                            });
            },
          ),
          Text('التحويل البنكي',style: TextStyle(fontSize: 15,color:thridtextcolor),),
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
        //ارسل بيانات لتاكيد الحجز مثل اسم مقدم الطلب واسم المكتب وتاريخ الرحلة ومدينة الوصول والمغادرة وكذا موع الدفع 
       s.SendBookingdata(booking.traveler_name, booking.office_name, booking.trip_day, booking.to_city.toString(), booking.from_city.toString(), typepay);
      });
     
    },
    child: Text('تأكيد الحجز',style: TextStyle(fontSize: 15,color: lightcolor)),
    
    
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