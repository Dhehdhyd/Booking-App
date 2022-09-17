import 'package:flutter/material.dart';

class Trip_details_page extends StatefulWidget {
  @override
  _Trip_details_pageState createState() => _Trip_details_pageState();
}

class _Trip_details_pageState extends State<Trip_details_page> {
 int _radiovalue=0;
  String result="";
  int numberselect=0;

   myDialog(){
    if(numberselect==0)
     { final AlertDialog ok1=AlertDialog(
title:Container(
alignment: Alignment.center,
  child: Row(
    children: [
        Icon(Icons.warning_sharp,color: Color.fromRGBO(77, 0, 77, 0.7),size: 40,),
      SizedBox(width: 8,),
      Text("الرجاء تحديد طريقة الدفع",style: TextStyle(color: Color.fromRGBO(77, 0, 77, 1),fontSize: 15,fontWeight: FontWeight.bold),),
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
 ورقم الحجز الخاص بك هو 24446 ''',style: TextStyle(color: Color.fromRGBO(77, 0, 77, 1),fontSize: 15,fontWeight: FontWeight.bold),)) ,
content: Container(
height: 50,
child:Row(
  children: [
        SizedBox(width: 20,),
        Icon(Icons.alarm,color: Color.fromRGBO(77, 0, 77, 1),size: 40,),
        SizedBox(width: 30,),
        Icon(Icons.airport_shuttle,color: Color.fromRGBO(77, 0, 77, 1),size: 40,),


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
      Text( "تم الحجز بنجاح",style: TextStyle(color: Color.fromRGBO(77, 0, 77, 1),fontSize: 15,fontWeight: FontWeight.bold),),
    ],
  )) ,
content: Container(
height: 50,
width: 50,
child: Text("صورة التذكره"),
),
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
             padding: const EdgeInsets.only(left: 210),

             child: Text("تأكيد الحجز ",style:TextStyle(fontSize: 22,fontFamily: 'Lobster',height: 1.7)),
           ),], 
          flexibleSpace: Container(
          decoration: BoxDecoration(
gradient: LinearGradient(colors: [
  Color.fromRGBO(0, 0, 77,1),
  Color.fromRGBO(77, 0, 77,1),
  Color.fromRGBO(0, 0, 77,1),
  


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
        side: BorderSide.none,
    ),
            color: Color.fromRGBO(255, 255, 255, 0.5),
shadowColor: Color.fromRGBO(255, 255, 255, 0.6),
elevation: 400,
child: Column(
  children: [
        Center(child: Text("بيانات الرحلة",style: TextStyle(fontSize: 20,color: Color.fromRGBO(77, 0, 77, 1),fontWeight: FontWeight.bold),),),
 Row(
   children: [
     
     Container(
                 margin: EdgeInsets.only(right: 35),

       child: Text('اسم الشركة',style: TextStyle(fontSize: 15,color: Color.fromRGBO(77, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ),
         Container(
                 margin: EdgeInsets.only(right: 75),

       child: Text('ابو سرهد',style: TextStyle(fontSize: 15,color: Color.fromRGBO(0, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ),
        ],
 ),
       SizedBox(height: 10,) ,
       
     Row(
       children: [
         Container(
                     margin: EdgeInsets.only(right: 35),

           child: Text(' تاريخ الرحلة',style: TextStyle(fontSize: 15,color: Color.fromRGBO(77, 0, 77, 1),fontWeight: FontWeight.bold)
           )
           ),
       
         Container(
                 margin: EdgeInsets.only(right: 65),

       child: Text(' 2022-09-15',style: TextStyle(fontSize: 15,color: Color.fromRGBO(0, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ),
        ],
     ),
       SizedBox(height: 10,) ,
       
     Row(
       children: [
         Container(
                     margin: EdgeInsets.only(right: 35),

           child: Text('من مدينة ',style: TextStyle(fontSize: 15,color: Color.fromRGBO(77, 0, 77, 1),fontWeight: FontWeight.bold)
           )
           ),
        
         Container(
                 margin: EdgeInsets.only(right: 100),

       child: Text('صنعاء ',style: TextStyle(fontSize: 15,color: Color.fromRGBO(0, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ),
        ],
     ),
       SizedBox(height: 10,) ,
       
     Row(
       children: [
         Container(
                     margin: EdgeInsets.only(right: 35),

           child: Text('الى مدينة',style: TextStyle(fontSize: 15,color: Color.fromRGBO(77, 0, 77, 1),fontWeight: FontWeight.bold)
           )
           ),
       
         Container(
                 margin: EdgeInsets.only(right: 100),

       child: Text('اب ',style: TextStyle(fontSize: 15,color: Color.fromRGBO(0, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ),
        ],
     ), 
     
       SizedBox(height: 10,) ,

         Row(
           children: [
             Container(
                     margin: EdgeInsets.only(right: 35),

       child: Text('موعد الحضور',style: TextStyle(fontSize: 15,color: Color.fromRGBO(77, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ),
        
       
     Container(
                 margin: EdgeInsets.only(right: 70),

       child: Text('12:00pm',style: TextStyle(fontSize: 15,color: Color.fromRGBO(0, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ), 
          ],
         ),
       SizedBox(height: 10,), 
         Row(
           children: [
             Container(
                     margin: EdgeInsets.only(right: 35),

       child: Text('ساعات الانتظار ',style: TextStyle(fontSize: 15,color: Color.fromRGBO(77, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ),
          
       
     Container(
                 margin: EdgeInsets.only(right: 70),

       child: Text('02:00 ',style: TextStyle(fontSize: 15,color: Color.fromRGBO(0, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ), 
        ],
         ),
       SizedBox(height: 10,) ,

         Row(
           children: [
             Container(
                     margin: EdgeInsets.only(right: 35),

       child: Text('موعد الانطلاق ',style: TextStyle(fontSize: 15,color: Color.fromRGBO(77, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ),
         
       
     Container(
                 margin: EdgeInsets.only(right: 70),

       child: Text('02:00pm',style: TextStyle(fontSize: 15,color: Color.fromRGBO(0, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ),
         ],
         ), 
       SizedBox(height: 10,) ,

         Row(
           children: [
             Container(
                     margin: EdgeInsets.only(right: 35),

       child: Text('محطة انطلاق الباص ',style: TextStyle(fontSize: 15,color: Color.fromRGBO(77, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ),
          
       
     Container(
                 margin: EdgeInsets.only(right: 30),

       child: Text(' مكتب ابو سرهد - صنعاء ',style: TextStyle(fontSize: 15,color: Color.fromRGBO(0, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ),  
        ],
         ),
       SizedBox(height: 10,) ,

         Row(
           children: [
             Container(
                     margin: EdgeInsets.only(right: 35),

       child: Text(' محطة وصول الباص',style: TextStyle(fontSize: 15,color: Color.fromRGBO(77, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ),
         
       
     Container(
                 margin: EdgeInsets.only(right: 30),

       child: Text(' مكتب ابو سرهد - اب',style: TextStyle(fontSize: 15,color: Color.fromRGBO(0, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ),
         ],
         ), 
       SizedBox(height: 10,) ,
         Row(
           children: [
             Container(
                     margin: EdgeInsets.only(right: 35),

       child: Text(' سعر التذكرة',style: TextStyle(fontSize: 15,color: Color.fromRGBO(77, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ),
         
       
     Container(
                 margin: EdgeInsets.only(right: 80),

       child: Text('7000 ر.ي ',style: TextStyle(fontSize: 15,color: Color.fromRGBO(0, 0, 77, 1),fontWeight: FontWeight.bold)
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
        side: BorderSide.none,
    ),
            color: Color.fromRGBO(255, 255, 255, 0.5),
shadowColor: Color.fromRGBO(255, 255, 255, 0.6),
elevation: 400,
child: Column(
  children: [
        Center(child: Text("بيانات المسافر",style: TextStyle(fontSize: 20,color: Color.fromRGBO(77, 0, 77, 1),fontWeight: FontWeight.bold),),),
 Row(
   children: [
     
     Container(
                 margin: EdgeInsets.only(right: 35),

       child: Text('اسم المسافر',style: TextStyle(fontSize: 15,color: Color.fromRGBO(77, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ),
         Container(
                 margin: EdgeInsets.only(right: 90),

       child: Text('رقم جواز المسافر',style: TextStyle(fontSize: 15,color: Color.fromRGBO(77, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ),
        ],
 ),
     SizedBox(height: 10,),
      Row(
        children: [
          Container(
                     margin: EdgeInsets.only(right: 35),

           child: Text('محمد ',style: TextStyle(fontSize: 15,color: Color.fromRGBO(0, 0, 77, 1),fontWeight: FontWeight.bold)
           )
           ),
     
         Container(
                 margin: EdgeInsets.only(right: 120),

       child: Text('99877866',style: TextStyle(fontSize: 15,color: Color.fromRGBO(0, 0, 77, 1),fontWeight: FontWeight.bold)
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
        side: BorderSide.none,
    ),
            color: Color.fromRGBO(255, 255, 255, 0.5),
shadowColor: Color.fromRGBO(255, 255, 255, 0.6),
elevation: 400,
child: Column(
  children: [
        Center(child: Text("سياسة الحجز في الشركة",style: TextStyle(fontSize: 20,color: Color.fromRGBO(77, 0, 77, 1),fontWeight: FontWeight.bold),),),
 
     
     
         Padding(
           padding: const EdgeInsets.all(15.0),
           child: Container(
                       margin: EdgeInsets.only(right: 35),

             child: Text('في حالة إلغاء الحجز او التخلف عن السفر لن يتم ارجاع المبلغ المدفوع ,اما في حال اراد المسافر تاجيل سفره يحب علية إعلام المكتب قبل 12 سلعة من تاريخ السفر . الوزن المسموح للمسافر هو 30 كيلو فقط وعليه ان يتابع عفشه عند التحميل وعند التنزيل لان الشركة غير مسوؤله عنها .',style: TextStyle(fontFamily: 'Lobster',fontSize: 17,fontWeight: FontWeight.bold,height: 2,color: Color.fromRGBO(0, 0, 77, 1))
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
        side: BorderSide.none,
    ),
            color: Color.fromRGBO(255, 255, 255, 0.5),
shadowColor: Color.fromRGBO(255, 255, 255, 0.6),
elevation: 400,
child: Column(
  children: [
        Center(child: Text(" بيانات الدفع ",style: TextStyle(fontSize: 20,color: Color.fromRGBO(77, 0, 77, 1),fontWeight: FontWeight.bold),),),
  Row(
   children: [
     
     Container(
                 margin: EdgeInsets.only(right: 35),

       child: Text(' مقر الشركة',style: TextStyle(fontSize: 15,color: Color.fromRGBO(77, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ),
         Container(
                 margin: EdgeInsets.only(right: 30),

       child: Text(' اب - شارع العدين - جوار كلية الهندسة ',style: TextStyle(fontSize: 15,color: Color.fromRGBO(0, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ),
        ],
 ),
     SizedBox(height: 10,),
     
      Row(
        children: [
          Container(
                     margin: EdgeInsets.only(right: 35),

           child: Text('الحساب البنكي ',style: TextStyle(fontSize: 15,color: Color.fromRGBO(77, 0, 77, 1),fontWeight: FontWeight.bold)
           )
           ),
     
         Container(
                 margin: EdgeInsets.only(right: 10),
           padding: const EdgeInsets.all(15.0),

       child: Text('SA5756567676756545777',style: TextStyle(fontSize: 15,color: Color.fromRGBO(0, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ),  
     ],
      ),
      SizedBox(height: 5,),
     
      Row(
        children: [
          Container(
                     margin: EdgeInsets.only(right: 35),

           child: Text('اسم البنك ',style: TextStyle(fontSize: 15,color: Color.fromRGBO(77, 0, 77, 1),fontWeight: FontWeight.bold)
           )
           ),
     
         Container(
                 margin: EdgeInsets.only(right: 35),
           padding: const EdgeInsets.all(15.0),

       child: Text('بنك الكريمي',style: TextStyle(fontSize: 15,color: Color.fromRGBO(0, 0, 77, 1),fontWeight: FontWeight.bold)
       )
       ),  
     ],
      ),
     SizedBox(height: 20,),
          Container(
                     margin: EdgeInsets.only(right: 35),

           child: Text(' طريقة الدفع ',style: TextStyle(fontSize: 15,color: Color.fromRGBO(77, 0, 77, 1),fontWeight: FontWeight.bold)
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

                            });
            },
          ),
          Text('الدفع نقدا',style: TextStyle(fontSize: 15,color: Color.fromRGBO(0, 0, 77, 1)),),
                Radio(
            value: 2,
            groupValue: _radiovalue,
            onChanged: <int>(value){
              setState(() {
                              _radiovalue=value;
                              numberselect=2;
                            });
            },
          ),
          Text('التحويل البنكي',style: TextStyle(fontSize: 15,color: Color.fromRGBO(0, 0, 77, 1)),),
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
    
          RaisedButton(
    color: Color.fromRGBO(77, 0, 77,1),
    textColor:Colors.white, 
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
    ),
    
    onPressed: (){
   setState(() {
       myDialog(); 
      });
     
    },
    child: Text('تأكيد الحجز',style: TextStyle(fontSize: 15)),
    
    
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