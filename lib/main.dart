import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticket_Booking_App',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner:false,

      home: const MyHomePage(title: 'الصفحة الرئيسية'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
       actions: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text('الصفحة الرئيسية',style:TextStyle(fontSize: 22)),
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
      body: Container(
height: double.infinity,
child: SingleChildScrollView(
child: Column(
children: [
SizedBox(height: 20),
Container(child: TextField(),),
Container(child: TextField(),),
Container(child: TextField(),),
Container(child: RaisedButton(
onPressed: null,
child: Text('بحث ',style: TextStyle(fontSize: 15),
),
),


),



],










)













),










      ),
     bottomNavigationBar:BottomNavigationBar(
backgroundColor:  Color.fromRGBO(255, 255, 255,0),
selectedItemColor: Color.fromRGBO(0, 0, 77,1),
unselectedItemColor: Color.fromRGBO(77, 0, 77,1),
selectedFontSize: 15,
unselectedFontSize: 10,
type: BottomNavigationBarType.shifting,
items: [BottomNavigationBarItem(
 backgroundColor:Color.fromRGBO(77, 0, 77,1),
icon:Icon(Icons.image_sharp),
label: "انشاء حساب ",
),

BottomNavigationBarItem(
  backgroundColor:Color.fromRGBO(77, 0, 77,1),
  icon:Icon(Icons.home),

label: "الصفحة الرئسية",

),
],
),


    drawer: Drawer(
child: ListView(children: [
  ListTile(title: Text('شرح كيفيةاستخدام التطبيق'),
  trailing: Icon(Icons.add_call),
  onTap: ()=>{},),
    ListTile(title: Text('تعديل بيانات حسابي'),
  trailing: Icon(Icons.add_call),
  onTap: ()=>{},),
     ListTile(title: Text('الاعدادات'),
  trailing: Icon(Icons.add_call),
  onTap: ()=>{},),
     ListTile(title: Text('مشاركة التطبيق'),
  trailing: Icon(Icons.add_call),
  onTap: ()=>{},),
     ListTile(title: Text('حول التطبيق'),
  trailing: Icon(Icons.add_call),
  onTap: ()=>{},),
     ListTile(title: Text('المساعدة والدعم'),
  trailing: Icon(Icons.add_call),
  onTap: ()=>{},)
],
    ),
    ),

    );
  }
}
