import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';//اتجاة الكتابة
import 'package:intl/intl.dart';//تنسيق التاريخ
import '../main.dart';
import 'dart:io';
//import 'package:image_picker/image_picker.dart';//حق الصور 
/*
<key>NSPhotoLibraryUsageDescription</key>
<string>Allow this app to access your photos</string>
<key>NSMicrophoneUsageDescription</key>
<string>Allow access to microphone</string>
        android:requestLegacyExternalStorage="true"
        image_picker: ^0.8.5+3 */
class Create_account extends StatefulWidget {
  @override
  _Create_accountState createState() => _Create_accountState();
}

class _Create_accountState extends State<Create_account> {
  @override
  Widget build(BuildContext context) {
    File _image;
    //final picker=ImagePicker();
    var name=TextEditingController();
    var ID_number=TextEditingController();
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
  //String _selectedDate="null";
  //DateTime _selectedDate1=DateTime.now();
  /*عرض التاريخ
  void date_picker()
  {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1965),
      lastDate: DateTime(2008),
      currentDate:DateTime.now(),
    ).then((date){
      if(date==null){return;}
      setState(() {
_selectedDate1=date;
              _selectedDate=date.toString();
            });});}
            Future getImage(ImageSource scr)async{
final PickedFile=await picker.getImage(source: scr);
setState(() {
  if(PickedFile!=null)
  {
    _image=File(PickedFile.path);
  }else
  {
    print('لم تختر صورة');
  }
});
            }*/

    return 
    Scaffold(
       appBar: AppBar(
         actions: 
          [ Padding(
             padding: const EdgeInsets.only(left: 250),

             child: Text(" بيانات مسافر",style:TextStyle(fontSize: 22,fontFamily: 'Lobster',height: 1.7)),
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
                 child: Text("بيانات مسافر",style:TextStyle(color: Color.fromRGBO(0,0 ,77,0.9),fontSize: 25,fontFamily: 'Lobster',height:2,fontWeight: FontWeight.bold,
        ),
        ),
               ),
               SizedBox(height: 25,),
                // حقل الاسم
               Container(
                 child: TextField(
   
     decoration: InputDecoration(
    
         labelText:"الاسم بالكامل",
    
         labelStyle: TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster'),
    
         prefixIcon: Icon(Icons.person,color: Color.fromRGBO(77, 0, 77,1),),
    
    enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 2,color:Color.fromRGBO(77, 0, 77,1) )
    ),
    
              ), 
    
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
       final AlertDialog adimage=AlertDialog(
content: Container(
height: 150,
//child: _image==null?Text("لم تختر صورة"):Image.file(_image),
child: Text("اختر "),
 ),
       );
      final AlertDialog ad=AlertDialog(
title:Text("اختر الصور من ") ,
content: Container(
height: 150,
child: Column(
  children: [
    Divider(color: Colors.black,),
    Container(
      width: 300,
    color: Color.fromRGBO(77, 0, 77,1),
    child: ListTile(
      leading: Icon(Icons.image),
      title: Text("المعرض"),
      onTap: (){
  Navigator.of(context).pop();
 showAboutDialog(context:context ,children: [adimage]);

//getImage(ImageSource.gallery);
        

      },
    ),
    ),
    SizedBox(height: 10,),
       Container(
      width: 300,
    color: Color.fromRGBO(77, 0, 77,1),
    child: ListTile(
      leading: Icon(Icons.add_a_photo),
      title: Text("الكاميرا"),
      onTap: (){
//getImage(ImageSource.camera);
        Navigator.of(context).pop();
 showAboutDialog(context:context ,children: [adimage]);

      },
    ),
    ),  ],
)
),

      );
               

      showAboutDialog(context:context ,children: [ad]);
// showDialog(context: context, builder: (BuildContext context) {_},child:ad);
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
                SizedBox(height: 25,),
               //زر انشاء حساب
             Container(child: Column(
  children: [
          RaisedButton(
    disabledColor: Color.fromRGBO(77, 0, 77,1),
    disabledTextColor:Colors.white, 
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
    ),
    
    onPressed: null,
    child: Text(' إرسال ',style: TextStyle(fontSize: 15)),
    
    
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