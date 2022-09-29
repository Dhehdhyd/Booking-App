import 'package:flutter/material.dart';
import '../screens/create_an_account_traveler.dart';
import '../screens/trip_details_page.dart';
import '../screens/create_an_account_page.dart';
import '../main.dart';
import '../screens/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

//بطاقة الرحلة
class AppCard extends StatefulWidget {
  @override
  _AppCardState createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override

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
    return 

      Container(
        width: 360,
        height: 310,
        child: Card(
           shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide.none,
    ),
            color: Color.fromRGBO(255, 255, 255, 0.5),
shadowColor: Color.fromRGBO(255, 255, 255, 0.6),
elevation: 400,
            child: SingleChildScrollView(
                      child: Column(
                children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //صورة شعار الشركة
                Container(
                 width: 40,
                 height: 40,
                 alignment: Alignment.topLeft,
                 child: Image.asset("assets/images/bus5.jpg",alignment: Alignment.center,fit: BoxFit.fill,)
                 ),
            
                  
                  //العنوان
                 Center(
                   child: Text(" باصات أبوسرهد",style:TextStyle(color:secondtextcolor,fontSize: 15,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
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

                   child: Text("12:00",style:TextStyle(color: thridtextcolor,fontSize: 10,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
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

                   child: Text("صنعاء",style:TextStyle(color:thridtextcolor,fontSize: 12,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
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

                   child: Text("02:00",style:TextStyle(color: thridtextcolor,fontSize: 10,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
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

                   child: Text("02:00",style:TextStyle(color:thridtextcolor,fontSize: 10,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
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

                   child: Text("اب",style:TextStyle(color: thridtextcolor,fontSize: 11,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
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

                   child: Text("إقتصادي",style:TextStyle(color:thridtextcolor,fontSize: 11,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
          ),
          ),
                 ),
                 
                        //حالة الرحلة
                    Container(
                 margin: EdgeInsets.only(right: 55),

                   child: Text("متاح",style:TextStyle(color: thridtextcolor,fontSize: 10,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
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

                   child: Text("7000",style:TextStyle(color: thridtextcolor,fontSize: 10,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
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
              Container(child: Column(
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
      myDialog();
    }  },
    child: Text('إحجز رحلتك الآن',style: TextStyle(fontSize: 10,color:Colors.white,)),
    
    
    ),
    
  ],
       crossAxisAlignment: CrossAxisAlignment.stretch, 
    ),
), 
SizedBox(height: 5,),],    
    ),
      ),
        ),
      );
  }
}
