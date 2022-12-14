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
import 'package:shared_preferences/shared_preferences.dart';
ThemeMode tm=ThemeMode.light;
bool darkMode=false;

void main()async{
  //عندما ينشاء حساب تتسجل بيانات العميل اي انه قد انشاء حساب فيتم ارجاع قيمة متغير الانشاء لكي لا اسمح له بانشاء حساب جديد
WidgetsFlutterBinding.ensureInitialized();

          if(create_account==false)
{
    SharedPreferences prefs=await SharedPreferences.getInstance();
  //بعض من بيانات العميل يتم حفظها مثل الاسم والصوره ورقم الهاتف من اجل ارسالها عند الحاجة
          create_account=prefs.getBool("create_account")as bool;
          shprname=prefs.getString("shprname").toString();
          shprphon_no=prefs.getString("shprphon_no").toString();
          shprimage=prefs.getString("shprimage").toString();


      
    }
  
 return runApp(mystartpage());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return 
    MaterialApp(
      title: 'TravBus',
      //اتجاة الكتابة واللغة العربية
       localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
   supportedLocales: [
    Locale('ar', 'AE'), // English, no country code
  ],
  themeMode:ThemeMode.system,
      theme: ThemeData(
       //اللوان التطبيق الرئيسية 
        primarySwatch:Colors.lightBlue,

        accentColor: secondappcolor,
        canvasColor: lightcolor,
        scaffoldBackgroundColor: lightcolor,
      brightness: Brightness.light,
      ),
      //لون في الوضع اليلي
      darkTheme: ThemeData( 
         primarySwatch:Colors.lightBlue,
        accentColor: secondappcolor,
        canvasColor: darkcolor,
        scaffoldBackgroundColor: darkcolor,
      brightness: Brightness.dark,


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
  DateTime selectedDate1=DateTime.now();
   String? selectedItem='صنعاء';
  String? selectedItem1='اب';
  String selectedDate=selectedDate1.toString();
  int filter_trips=0;
  var card=AppCard();

class MyHomePage extends StatefulWidget {

  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  
          
 


  List<String>list_city=[
  'عدن', 'صنعاء', 'اب', 'جدة', 'رياض',
  ];
 
  //عرض التاريخ
  List<String> s=[''];
  String datetrip="تاريخ الرحلة";
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
selectedDate1=date;
              selectedDate=date.toString();
              s=selectedDate.split(' ');
              datetrip=s[0];
              
            });});
            }
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

             child: Text('الصفحة الرئيسية',style:TextStyle(fontSize: 22,fontFamily: 'Lobster',height: 1.7,color:lightcolor)),
           ),

          ],backgroundColor: secondappcolor,
           /*
         flexibleSpace: Container(
          decoration: BoxDecoration(
gradient: LinearGradient(colors: [
fristappcolor,
  


],),
          ),
          ),
*/
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
   Icon(Icons.location_city,color: secondappcolor),
   SizedBox(width: 10), 
        Text('من مدينة',style:TextStyle(color: secondtextcolor,fontSize: 18,fontFamily: 'Lobster',
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
        borderSide: BorderSide(width: 2,color:fristappcolor )
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
   Icon(Icons.location_on,color: secondappcolor,),
   SizedBox(width: 10), 
        Text('الى مدينة',style:TextStyle(color: secondtextcolor,fontSize: 18,fontFamily: 'Lobster',
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
        borderSide: BorderSide(width: 2,color:fristappcolor )
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
   Icon(Icons.date_range,color: secondappcolor,), 
SizedBox(width: 10),
 //String Day=formatDate(DateTime.parse(date),[D]);

    InkWell(
        child: Text("${datetrip}",style:TextStyle(color: secondtextcolor,fontSize: 18,fontFamily: 'Lobster',
 
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
            ElevatedButton(
     style: ElevatedButton.styleFrom(
      backgroundColor: secondappcolor,
textStyle:TextStyle(color:Colors.white,),
       shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
    ),
    ),
    
    onPressed:() {
      setState(() {
        //يتم عرض الرحلات التي تم البحث عنها حيث يتغير قيمة متغير الفلتره ثم يتغير قيمة متغير الرحلات
          filter_trips=2;
          card=AppCard();
        });
    }
    ,
    child: Text('بحث ',style: TextStyle(fontSize: 15,color:lightcolor)),
    
    
    ),
    
  ],
       crossAxisAlignment: CrossAxisAlignment.stretch, 
    ),
),
// الزيادة والنقصان في التاريخ
  Counter_date(),
SizedBox(height: 30,),
// متغير الرحلات
card,

],
),


),



),
//الشريط السفلي
// bottomNavigationBar:AppBottomNavigationBar(),
 

// القائمة المنسدلة
    drawer:AppDrawer(), 

    ),
     );
  }
}
