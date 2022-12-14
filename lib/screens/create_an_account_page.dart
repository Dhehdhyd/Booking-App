import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';//اتجاة الكتابة
import 'package:intl/intl.dart';//تنسيق التاريخ
import '../Functions/insert.dart';
import '../main.dart';
import 'dart:io';
import '../screens/settings.dart';
import 'package:image_picker/image_picker.dart';//حق الصور 
import 'package:shared_preferences/shared_preferences.dart';
/*
<key>NSPhotoLibraryUsageDescription</key>
<string>Allow this app to access your photos</string>
<key>NSMicrophoneUsageDescription</key>
<string>Allow access to microphone</string>
        android:requestLegacyExternalStorage="true"
        image_picker: ^0.8.5+3 */
        // المتغيرات التي يتم حفظها
        String shprname="";
        String shprimage="";
        String shprphon_no="";
       bool  create_account=false;
       //-------------------------------//
       Insert s=Insert();
    var cname=TextEditingController();

class Mycreate_account extends StatefulWidget {
  @override
  _Mycreate_accountState createState() => _Mycreate_accountState();
}

class _Mycreate_accountState extends State<Mycreate_account> {
   File image=File('');
    final picker=ImagePicker();
    bool passwordicon=true;
     bool passwordicon1=true;
    var password=TextEditingController();
    var passwoord1=TextEditingController();
    var phone_no=TextEditingController();
    var iD_number=TextEditingController();
  
    bool showimagebool=false;
    //هنا المتغيرات التي تحفظ في جهاز المستخدم
        _savevalues()async{
          if(create_account==true)
     {SharedPreferences prefs=await SharedPreferences.getInstance();
        prefs.setBool("create_account", create_account)  ;
        prefs.setString("shprname", shprname)  ;
        prefs.setString("shprimage", shprimage)  ;
        prefs.setString("shprimage", shprphon_no)  ;



     }
     }
     //------------------------------------------------------------------------//
   /* List<String>list_gender=[
  'أنثى', 'ذكر',
  ];
  String? selectedItem='ذكر';*/
    List<String>list_Date=[
  '1965', '1966','1967', '1968','1969', '1970','1971', '1972', '1973', '1974','1975', '1976','1977', '1978','1979', '1980',
   '1965', '1981','1982', '1983','1984', '1985','1986', '1987', '1988', '1989','1990', '1991','1992', '1993','1994', '1995',
   '1965', '1996','1997', '1998','1999', '2000','2001', '2002', '2003', '2004','2005', '2006','2007', '2008','2009'
  ];
  String? birthyear='2000';
  String cimage_convert="";//الصوره المحولة
  //تحويل الصوره الى سلسلة لتخزينها في السرفر 
  Future convertimage(File image)async{
    Uint8List imageBytes=await image.readAsBytes();
    String base64string=base64.encode(imageBytes);
    cimage_convert=base64string;
  }
  //عرض الصوره في الصفحة بعد تأكيد الاختيار
  Widget showimage()
  {
if(showimagebool==true)
   {return Column(
     children: [
       SizedBox(height: 25,),
       Container(
          height: 150,
width: 250,
child:
 Image.file(image,fit: BoxFit.fill,),
        ),
       SizedBox(height: 25,),
     ],
   );
   //احول الصوره بهذا الدالة
convertimage(image);
  }
  else
  {
 return SizedBox(height: 25,);
  }
  }

  //دالة اختيار صوره
 Future getImage(ImageSource scr)async{
final PickedFile=await picker.getImage(source: scr);
setState(() {
  if(PickedFile!=null)
  {
    image=File(PickedFile.path);

     final AlertDialog adimage=AlertDialog(
content: Container(
height: 250,
width: 300,

child:
 Column(
  children: [
    Container(
      height: 150,
width: 250,
child:
 image==File('')?Text("لم تختر صورة"):Image.file(image,fit: BoxFit.fill,),
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
          child: Center(child: Text("موافق",style: TextStyle(color: Colors.white),)),
          onPressed: (){
   
setState(() {
  showimagebool=true;
  
});
 
   Navigator.of(context,rootNavigator: true).pop('dialog');         

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
      child: Center(child: Text("الغاء",style: TextStyle(color: Colors.white),)),
      onPressed: (){
        setState(() {
  showimagebool=false;
  
});
   Navigator.of(context,rootNavigator: true).pop('dialog');         
           

      },
    ),
    ), 
     ],
    ),
     ],
)
),


 
       );
       showDialog(builder: (context) => adimage, context:context,barrierDismissible: false);

  }else
  {
    print('لم تختر صورة');
  }
});
            } 
  @override
  Widget build(BuildContext context) {
     
 
    return 
    Scaffold(
       appBar: AppBar(
         actions: 
          [ Padding(
             padding: const EdgeInsets.only(left: 250),

             child: Text("انشاء حساب ",style:TextStyle(fontSize: 22,fontFamily: 'Lobster',height: 1.7,color: Colors.white)),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
     shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(color: secondappcolor,width: 2.5),
    ),
        color: lightcolor,
          child: SingleChildScrollView(
                    child: Column(
              children: [
                
                //العنوان
               Center(
                 child: Text(" حسابي",style:TextStyle(color:secondtextcolor,fontSize: 25,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
        ),
        ),
               ),
               SizedBox(height: 25,),
                // حقل الاسم
               Container(
                 child: TextFormField(
   
     decoration: InputDecoration(
    
         labelText:"الاسم بالكامل",
    
         labelStyle: TextStyle(color: fristtextcolor,fontSize: 18,fontFamily: 'Lobster'),
    
         prefixIcon: Icon(Icons.person,color: secondappcolor,),
    
    enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 2,color:fristappcolor )
    ),
    
              ),
           

                            
                            //---------------------------------//
    textCapitalization: TextCapitalization.characters,
keyboardType: TextInputType.text,
//استلم القيمة من المستخدم
controller:cname ,
     ),
               ),
              SizedBox(height: 25,),
 // الجنس والتاريخ قائمة خيارات             
Container(
  
 
  child: Row(
    children: [
     /* SizedBox(width: 2,),
      Text(' نوع الجنس',style:TextStyle(color: secondtextcolor,fontSize:15,fontFamily: 'Lobster',fontWeight: FontWeight.bold)),
      SizedBox(width: 2,),
      Container( 
          height: 70,
  width: 80,
 // margin: EdgeInsets.only(left:200.0),
          child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: 2,color:fristappcolor )
            )
          ),
                  isExpanded: true,
                  value:selectedItem,
                  onChanged: (newValue){
                    setState(() {
                              selectedItem = newValue;
                            });
                  },
                  items: list_gender.map((item)=> DropdownMenuItem(
          value:item,
          child: Text(item),
) 
                  ).toList(),
                ),
      ),
       */
     SizedBox(width: 15,),
      Text('تاريخ الميلاد',style:TextStyle(color: fristtextcolor,fontSize:18,fontFamily: 'Lobster',fontWeight: FontWeight.bold)),

  SizedBox(width: 25,),
 Container( 
          height: 70,
    width: 223,
    //margin: EdgeInsets.only(left:20.0),
          child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: 2,color:fristappcolor)
            )
          ),
                  isExpanded: true,
                  value:birthyear,
                  onChanged: (newValue){
                    setState(() {
                              birthyear = newValue;
                            });
                  },
                  items: list_Date.map((item)=> DropdownMenuItem(
          value:item,
         child: Text(item,style: TextStyle(color: thridtextcolor),),
) 
                  ).toList(),
                ),
        ),

    ],
  ),
    ),
    /*
               SizedBox(height: 25,),
            
               //حقل المدينة
               Container(
                 child: TextFormField(
    
     decoration: InputDecoration(
    
         labelText:"المدينة التي تسكن فيها",
    
         labelStyle: TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster'),
    
         prefixIcon: Icon(Icons.location_city_rounded,color: secondappcolor,),
    
    enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 2,color:fristappcolor )
    ),
    
              ), 
    
keyboardType: TextInputType.text,

//controller:city ,
     ),
               ),
     SizedBox(height: 25,),*/
     //رقم الهاتف
               Container(
                 child: TextField(
    
     decoration: InputDecoration(
    
         labelText:"رقم الهاتف",
    
         labelStyle: TextStyle(color:fristtextcolor,fontSize: 18,fontFamily: 'Lobster'),
    
         prefixIcon: Icon(Icons.phone_android,color: secondappcolor),
    
    enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 2,color:fristappcolor )
    ),
    
              ), 
    
keyboardType: TextInputType.number,

controller:phone_no,
     ),
               ),
     SizedBox(height: 25,),
     //رقم الهوية
               Container(
                 child: TextField(
  
     decoration: InputDecoration(
    
         labelText:"رقم الهوية",
    
         labelStyle: TextStyle(color:fristtextcolor,fontSize: 18,fontFamily: 'Lobster'),
    
         prefixIcon: Icon(Icons.card_membership,color: secondappcolor,),
    
    enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 2,color:fristappcolor )
    ),
    
              ), 
    
keyboardType: TextInputType.number,

controller:iD_number,
     ),
               ),
              
               SizedBox(height: 25,),
                //حقل كلمة المرور
               Container(
                 child: TextField(
obscureText: passwordicon,
   obscuringCharacter: "*", 
     decoration: InputDecoration(
    
         labelText:"كلمة المرور",
    
         labelStyle: TextStyle(color:fristtextcolor,fontSize: 18,fontFamily: 'Lobster'),
    //هل تريد رؤية الكلمة او لا
        suffixIcon: IconButton(
         onPressed:(){setState(() {
                     if( passwordicon)
                 { passwordicon=false;}
                     else{passwordicon=true;}
                      
                    });
                    },icon:Icon(passwordicon?Icons.visibility:Icons.visibility_off,color:secondappcolor,),
                    ),
                  
    
    enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 2,color:fristappcolor)
    ),
    
              ), 
    
keyboardType: TextInputType.visiblePassword,

controller:password,
     ),
               ),
      SizedBox(height: 25,),
      //حقل تأكيد كلمة المرور
              Container(
                 child: TextField(
obscureText: passwordicon1,
   obscuringCharacter: "*", 
    
     decoration: InputDecoration(
    
         labelText:"تأكيد كلمة المرور ",
    
        labelStyle: TextStyle(color:fristtextcolor,fontSize: 18,fontFamily: 'Lobster'),
    //هل تريد رؤية الكلمة او لا
         suffixIcon: IconButton(
         onPressed:(){setState(() {
                     if( passwordicon1)
                 { passwordicon1=false;}
                     else{passwordicon1=true;}
                      
                    });
                    },icon:Icon(passwordicon1?Icons.visibility:Icons.visibility_off,color: secondappcolor,),
                    ),
                     
    
    enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 2,color:fristappcolor )
    ),
    
              ), 
    
keyboardType: TextInputType.visiblePassword,
/*النص محمي
obscureText: passwordicon1,*/
controller:passwoord1,
     ),
               ),
                SizedBox(height: 25,),
               //زر عرض صورة
             Container(child: Row(
  children: [
  

          Expanded(
                      child: Container(
              
              child:ElevatedButton(
     style: ElevatedButton.styleFrom(
      primary: secondappcolor,
 
textStyle:TextStyle(color:Colors.white,),
       shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
    ),
    ),
    
    onPressed:(){
    
    final AlertDialog ad=AlertDialog(
title:Text("اختر الصور من ") ,
content: Container(
height: 150,
child: Column(
  children: [
    Divider(color: Colors.black,),
    Container(
      width: 300,
    
    child:  ElevatedButton(
     style: ElevatedButton.styleFrom(
      primary: fristappcolor,


       shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
    ),
    ),
      child: Row(
        children: [
          Icon(Icons.image,color: secondappcolor),
SizedBox(width: 10,),
          Text("المعرض",style: TextStyle(color: Colors.white),),
        ],
      ),
   
      onPressed: (){
   
getImage(ImageSource.gallery);
 
   Navigator.of(context,rootNavigator: true).pop('dialog');         
        

      },
    ),
    ),
    SizedBox(height: 10,),
       Container(
      width: 300,
    
    child: ElevatedButton(
     style: ElevatedButton.styleFrom(
      primary: fristappcolor,


       shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
    ),
    ),
      child: Row(
        children: [
          Icon(Icons.add_a_photo,color: secondappcolor),
          SizedBox(width: 10,),
          Text("الكاميرا",style: TextStyle(color: Colors.white),),
        ],
      ),
      onPressed: (){
      
getImage(ImageSource.camera);
   Navigator.of(context,rootNavigator: true).pop('dialog');         

      },
    ),
    ),  ],
)
),

      );
               

         showDialog(builder: (context) => ad, context:context);
     

    } ,
    child: Row(
      children: [
        Text('تحميل صورة اثبات هوية ',style: TextStyle(fontSize: 13,color: Colors.white)),
        SizedBox(width: 150,),
     Icon(Icons.add_a_photo,color: lightcolor,), ],
    ),
    
    
    ),
            ),
          ),
      
    
    
  ],
       
    ),
),   

               
                showimage(),
               //زر انشاء حساب
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
  if(passwoord1.text.isEmpty||password.text.isEmpty||passwoord1.text!=password.text
  || cname.text.isEmpty||iD_number.text.isEmpty||phone_no.text.isEmpty||image==File(''))  
  { 
        ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         content: Text(" كلمة المرور خاطئةاو احد الحقول فارغة"),
         behavior: SnackBarBehavior.floating,
       )
     );     
      }      
   
    else
    {
  final AlertDialog ok=AlertDialog(
title:Container(
alignment: Alignment.center,
  child: Column(
    children: [
      Text("تم إنشاء الحساب بنجاح",style: TextStyle(color: secondtextcolor,fontSize: 20,fontWeight: FontWeight.bold),),
     Container(
    
    height: 50,
    
    child:Icon(Icons.add_task,color:fristappcolor,size: 50,)
    
    
    
    ),
    SizedBox(height: 8,),
    Center(
      child: Container(
            width: 100,
          height: 35,
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
            create_account=true;
// حفظ البيانات الخاصة بالعميل داخل جهازه من اجل ارساللها عند تاكيد عملية الحجز
shprname=cname.text;
shprphon_no=phone_no.text;
shprimage=cimage_convert;

            _savevalues();
      //-----------------------------------------------------------------------//
            //ارسال البيانات الى السرفر
            s.SendDataclient(cname,password,phone_no,iD_number,birthyear,cimage_convert);

  });
      // غلق نافذة الرسالة 
   Navigator.of(context, rootNavigator: true).pop('ok');         

//الانتقال الى الصفحة الرئسية
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
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
         showDialog(builder: (context) => ok, context:context);
               
     




   
   } });   
    },
    child: Text('إنشاء حساب ',style: TextStyle(fontSize: 15,color: Colors.white)),
    
    
    
    ),
    
  ],
       crossAxisAlignment: CrossAxisAlignment.stretch, 
    ),
), 
SizedBox(height: 25,), ],
                    ),
          ),
        ),
      ),
    );
  }
}