import 'package:flutter/material.dart';
//import '../main.dart';القائمة المنسدلة
class AppDrawer extends StatelessWidget {
  //const AppDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
Container(
        alignment: Alignment.topLeft,
        child: Drawer(
child: ListView(children: [
  Container( height: 40,      
   decoration: BoxDecoration(
gradient: LinearGradient(colors: [
  Color.fromRGBO(0, 0, 77,1),
  Color.fromRGBO(77, 0, 77,1),
  Color.fromRGBO(0, 0, 77,1),
 ] ),
 ),
 ),
SizedBox(height: 20),
  ListTile(title: Text('شرح كيفيةاستخدام التطبيق',style:TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster')),
  trailing: Icon(Icons.video_call),
  onTap: ()=>{},),
        ListTile(title: Text('تعديل بيانات حسابي',style:TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster')),
  trailing: Icon(Icons.manage_accounts),
  onTap: ()=>{},),
         ListTile(title: Text('الإعدادات',style:TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster',)),
  trailing: Icon(Icons.settings),
  onTap: ()=>{},),
         ListTile(title: Text('مشاركة التطبيق',style:TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster')),
 trailing: Icon(Icons.share),
  onTap: ()=>{},),
         ListTile(title: Text('حول التطبيق',style:TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster')),
  trailing: Icon(Icons.question_answer),
  onTap: ()=>{},),
         ListTile(title: Text('المساعدة والدعم',style:TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster')),
  trailing: Icon(Icons.help_sharp),
  onTap: ()=>{},)
],
        ),
        ),
    );
  }
  }