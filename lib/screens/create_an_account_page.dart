import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Functions/insert.dart';
import '../main.dart';
import 'dart:io';
import '../screens/settings.dart';
import 'package:image_picker/image_picker.dart';//حق الصور 
import 'package:shared_preferences/shared_preferences.dart';
String cnameimage="";
    String ctypeimage="";
        // المتغيرات التي يتم حفظها
        String shprname="";
        String shprimage="";
        String shprphon_no="";
       bool  create_account=false;
       //-------------------------------//
       Insert s=Insert();
    var cname=TextEditingController();
    var cphone_no=TextEditingController();

 //هنا المتغيرات التي تحفظ في جهاز المستخدم
        savevalues()async{
          if(create_account==true)
     {SharedPreferences prefs=await SharedPreferences.getInstance();
        prefs.setBool("create_account", create_account)  ;
        prefs.setString("shprname", shprname)  ;
        prefs.setString("shprimage", shprimage)  ;
        prefs.setString("shprphon_no", shprphon_no)  ;



     }
     }
     //------------------------------------------------------------------------//
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
    var iD_number=TextEditingController();
          String sendpassword="";
        String sendiD_number="";
    
        
    bool showimagebool=false;
   

    List<String>list_Date=[
  '1965', '1966','1967', '1968','1969', '1970','1971', '1972', '1973', '1974','1975', '1976','1977', '1978','1979', '1980',
   '1965', '1981','1982', '1983','1984', '1985','1986', '1987', '1988', '1989','1990', '1991','1992', '1993','1994', '1995',
   '1965', '1996','1997', '1998','1999', '2000','2001', '2002', '2003', '2004','2005', '2006','2007', '2008','2009'
  ];
  String? birthyear='2000';
  
 //تحويل الصوره الى سلسلة لتخزينها في السرفر 
bool oksaveimage=false;
  String cimage_convert="";//الصوره المحولة
  Future convertimage(File image,String path)async{

   
    List<int> imageBytes=await image.readAsBytes();
       setState(() {
        
    String base64string=base64.encode(imageBytes.cast<int>());
   
    cimage_convert=base64string;
      oksaveimage=true;    
        });
  }
  //دالة استخراج نوع الصوره واسمها
  nameimageandtypy(File image)
  {
    setState(() {
         String path=image.path.toString();
    List<String>part_path=path.split('/');
    String name_type=part_path.last;
    List<String>part_name_type=name_type.split('.');
     cnameimage=part_name_type[0];
     ctypeimage=part_name_type[1];   
        });
  



  }
  //عرض الصوره في الصفحة بعد تأكيد الاختيار
  Widget showimage()
  {
if(showimagebool==true)
   {return Column(
     children: [
       SizedBox(height: 13.h,),
       Container(
          height: 35.h,
width: 110.w,
child:
 Image.file(image,fit: BoxFit.fill,),
        ),
       SizedBox(height: 13.h,),
     ],
   );

  }
  else
  {
 return SizedBox(height: 13.h,);
  }
  }

  //دالة اختيار صوره
 Future getImage(ImageSource scr)async{
final PickedFile=await picker.getImage(source: scr,
  imageQuality: 30);
setState(() {
  if(PickedFile!=null)
  {
    image=File(PickedFile.path);
     final AlertDialog adimage=AlertDialog(
content: Container(
height: 65.h,
width: 90.w,

child:
 Column(
  children: [
    Container(
      height: 45.h,
width: 75.w,
child:
 image==File('')?Text("لم تختر صورة"):Image.file(image,fit: BoxFit.fill,),
    ),
    SizedBox(height: 5.h,),

    Row(
      children: [
        Container(
          width: 25.w,
        
        child:  ElevatedButton(
     style: ElevatedButton.styleFrom(
      primary: secondappcolor,


       shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
    ),
    ),
          child: Center(child: Text("موافق",style: TextStyle(color: Colors.white),)),
          onPressed: (){
   
setState(() {
  showimagebool=true;
        //احول الصوره بهذا الدالة
convertimage(image,image.path.toString());
nameimageandtypy(image);

  
});
 
   Navigator.of(context,rootNavigator: true).pop('dialog');         

          },
        ),
        ),
     
    SizedBox(width: 15.w,),
       Container(
         
      width: 25.w,
   
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
             padding: EdgeInsets.only(left: 210.0),

             child: Text(' إنشاء حساب',style:TextStyle(fontSize: 16.sp,fontFamily: 'Lobster',height: 1.7,color:lightcolor)),
           ),

          ],backgroundColor: secondappcolor,
    
        ),
         body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Card(
          
     shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(color: secondappcolor,width: 0.5.w),
    ),
        color: lightcolor,
          child: SingleChildScrollView(
                    child: Column(
              children: [
                SizedBox(height: 5.h,),
                //العنوان
               Center(
                 child: Text(" حسابي",style:TextStyle(color: secondtextcolor,fontSize: 13.sp,fontFamily: 'Lobster',fontWeight: FontWeight.bold,
        ),
        ),
               ),
                SizedBox(height: 5.h,),  
                // حقل الاسم
               Container(
                 child: TextFormField(
   
     decoration: InputDecoration(
    
         labelText:"الاسم بالكامل",
    
         labelStyle: TextStyle(color: fristtextcolor,fontSize: 12.sp,fontFamily: 'Lobster'),
    
         prefixIcon: Icon(Icons.person,color: secondappcolor,),
    
    enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 0.5.w,color:fristappcolor )
    ),
    
              ),
           

                            
                            //---------------------------------//
    textCapitalization: TextCapitalization.characters,
keyboardType: TextInputType.text,
//استلم القيمة من المستخدم
controller:cname ,
     ),
               ),
              SizedBox(height: 5.h,),
 //  والتاريخ قائمة خيارات             
Container(
  
 
  child: Row(
    children: [
   
    SizedBox(width: 8.w,),
    
      Text('تاريخ الميلاد',style:TextStyle(color: fristtextcolor,fontSize:10.sp,fontFamily: 'Lobster',fontWeight: FontWeight.bold)),
    SizedBox(height: 5.h,),
    SizedBox(width: 8.w,),

 Container( 
          height: 13.h,
    width: 50.w,

    //margin: EdgeInsets.only(left:20.0),
          child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: 0.5.w,color:fristappcolor)
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
  
     //رقم الهاتف
               Container(
                 child: TextField(
    
     decoration: InputDecoration(
    
         labelText:"رقم الهاتف",
    
         labelStyle: TextStyle(color:fristtextcolor,fontSize: 12.sp,fontFamily: 'Lobster'),
    
         prefixIcon: Icon(Icons.phone_android,color: secondappcolor),
    
    enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 0.5.w,color:fristappcolor )
    ),
    
              ), 
    
keyboardType: TextInputType.number,

controller:cphone_no,
     ),
               ),
SizedBox(height: 5.h,),
     //رقم الهوية
               Container(
                 child: TextField(
  
     decoration: InputDecoration(
    
         labelText:"رقم الهوية",
    
         labelStyle: TextStyle(color:fristtextcolor,fontSize: 12.sp,fontFamily: 'Lobster'),
    
         prefixIcon: Icon(Icons.card_membership,color: secondappcolor,),
    
    enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 0.5.w,color:fristappcolor )
    ),
    
              ), 
    
keyboardType: TextInputType.number,

controller:iD_number,
     ),
               ),
              
               SizedBox(height: 5.h,),
                //حقل كلمة المرور
               Container(
                 child: TextField(
obscureText: passwordicon,
   obscuringCharacter: "*", 
     decoration: InputDecoration(
    
         labelText:"كلمة المرور",
    
         labelStyle: TextStyle(color:fristtextcolor,fontSize: 12.sp,fontFamily: 'Lobster'),
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
            borderSide: BorderSide(width: 0.5.w,color:fristappcolor)
    ),
    
              ), 
    
keyboardType: TextInputType.visiblePassword,

controller:password,
     ),
               ),
      SizedBox(height: 5.h,),
      //حقل تأكيد كلمة المرور
              Container(
                 child: TextField(
obscureText: passwordicon1,
   obscuringCharacter: "*", 
    
     decoration: InputDecoration(
    
         labelText:"تأكيد كلمة المرور ",
    
        labelStyle: TextStyle(color:fristtextcolor,fontSize: 12.sp,fontFamily: 'Lobster'),
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
            borderSide: BorderSide(width: 0.5.w,color:fristappcolor )
    ),
    
              ), 
    
keyboardType: TextInputType.visiblePassword,
/*النص محمي
obscureText: passwordicon1,*/
controller:passwoord1,
     ),
               ),
                SizedBox(height: 5.h,),
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
height:25.h,
child: Column(
  children: [
    Divider(color: Colors.black,),
    Container(
      width: 150.w,
    
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
SizedBox(width: 5.w,),
          Text("المعرض",style: TextStyle(color: Colors.white),),
        ],
      ),
   
      onPressed: (){
   
getImage(ImageSource.gallery);
 
   Navigator.of(context,rootNavigator: true).pop('dialog');         
        

      },
    ),
    ),

       Container(
      width: 150.w,
    
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
          SizedBox(width: 5.w,),
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
        Text('تحميل صورة اثبات هوية ',style: TextStyle(fontSize: 9.sp,color: Colors.white)),

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
  || cname.text.isEmpty||iD_number.text.isEmpty||cphone_no.text.isEmpty||image==File(''))  
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
      if(oksaveimage==true&&cimage_convert=="")
      {
          ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         content: Text(" إنتظر قليلا"),
         behavior: SnackBarBehavior.floating,
       )
     );
       
               
    }
    else
    {
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         content: Text("إضغط تم لاكمال العملية"),
         behavior: SnackBarBehavior.floating,
       )
     ); 
  final AlertDialog ok=AlertDialog(
title:Container(
alignment: Alignment.center,
  child: Column(
    children: [
      Text("تم إنشاء الحساب بنجاح",style: TextStyle(color: secondtextcolor,fontSize: 15.sp,fontWeight: FontWeight.bold),),
     Container(
    
    height: 10.h,
    
    child:Icon(Icons.add_task,color:fristappcolor,size: 50,)
    
    
    
    ),

    Center(
      child: Container(
          width: 15.w,
          height: 5.h,
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

// حفظ البيانات الخاصة بالعميل داخل جهازه من اجل ارساللها عند تاكيد عملية الحجز
 create_account=true;
shprname=cname.text;
shprphon_no=cphone_no.text;
shprimage=cimage_convert;


            savevalues();
            sendiD_number=iD_number.text;
            sendpassword=password.text;
      //-----------------------------------------------------------------------//
            //ارسال البيانات الى السرفر
            s.SendDataclient(shprname,sendpassword,shprphon_no,sendiD_number,birthyear,shprimage);

  });
      // غلق نافذة الرسالة 
   Navigator.of(context, rootNavigator: true).pop('ok');         

//الانتقال الى الصفحة الرئسية
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (_){
      
        
 return  MyHomePage();


}  
),
    );
          

            },
          ),
          ),
    ), ],
  )
  ) ,

  

       

      );
         showDialog(builder: (context) => ok, context:context);
               
     




    }
   } });   
    },
    child: Text('إنشاء حساب ',style: TextStyle(fontSize: 10.sp,color: Colors.white,fontWeight: FontWeight.bold)),
    
    
    
    ),
    
  ],
       crossAxisAlignment: CrossAxisAlignment.stretch, 
    ),
), 
SizedBox(height: 6.h,), ],
                    ),
          ),
        ),
      ),
    );
  }
}