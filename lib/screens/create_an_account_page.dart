import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';//اتجاة الكتابة
import 'package:intl/intl.dart';//تنسيق التاريخ
import '../main.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';//حق الصور 
/*
<key>NSPhotoLibraryUsageDescription</key>
<string>Allow this app to access your photos</string>
<key>NSMicrophoneUsageDescription</key>
<string>Allow access to microphone</string>
        android:requestLegacyExternalStorage="true"
        image_picker: ^0.8.5+3 */
class Mycreate_account extends StatefulWidget {
  @override
  _Mycreate_accountState createState() => _Mycreate_accountState();
}

class _Mycreate_accountState extends State<Mycreate_account> {
   File _image=File('');
    final picker=ImagePicker();
    bool passwordicon=true;
     bool passwordicon1=true;
    var name=TextEditingController();
    var city=TextEditingController();
    var password=TextEditingController();
    var passwoord1=TextEditingController();
    var phone_no=TextEditingController();
    var ID_number=TextEditingController();
    bool showimagebool=false;
    List<String>list_gender=[
  'أنثى', 'ذكر',
  ];
  String? selectedItem='ذكر';
    List<String>list_Date=[
  '1965', '1966','1967', '1968','1969', '1970','1971', '1972', '1973', '1974','1975', '1976','1977', '1978','1979', '1980',
   '1965', '1981','1982', '1983','1984', '1985','1986', '1987', '1988', '1989','1990', '1991','1992', '1993','1994', '1995',
   '1965', '1996','1997', '1998','1999', '2000','2001', '2002', '2003', '2004','2005', '2006','2007', '2008','2009'
  ];
  String? selectedItem1='2000';
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
 Image.file(_image,fit: BoxFit.fill,),
        ),
       SizedBox(height: 25,),
     ],
   );
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
    _image=File(PickedFile.path);
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
 _image==File('')?Text("لم تختر صورة"):Image.file(_image,fit: BoxFit.fill,),
    ),
    SizedBox(height: 20,),

    Row(
      children: [
        Container(
          width: 100,
        
        child: RaisedButton(
          color: Color.fromRGBO(77, 0, 77,1),
         shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
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
   
    child: RaisedButton(
       color: Color.fromRGBO(77, 0, 77,1),
       shape:  RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(40.0)
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

             child: Text("انشاء حساب ",style:TextStyle(fontSize: 22,fontFamily: 'Lobster',height: 1.7)),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          
          color: Color.fromRGBO(255, 255, 255, 0.5),
shadowColor: Color.fromRGBO(77, 0, 77, 0.5),
elevation: 20,
          child: SingleChildScrollView(
                    child: Column(
              children: [
                
                //العنوان
               Center(
                 child: Text(" حسابي",style:TextStyle(color: Color.fromRGBO(0,0 ,77,0.9),fontSize: 25,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
        ),
        ),
               ),
               SizedBox(height: 25,),
                // حقل الاسم
               Container(
                 child: TextFormField(
   
     decoration: InputDecoration(
    
         labelText:"الاسم بالكامل",
    
         labelStyle: TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster'),
    
         prefixIcon: Icon(Icons.person,color: Color.fromRGBO(77, 0, 77,1),),
    
    enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 2,color:Color.fromRGBO(77, 0, 77,1) )
    ),
    
              ), 
    textCapitalization: TextCapitalization.characters,
keyboardType: TextInputType.text,
//استلم القيمة من المستخدم
//controller:name ,
     ),
               ),
              SizedBox(height: 25,),
 // الجنس والتاريخ قائمة خيارات             
Container(
  
 
  child: Row(
    children: [
      SizedBox(width: 2,),
      Text(' نوع الجنس',style:TextStyle(color: Color.fromRGBO(77,0 , 77,1),fontSize:15,fontFamily: 'Lobster',fontWeight: FontWeight.bold)),
      SizedBox(width: 2,),
      Container( 
          height: 70,
  width: 80,
 // margin: EdgeInsets.only(left:200.0),
          child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: 2,color:Color.fromRGBO(77, 0, 77,1) )
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
       
     SizedBox(width: 8,),
      Text('تاريخ الميلاد',style:TextStyle(color: Color.fromRGBO(77,0 , 77,1),fontSize:15,fontFamily: 'Lobster',fontWeight: FontWeight.bold)),

  SizedBox(width: 2,),
 Container( 
          height: 70,
    width: 100,
    //margin: EdgeInsets.only(left:20.0),
          child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: 2,color:Color.fromRGBO(77, 0, 77,1) )
            )
          ),
                  isExpanded: true,
                  value:selectedItem1,
                  onChanged: (newValue){
                    setState(() {
                              selectedItem1 = newValue;
                            });
                  },
                  items: list_Date.map((item)=> DropdownMenuItem(
          value:item,
          child: Text(item),
) 
                  ).toList(),
                ),
        ),

    ],
  ),
    ),
               SizedBox(height: 25,),
            
               //حقل المدينة
               Container(
                 child: TextFormField(
    
     decoration: InputDecoration(
    
         labelText:"المدينة التي تسكن فيها",
    
         labelStyle: TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster'),
    
         prefixIcon: Icon(Icons.location_city_rounded,color: Color.fromRGBO(77, 0, 77,1),),
    
    enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 2,color:Color.fromRGBO(77, 0, 77,1) )
    ),
    
              ), 
    
keyboardType: TextInputType.text,

//controller:city ,
     ),
               ),
     SizedBox(height: 25,),
     //رقم الهاتف
               Container(
                 child: TextField(
    
     decoration: InputDecoration(
    
         labelText:"رقم الهاتف",
    
         labelStyle: TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster'),
    
         prefixIcon: Icon(Icons.phone_android,color: Color.fromRGBO(77, 0, 77,1),),
    
    enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 2,color:Color.fromRGBO(77, 0, 77,1) )
    ),
    
              ), 
    
keyboardType: TextInputType.number,

//controller:phone_no,
     ),
               ),
     SizedBox(height: 25,),
     //رقم الهوية
               Container(
                 child: TextField(
  
     decoration: InputDecoration(
    
         labelText:"رقم الهوية",
    
         labelStyle: TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster'),
    
         prefixIcon: Icon(Icons.card_membership,color: Color.fromRGBO(77, 0, 77,1),),
    
    enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 2,color:Color.fromRGBO(77, 0, 77,1) )
    ),
    
              ), 
    
keyboardType: TextInputType.number,

//controller:ID_number,
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
    
         labelStyle: TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster'),
    //هل تريد رؤية الكلمة او لا
        suffixIcon: IconButton(
         onPressed:(){setState(() {
                     if( passwordicon)
                 { passwordicon=false;}
                     else{passwordicon=true;}
                      
                    });
                    },icon:Icon(passwordicon?Icons.visibility:Icons.visibility_off,color: Color.fromRGBO(77, 0, 77,1),),
                    ),
                  
    
    enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 2,color:Color.fromRGBO(77, 0, 77,1) )
    ),
    
              ), 
    
keyboardType: TextInputType.visiblePassword,

//controller:password,
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
    
        labelStyle: TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster'),
    //هل تريد رؤية الكلمة او لا
         suffixIcon: IconButton(
         onPressed:(){setState(() {
                     if( passwordicon1)
                 { passwordicon1=false;}
                     else{passwordicon1=true;}
                      
                    });
                    },icon:Icon(passwordicon1?Icons.visibility:Icons.visibility_off,color: Color.fromRGBO(77, 0, 77,1),),
                    ),
                     
    
    enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 2,color:Color.fromRGBO(77, 0, 77,1) )
    ),
    
              ), 
    
keyboardType: TextInputType.visiblePassword,
/*النص محمي
obscureText: passwordicon1,*/
//controller:passwoord1,
     ),
               ),
                SizedBox(height: 25,),
               //زر عرض صورة
             Container(child: Row(
  children: [
  

          Expanded(
                      child: Container(
              
              child: RaisedButton(
    color: Color.fromRGBO(77, 0, 77,1),
    textColor:Colors.white, 
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
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
    
    child: RaisedButton(
    color: Color.fromRGBO(77, 0, 77,1),
      child: Row(
        children: [
          Icon(Icons.image,color: Color.fromRGBO(0, 0, 77,1),),
SizedBox(width: 10,),
          Text("المعرض",style: TextStyle(color: Colors.white),),
        ],
      ),
       shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
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
    
    child: RaisedButton(
    color: Color.fromRGBO(77, 0, 77,1),
       shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
    ),
      child: Row(
        children: [
          Icon(Icons.add_a_photo,color: Color.fromRGBO(0, 0, 77,1),),
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
        Text('تحميل صورة اثبات هوية ',style: TextStyle(fontSize: 13)),
        SizedBox(width: 150,),
     Icon(Icons.add_a_photo), ],
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
          RaisedButton(
    color: Color.fromRGBO(77, 0, 77,1),
    textColor:Colors.white, 
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
    ),
    
    onPressed: (){
      
        final AlertDialog ok=AlertDialog(
title:Container(
alignment: Alignment.center,
  child: Text("تم إنشاء الحساب بنجاح",style: TextStyle(color: Color.fromRGBO(77, 0, 77, 1),fontSize: 20,fontWeight: FontWeight.bold),)) ,
content: Container(
height: 50,
child:Icon(Icons.add_task,color: Colors.green,size: 50,)

),
      );
               

         showDialog(builder: (context) => ok, context:context);
    },
    child: Text('إنشاء حساب ',style: TextStyle(fontSize: 15)),
    
    
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