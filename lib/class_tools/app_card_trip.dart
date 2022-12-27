import 'package:flutter/material.dart';
import '../Functions/insert.dart';
import '../Models/trip_model.dart';
import '../Models/trips_model.dart';
import '../Functions/fetch.dart';
import '../screens/create_an_account_traveler.dart';
import '../screens/trip_details_page.dart';
import '../screens/create_an_account_page.dart';
import '../main.dart';
import '../screens/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



//بطاقة الرحلة
//متغيرات سوف ترسل من اجل معرفة اي رحلة تم حجزها
String office_name="";
String tocity="";
String fromcity="";


class AppCard extends StatefulWidget {

  @override

  _AppCardState createState() => _AppCardState();

}



class _AppCardState extends State<AppCard> { 

  @override


Insert s=Insert();
Fetch f=Fetch();

//التنقل بين الصفحات

  void select_page(BuildContext ctx,int index_page)

  {

    Navigator.of(ctx).push(MaterialPageRoute(

      builder: (_){

      

        

 return   index_page==1?Trip_details_page():index_page==2?Mycreate_account():Create_account();

//arguments: {

//مفتاح وقيمة'id':indexpage==1?10:20وهكذا كل القيم التي تحتاج لتمريرها



}  ),

    );

     }

myDialog(){

  

     final AlertDialog ad=AlertDialog(

title:Text("حجز الرحلة  ") ,

content: Container(

height: 150,

child: Column(

  children: [

    Divider(color: Colors.black,),

    Container(

      width: 300,

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

           SizedBox(width: 10,),

          Text("حجز لي",style: TextStyle(color: Colors.white),),

         

           

        ],

      ),

      onPressed: (){

// هل قد انشاء حساب من قبل ام لاأذا انشاء ينتقل الى اتمام الحجز او الى صفحة الانشاء

   //احدد رقم الصفحة

   setState(() {

      select_page(context, 1);
      //ارسال البيانات بدالة الارسال والمتغيرات منها من تتغير قيمتها هنا ومنها من تتغير في صفحة انشاء حساب اسم العميل وصفحة جلب البيانات مثل التاريخ
s.SendBooking_data(cname, office_name, trip_date, tocity, fromcity);

      // غلق نافذة الرسالة 

   Navigator.of(context,

   //يغلق النافذة عند النقر على اي مكان في الشاشة

   rootNavigator: true).pop('dialog');         



      }); 

        

    },

    ),

    ),

    SizedBox(height: 10,),

       Container(

      width: 300,

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

           SizedBox(width: 10,),

          Text("حجز لمسافر",style: TextStyle(color: Colors.white)),

          

         

        ],

      ),

      onPressed: (){

 setState(() {

select_page(context, 3);

   Navigator.of(context,rootNavigator: true).pop('dialog');         

    

  });

      },

    ),

    ),  ],

)

),



      );

               



    setState(() {

        showDialog(builder: (context) => ad, context:context);

          

        });  

  }



  Widget build(BuildContext context) {

List tripss= f.checktrip(filter_trips);


    return 



      Container(

        width: 360,

        height: 310,

        child: FutureBuilder(
          future:  f.checktrip(filter_trips),

          builder:(context, snapshot) {

                      if(snapshot!=null){

                        return ListView.builder(

                          itemCount: tripss.length,

                          itemBuilder: (context, index) {

return         Card(

          

           shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(25.0),

        side: BorderSide(color: fristappcolor,width: 2.5),

    ),

        color: lightcolor,

            child: SingleChildScrollView(

                      child: Column(

                children: [

            Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [

                SizedBox(height: 2,),

                //صورة شعار الشركة

                Container(

                  margin: EdgeInsets.only(top: 5),

                 width: 40,

                 height: 40,

                 alignment: Alignment.topLeft,

                 child: Image.asset(tripss[index].office_logo_image,alignment: Alignment.center,fit: BoxFit.fill,)

                 ),

            

                SizedBox(height: 1,),

                  

                  //اسم المكتب

                 Center(

                   child: Text(tripss[index].office_logo,style:TextStyle(color:secondtextcolor,fontSize: 15,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                    ],

            ),

               

                 SizedBox(height: 6,),

                   Row(

              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,



              children: [

               //موعد الحضور

                     Container(

                 margin: EdgeInsets.only(right: 35),



                   child: Text("موعد الحضور",style:TextStyle(color: secondtextcolor,fontSize: 13,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                  

             //الساعة

                 Container(

                 margin: EdgeInsets.only(right: 80),



                   child: Text(tripss[index].attendance_date,style:TextStyle(color: thridtextcolor,fontSize: 10,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                 //من مدينة

                       Container(

                 margin: EdgeInsets.only(right: 50),



                   child: Text("من :  ",style:TextStyle(color:secondtextcolor,fontSize: 13,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                       //من مدينة

                       Container(

                 margin: EdgeInsets.only(right: 8),



                   child: Text(tripss[index].from_city,style:TextStyle(color:thridtextcolor,fontSize: 12,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,

          ),

          ),

                 ), ],

            ),

               

                 SizedBox(height: 6,),

                   Row(

             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,



              children: [

               //موعد الانتظار بالساعات

                     Container(

                 margin: EdgeInsets.only(right: 35),



                   child: Text("ساعات الانتظار ",style:TextStyle(color:secondtextcolor,fontSize: 13,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                  

             //الساعة

                 Container(

                 margin: EdgeInsets.only(right: 70),



                   child: Text(tripss[index].wait_date,style:TextStyle(color: thridtextcolor,fontSize: 10,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,

          ),

          ),

                 ),

             

                    ],

            ),

               SizedBox(height: 6,),

                   Row(

             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,



              children: [

               //موعد الانطلاق 

                     Container(

                 margin: EdgeInsets.only(right: 35),



                   child: Text("موعد  الانطلاق",style:TextStyle(color:secondtextcolor,fontSize: 13,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                  

             //الساعة

                 Container(

                 margin: EdgeInsets.only(right: 75),



                   child: Text(tripss[index].start_date,style:TextStyle(color:thridtextcolor,fontSize: 10,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                 //الى مدينة

                       Container(

                 margin: EdgeInsets.only(right: 50),



                   child: Text("الى : ",style:TextStyle(color:secondtextcolor,fontSize: 13,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                   //الى مدينة

                       Container(

                 margin: EdgeInsets.only(right: 8),



                   child: Text(tripss[index].to_city,style:TextStyle(color: thridtextcolor,fontSize: 11,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,

          ),

          ),

                 ), ],

            ),   

                 SizedBox(height: 6,),

                   Row(

             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,



              children: [

               //نوع الباص  

                     Container(

                 margin: EdgeInsets.only(right: 60),



                   child: Text("نوع الباص ",style:TextStyle(color: secondtextcolor,fontSize: 13,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                  

             //نوع

                 Container(

                 margin: EdgeInsets.only(right: 70),



                   child: Text(tripss[index].bus_type,style:TextStyle(color:thridtextcolor,fontSize: 11,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                 

                        //حالة الرحلة

                    Container(

                 margin: EdgeInsets.only(right: 55),



                   child: Text(tripss[index].trip_state,style:TextStyle(color: thridtextcolor,fontSize: 10,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,

          ),

          ),

                 ),   ],

            ),

                 SizedBox(height: 6,),

                   Row(

              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,



              children: [

               // سعر الرحلة  

                     Container(

                 margin: EdgeInsets.only(right: 60),



                   child: Text("سعر الرحلة",style:TextStyle(color: secondtextcolor,fontSize: 13,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,

          ),

          ),

                 ),

                  

             //سعر

                 Container(

                 margin: EdgeInsets.only(right: 75),



                   child: Text(tripss[index].price,style:TextStyle(color: thridtextcolor,fontSize: 10,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,

          ),

          ),

                 ),

             //نوع العملة

                 Container(

                 margin: EdgeInsets.only(right: 10),



                   child: Text("ر.ي",style:TextStyle(color: secondtextcolor,fontSize: 13,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,

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

          SizedBox(width: 8,),

          Text("ارجاء إنشاء حساب لك في التطبيق  ",style: TextStyle(color:secondappcolor,fontSize: 15,fontWeight: FontWeight.bold),),

        ],

      ),

     SizedBox(height: 20,),



    Row(

      children: [

        Container(

          width: 100,

        

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

   setState(() {

       select_page(context, 2);

   Navigator.of(context,rootNavigator: true).pop('booking');   

      });

        



          },

        ),

        ),

     

    SizedBox(width: 70,),

       Container(

         

      width: 100,

   

    child: ElevatedButton(

     style: ElevatedButton.styleFrom(

      primary: secondappcolor,

 

       shape:  RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(40.0)

    ),

    ),

      child: Center(child: Text("تراجع",style: TextStyle(color: Colors.white),)),

      onPressed: (){

  setState(() {

   Navigator.of(context,rootNavigator: true).pop('booking');         

      

    });

           



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

  else if(create_account==true)

    {

      //اذا الرحلة غير متاحة

      if(tripss[index].trip_state=="غير متاح")

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
     office_name=tripss[index].office_logo;
     fromcity=tripss[index].from_city;
      tocity=tripss[index].to_city;

     }

    }  },

    child: Text('إحجز رحلتك الآن',style: TextStyle(fontSize: 15,color:Colors.white,)),

    

    

    ),

    

  ],

       crossAxisAlignment: CrossAxisAlignment.center, 

    ),

), 

SizedBox(height: 5,),],    

    ),

      ),

        );



                                                    }

                                                    );

                        

                      }

                      //لو لم يعد الرحلات يظهر الحلقة الدواره

                      else{

                        return CircularProgressIndicator();

                      }

                    }

                    ) ,

        

     

      );

  }

}