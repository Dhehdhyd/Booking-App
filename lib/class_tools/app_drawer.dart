import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens/about_the_application.dart';
import '../screens/help_and_support.dart';
import '../screens/modifly_my_account_data.dart';
import '../screens/settings.dart';
//القائمة المنسدلة
class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  //const AppDrawer({Key key}) : super(key: key);
  // الانتقال الى الفيديو اليوتيوب
  final Uri _url = Uri.parse('https://youtube.com/');
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
      
        
 return index_page==1?Modifly_my_account_data():index_page==2?Settingpage():index_page==3?About_the_application():Help_and_support();
//arguments: {
//مفتاح وقيمة'id':indexpage==1?10:20وهكذا كل القيم التي تحتاج لتمريرها

}  ),
    );
     }
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
  onTap: ()=>{
    
    launchurl('$_url'),
  },),
        ListTile(title: Text('تعديل بيانات حسابي',style:TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster')),
  trailing: Icon(Icons.manage_accounts),
  onTap: ()=>{
setState(() {
  select_page(context, 1);
}),  

  },),
         ListTile(title: Text('الإعدادات',style:TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster',)),
  trailing: Icon(Icons.settings),
  onTap: ()=>{
    setState(() {
  select_page(context, 2);
}),
  },),
         ListTile(title: Text('مشاركة التطبيق',style:TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster')),
 trailing: Icon(Icons.share),
  onTap: ()=>{
    Share.share('رابط التطبيق في جوجل play com.example.tickets_booking_app'),

  },),
         ListTile(title: Text('حول التطبيق',style:TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster')),
  trailing: Icon(Icons.question_answer),
  onTap: ()=>{
 setState(() {
  select_page(context, 3);
}),
  },),
         ListTile(title: Text('المساعدة والدعم',style:TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster')),
  trailing: Icon(Icons.help_sharp),
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
 