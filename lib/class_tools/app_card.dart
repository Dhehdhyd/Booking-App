import 'package:flutter/material.dart';
import '../screens/create_an_account_page.dart';

//import '../main.dart';بطاقة الرحلة
class AppCard extends StatefulWidget {
  @override
  _AppCardState createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  void select_page(BuildContext ctx,int index_page)
  {
    Navigator.of(ctx).pushNamed(
      
        
    index_page==1?'trip_details_page':index_page==2?'mycreate_account':'create_account',
arguments: {
//مفتاح وقيمة'id':indexpage==1?10:20وهكذا كل القيم التي تحتاج لتمريرها

}  
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
    color: Color.fromRGBO(77, 0, 77,0.7),
    child: ListTile(
      leading: Icon(Icons.person),
      title: Text("حجز لي"),
      onTap: (){
// هل قد انشاء حساب من قبل ام لاأذا انشاء ينتقل الى اتمام الحجز او الى صفحة الانشاء
   //احدد رقم الصفحة
   setState(() {
      select_page(context, 2);
      }); 
        
    },
    ),
    ),
    SizedBox(height: 10,),
       Container(
      width: 300,
    color: Color.fromRGBO(77, 0, 77,0.7),
    child: ListTile(
      leading: Icon(Icons.man),
      title: Text("حجز لمسافر"),
      onTap: (){
 setState(() {
select_page(context, 3);
    
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
                 child: Image.asset("assets/images/bus1.png",alignment: Alignment.center,fit: BoxFit.fill,)
                 ),
            
                  
                  //العنوان
                 Center(
                   child: Text(" باصات أبوسرهد",style:TextStyle(color: Color.fromRGBO(0,0 ,77,0.9),fontSize: 15,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
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

                   child: Text("موعد الحضور",style:TextStyle(color: Color.fromRGBO(77,0 ,77,1),fontSize: 13,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
          ),
          ),
                 ),
                  
             //الساعة
                 Container(
                 margin: EdgeInsets.only(right: 80),

                   child: Text("12:00",style:TextStyle(color: Color.fromRGBO(0,0 ,77,0.9),fontSize: 10,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
          ),
          ),
                 ),
                 //من مدينة
                       Container(
                 margin: EdgeInsets.only(right: 50),

                   child: Text("من :  ",style:TextStyle(color: Color.fromRGBO(77,0 ,77,1),fontSize: 13,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
          ),
          ),
                 ),
                       //من مدينة
                       Container(
                 margin: EdgeInsets.only(right: 8),

                   child: Text("صنعاء",style:TextStyle(color: Color.fromRGBO(0,0 ,77,0.9),fontSize: 12,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
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

                   child: Text("ساعات الانتظار ",style:TextStyle(color: Color.fromRGBO(77,0 ,77,1),fontSize: 13,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
          ),
          ),
                 ),
                  
             //الساعة
                 Container(
                 margin: EdgeInsets.only(right: 70),

                   child: Text("02:00",style:TextStyle(color: Color.fromRGBO(0,0 ,77,0.9),fontSize: 10,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
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

                   child: Text("موعد  الانطلاق",style:TextStyle(color: Color.fromRGBO(77,0 ,77,1),fontSize: 13,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
          ),
          ),
                 ),
                  
             //الساعة
                 Container(
                 margin: EdgeInsets.only(right: 75),

                   child: Text("02:00",style:TextStyle(color: Color.fromRGBO(0,0 ,77,0.9),fontSize: 10,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
          ),
          ),
                 ),
                 //الى مدينة
                       Container(
                 margin: EdgeInsets.only(right: 50),

                   child: Text("الى : ",style:TextStyle(color: Color.fromRGBO(77,0 ,77,1),fontSize: 13,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
          ),
          ),
                 ),
                   //الى مدينة
                       Container(
                 margin: EdgeInsets.only(right: 8),

                   child: Text("اب",style:TextStyle(color: Color.fromRGBO(0,0 ,77,0.9),fontSize: 11,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
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

                   child: Text("نوع الباص ",style:TextStyle(color: Color.fromRGBO(77,0 ,77,1),fontSize: 13,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
          ),
          ),
                 ),
                  
             //نوع
                 Container(
                 margin: EdgeInsets.only(right: 70),

                   child: Text("إقتصادي",style:TextStyle(color: Color.fromRGBO(0,0 ,77,0.9),fontSize: 11,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
          ),
          ),
                 ),
                 
                    ],
            ),
                 SizedBox(height: 6,),
                   Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
               // سعر الرحلة  
                     Container(
                 margin: EdgeInsets.only(right: 60),

                   child: Text("سعر الرحلة",style:TextStyle(color: Color.fromRGBO(77,0 ,77,1),fontSize: 13,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
          ),
          ),
                 ),
                  
             //سعر
                 Container(
                 margin: EdgeInsets.only(right: 75),

                   child: Text("7000",style:TextStyle(color: Color.fromRGBO(0,0 ,77,0.9),fontSize: 10,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
          ),
          ),
                 ),
             //نوع العملة
                 Container(
                 margin: EdgeInsets.only(right: 10),

                   child: Text("ر.ي",style:TextStyle(color: Color.fromRGBO(77,0 ,77,1),fontSize: 13,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
          ),
          ),
                 ),
                    ],
            ), 
        //زر الحجز
              Container(child: Column(
  children: [
          RaisedButton(
    disabledColor: Color.fromRGBO(77, 0, 77,1),
    disabledTextColor:Colors.white, 
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0)
    ),
    
    onPressed:null,// myDialog(),
    child: Text('إحجز رحلتك الآن',style: TextStyle(fontSize: 10)),
    
    
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
