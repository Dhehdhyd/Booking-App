import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Functions/fetch.dart';
import '../screens/about_the_application.dart';
import '../screens/create_an_account_page.dart';
import '../screens/help_and_support.dart';
import '../screens/modifly_my_account_data.dart';
import '../screens/settings.dart';
//القائمة المنسدلة
  
List<dynamic>client=[];
class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}
String sendpasswordforupdate="";
class _AppDrawerState extends State<AppDrawer> {
Fetch f=Fetch();
 var passwordforupdate=TextEditingController();
 
  // الانتقال الى الفيديو اليوتيوب
  final Uri _url = Uri.parse('https://youtu.be/XjeRoSFGg2s');
  launchurl(String url)async{
    if(await canLaunch(url)){
      await launch(url);

    }
    else
    {
      throw 'could not lanuch $url';
    }
  }

  
  // الانتقال بين الصفحات
   void select_page(BuildContext ctx,int index_page)
  {
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (_){
      
        
 return index_page==1?Modifly_my_account_data():index_page==2?Settingpage():index_page==3?About_the_application():index_page==4?Help_and_support():Mycreate_account();


}  ),
    );
     }
     //يختبر هل الشخص يملك حساب او لا 

     modifly(){
       
        if(create_account==false)
     { 
       final AlertDialog booking=AlertDialog(
title:Container(
alignment: Alignment.center,
  child: Column(
    children: [
      Row(
        children: [
            Icon(Icons.warning_sharp,color: fristappcolor,size: 40,),
          SizedBox(width: 4.w,),
          Text("ارجاء إنشاء حساب لك في التطبيق  ",style: TextStyle(color:secondappcolor,fontSize: 10.sp,fontWeight: FontWeight.bold),),
        ],
      ),
     SizedBox(height: 5.h,),

    Row(
      children: [
        Container(
          width: 30.w,
        
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
       select_page(context, 5);
   Navigator.of(context,rootNavigator: true).pop('booking');   
      });
        

          },
        ),
        ),
     
    SizedBox(width: 2.w,),
       Container(
         
      width: 30.w,
   
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

     setState(() {
final AlertDialog passwordshow=AlertDialog(
title:Container(
alignment: Alignment.center,
  child: Column(
    children: [
      Row(
        children: [
            Icon(Icons.warning_sharp,color: fristappcolor,size: 40,),
          SizedBox(width: 4.w,),
          Text("ادخل كلمة المرور الخاصة بك",style: TextStyle(color:secondappcolor,fontSize: 10.sp,fontWeight: FontWeight.bold),),
        ],
      ),
     SizedBox(height: 2.h,),

    Column(
      children: [
        //حقل كلمة المرور
       Container(
                 child: TextField(

     decoration: InputDecoration(
    
         labelText:"كلمة المرور",
    
         labelStyle: TextStyle(color:fristtextcolor,fontSize: 10.sp,fontFamily: 'Lobster'),
   
                  
    
    enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 1.w,color:fristappcolor )
    ),
    
              ), 
    
keyboardType: TextInputType.text,

controller:passwordforupdate,
     ),
               ),
     
    SizedBox(height: 3.h,),
       Container(
         
      width: 50.w,
   
    child: ElevatedButton(
     style: ElevatedButton.styleFrom(
      primary: secondappcolor,
 
       shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
    ),
    ), // استدعي دالة جلب بيانات العميل مع ارسال كلمة المرور المدخله اذا الكلمة صحيحة استرجعها لو خطا اظهر رسالة

      child: Center(child: Text("تحقق",style: TextStyle(color: Colors.white),)),
      onPressed: (){
        setState(() {
                sendpasswordforupdate=passwordforupdate.text;  
                });
 

              f.fetchclient(sendpasswordforupdate).then((Value){
               setState(() {




   
if([(Value![0])].isNotEmpty )  
  {
     client=[(Value[0])];
     select_page(context, 1);     
   Navigator.of(context,rootNavigator: true).pop('passwordshow');       
   
   
  }
  else
  {
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         content: Text("كلمة المرور خاطئة حاول مجددا"),
         behavior: SnackBarBehavior.floating,
       )
     );    
  } 
  }

);  
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
               

         showDialog(builder: (context) => passwordshow, context:context);       

}); 

    } 
     }
  @override
  Widget build(BuildContext context) {
    return
Container(
        alignment: Alignment.topLeft,
        child: Drawer(
child: ListView(children: [
  Container( height: 6.h,      
  child: Center(
    child: Text('TravBus',style:TextStyle(color: Colors.white,fontSize: 14.sp,fontFamily: 'Lobster'))),
  color: fristappcolor,
 ),
SizedBox(height: 3.h),
  ListTile(title: Text('شرح كيفيةاستخدام التطبيق',style:TextStyle(color: secondtextcolor,fontSize: 12.sp,fontFamily: 'Lobster')),
  trailing: Icon(Icons.video_call,color: fristappcolor,),
  onTap: ()=>{
    
    launchurl('$_url'),
  },),
        ListTile(title: Text('تعديل بيانات حسابي',style:TextStyle(color:secondtextcolor,fontSize: 12.sp,fontFamily: 'Lobster')),
  trailing: Icon(Icons.manage_accounts,color: fristappcolor,),
  onTap: ()=>{
    setState(() {   
  modifly();}),
  },),
         ListTile(title: Text('الإعدادات',style:TextStyle(color: secondtextcolor,fontSize: 12.sp,fontFamily: 'Lobster',)),
  trailing: Icon(Icons.settings,color: fristappcolor,),
  onTap: ()=>{
    setState(() {
  //select_page(context, 2);
   
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         content: Text("سيتم اضافة بعض الاعدادات في التحديثات القادمة"),
         behavior: SnackBarBehavior.floating,
       )
     );
   
}),
  },),
      /*   ListTile(title: Text('مشاركة التطبيق',style:TextStyle(color: secondtextcolor,fontSize: 18,fontFamily: 'Lobster')),
 trailing: Icon(Icons.share,color: fristappcolor,),
  onTap: ()=>{
    Share.share('رابط التطبيق في جوجل play com.example.tickets_booking_app'),

  },),*/
         ListTile(title: Text('حول التطبيق',style:TextStyle(color: secondtextcolor,fontSize: 12.sp,fontFamily: 'Lobster')),
  trailing: Icon(Icons.question_answer,color: fristappcolor,),
  onTap: ()=>{
 setState(() {
  select_page(context, 3);
}),
  },),
         ListTile(title: Text('المساعدة والدعم',style:TextStyle(color: secondtextcolor,fontSize: 12.sp,fontFamily: 'Lobster')),
  trailing: Icon(Icons.help_sharp,color: fristappcolor,),
  onTap: ()=>{
   setState(() {
  select_page(context, 4);
}),
  },)
],
        ),
        ),
    );
  }
  }
 