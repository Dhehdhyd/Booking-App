import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';//اتجاة الكتابة
import 'package:intl/intl.dart';//تنسيق التاريخ
import 'package:splashscreen/splashscreen.dart';//صفحة التحميل
import '../screens/start_page.dart';
import '../screens/create_an_account_page.dart';

void main() {
 return runApp(mystartpage());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticket_Booking_App',
      //اتجاة الكتابة واللغة العربية
       localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
   supportedLocales: [
    Locale('ar', 'AE'), // English, no country code
  ],
      theme: ThemeData(
       //اللوان التطبيق الرئيسية 
        primarySwatch:Colors.purple,
        accentColor: Colors.purpleAccent,
        
      ),
      debugShowCheckedModeBanner:false,

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedItem='صنعاء';
  String? selectedItem1='اب';
  int select_index_page=0;
  //الانتقال في ايقونة الشريط السفلي
void _createaccount(int index){
  setState(() {
      select_index_page=index;
    });
select_page(context,select_index_page);

}

  List<String>list_city=[
  'عدن', 'صنعاء', 'اب', 'جدة', 'رياض',
  ];
  //دالة التنقل في الصفحات
 void select_page(BuildContext ctx,int index_page)
  {
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (_){
        if(index_page==0)
        return MyHomePage();
        else
        return create_account();

      }
    ));
  }
  String _selectedDate="null";
  DateTime _selectedDate1=DateTime.now();
  //عرض التاريخ
  void date_picker()
  {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2024),
      currentDate:DateTime.now(),
    ).then((date){
      if(date==null){return;}
      setState(() {
_selectedDate1=date;
              _selectedDate=date.toString();
            });});}
  @override
  Widget build(BuildContext context) {

    return 
     DefaultTabController(
       length: 2,
            child: Scaffold(
        appBar: AppBar(
         actions: 
          [ Padding(
             padding: const EdgeInsets.only(left: 210.0),

             child: Text('الصفحة الرئيسية',style:TextStyle(fontSize: 22,fontFamily: 'Lobster',height: 1.7)),
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
        
        body://الحقول  
        Container(
height: double.infinity,
child: SingleChildScrollView(
child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
children: [
SizedBox(height: 20),
Container(
  child: Row(
    children: [
        SizedBox(width: 10),
   Icon(Icons.location_city,color: Color.fromRGBO(0, 0, 77,1),),
   SizedBox(width: 10), 
        Text('من مدينة',style:TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster',
        ),),
   
    ],
  ),
),
SizedBox(height: 10),
Container(
  height: 70,
  child: DropdownButtonFormField<String>(
  decoration: InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(width: 2,color:Color.fromRGBO(77, 0, 77,1) )
    )
  ),
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 20,
          isExpanded: true,
          value:selectedItem,
          onChanged: (newValue){
            setState(() {
                      selectedItem = newValue;
                    });
          },
          items: list_city.map((item)=> DropdownMenuItem(
  value:item,
  child: Text(item),
) 
          ).toList(),
        ),
    ),
         
       SizedBox(height: 10),
  Container(
  child: Row(
    children: [
        SizedBox(width: 10),
   Icon(Icons.location_city,color: Color.fromRGBO(0, 0, 77,1),),
   SizedBox(width: 10), 
        Text('الى مدينة',style:TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster',
        ),
        ),
   
    ],
  ),
),
SizedBox(height: 10),
//قائمة الخيارات
Container(
  height: 70,
  
  child: DropdownButtonFormField<String>(
  decoration: InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(width: 2,color:Color.fromRGBO(77, 0, 77,1) )
    )
  ),
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 20,
          isExpanded: true,
          value:selectedItem1,
          onChanged: (newValue){
            setState(() {
                      selectedItem1 = newValue;
                    });
          },
          items: list_city.map((item)=> DropdownMenuItem(
  value:item,
  child: Text(item),
) 
          ).toList(),
        ),
    ),

SizedBox(height: 30),
//التاريخ
Container(child:Row(
  children: [
   Icon(Icons.date_range,color: Color.fromRGBO(0, 0, 77,1),), 
SizedBox(width: 10),

    InkWell(
        child: Text(_selectedDate=="null"?"تاريخ الرحلة":"${DateFormat.yMd().format(_selectedDate1)}",style:TextStyle(color: Color.fromRGBO(0,0 , 0,0.7),fontSize: 18,fontFamily: 'Lobster',
 
        ),),
        onTap:(){
         setState(() {
                 date_picker(); 
                });} ,
    ),
  ],
)

 
),

SizedBox(height: 20),
//الزر بحث
Container(child: Column(
  children: [
          RaisedButton(
    disabledColor: Color.fromRGBO(77, 0, 77,1),
    disabledTextColor:Colors.white, 
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
    ),
    
    onPressed: null,
    child: Text('بحث ',style: TextStyle(fontSize: 15)),
    
    
    ),
    
  ],
       crossAxisAlignment: CrossAxisAlignment.stretch, 
    ),
),
  
],
),


),



),
//الشريط السفلي
 bottomNavigationBar:BottomNavigationBar(
//backgroundColor:  Colors.white,
//selectedItemColor: Color.fromRGBO(0, 0, 77,1),
//unselectedItemColor: Color.fromRGBO(77, 0, 77,1),
currentIndex: select_index_page,
//selectedFontSize: 12,
//unselectedFontSize: 12,
type: BottomNavigationBarType.shifting,
  onTap:_createaccount,
  
items: [BottomNavigationBarItem(
  
 backgroundColor:Color.fromRGBO(77, 0, 77,1),
 
icon:Icon(Icons.home),
label: "الصفحة الرئسية",

),
BottomNavigationBarItem(
  backgroundColor:Color.fromRGBO(77, 0, 77,1),
  icon:Icon(Icons.create),

label: "انشاء حساب",

),
],
),

// القائمة المنسدلة
    drawer: Container(
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
    ),

    ),
     );
  }
}
