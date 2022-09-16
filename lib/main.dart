import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';//اتجاة الكتابة
import 'package:intl/intl.dart';//تنسيق التاريخ
import 'package:splashscreen/splashscreen.dart';//صفحة التحميل
import '../screens/start_page.dart';
import '../screens/create_an_account_page.dart';
import '../screens/about_the_application.dart';
import '../screens/help_and_support.dart';
import '../screens/modifly_my_account_data.dart';
import '../screens/create_an_account_traveler.dart';
import '../screens/trip_details_page.dart';
import '../screens/settings.dart';
import '../class_tools/app_drawer.dart';
import '../class_tools/app_card_trip.dart';
import '../class_tools/counter_date_main.dart';
import '../class_tools/app_BottomNavigationBar.dart';


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

     // home: MyHomePage(),
       initialRoute: '/',
      routes: {
        '/': (context) =>MyHomePage() ,
         '/help_and_support': (context) =>Help_and_support() ,
               '/mycreate_account': (context) =>Mycreate_account() ,
                           '/create_account': (context) =>Create_account() ,
                                 '/modifly_my_account_data ': (context) =>Modifly_my_account_data () ,
                                       '/settingpage': (context) =>Settingpage() ,
                                       '/about_the_application': (context) =>About_the_application() ,
                                       '/trip_details_page': (context) =>Trip_details_page() ,
                                      

                                       
          }
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


  List<String>list_city=[
  'عدن', 'صنعاء', 'اب', 'جدة', 'رياض',
  ];
 
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
    SizedBox(width: 6,),
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
// الزيادة والنقصان في التاريخ
  Counter_date(),
SizedBox(height: 30,),
// الرحلات
AppCard(),
SizedBox(height: 10,),
AppCard(),
SizedBox(height: 10,),
AppCard(),
SizedBox(height: 10,),
AppCard(),
SizedBox(height: 10,),
AppCard(),
],
),


),



),
//الشريط السفلي
 bottomNavigationBar:AppBottomNavigationBar(),
 

// القائمة المنسدلة
    drawer:AppDrawer(), 

    ),
     );
  }
}
