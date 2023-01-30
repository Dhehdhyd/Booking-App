import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';//اتجاة الكتابة
import 'package:intl/intl.dart';//تنسيق التاريخ
import '../screens/start_page.dart';
import '../screens/create_an_account_page.dart';
import '../screens/settings.dart';
import '../class_tools/app_drawer.dart';
import '../class_tools/app_card_trip.dart';
import '../class_tools/counter_date_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Functions/fetch.dart';

ThemeMode tm=ThemeMode.light;
bool darkMode=false;

Fetch f=Fetch();


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
        
                                      

                                       
          }
    );
  }
}
  

  DateTime selectedDate1=DateTime.now();
   String? selectedItem='تعز';
  String? selectedItem1='عدن';



  String selectedDate=selectedDate1.toString();
    List<String> s=selectedDate.split(' ');
  String datetrip=s[0];
 
              
              
  int filter_trips=0;
 var card=AppCard();

class MyHomePage extends StatefulWidget {

  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  
          
 


  List<String>list_city=[
'تعز','عدن', 'صنعاء', 'اب', 'جدة', 'الرياض',
'رداع','البيضاء', 'الحديدة', 'العبر', 'مارب', 'الطائف',
'لحج','حضرموت', 'ابين', 'المكلا', 'شبوة', 'ذمار',
'الجوف','حجة', 'المحويت', 'الضالع', 'صعدة', 'ريمه',
'يريم','زنجبار', 'بن عيفان', 'سيئون', 'عمران', 'المهرة',
'وادي الدواسر','شرورة', 'الوديعة', 'تريم', 'دوعن', 'مكة',
'رنية','يافع', 'زبيد', 'محايل عسير', 'المدينة المنورة', 'الدمام',
'ابها','خميس مشيط', 'بيشة', 'بريدة', 'حفر الباطن', 'الخرمة',
'باجل','القاعدة', 'جازان', 'نجران', 'صيبا', 'الدرب',
'الافراج','الخرج', 'مويه', 'بيت الفقية', 'الجراحي', 'الحسينية',
'معبر','الرويك', 'المنصورية', 'ظهران الجنوب', 'القطن', 'شبام',
'عزان','الحزم',
  ];
 //تحديث البيانات عند النقر على الخيارات
 update(selectedDate,selectedItem,selectedItem1){
      setState(() {
  f.select_date=selectedDate;
f.from_city=selectedItem;
f.to_city=selectedItem1;
      });
}
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
selectedDate1=date;
              selectedDate=date.toString();
              s=selectedDate.split(' ');
              datetrip=s[0];
              update(datetrip,selectedItem,selectedItem1);
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
                      update(datetrip,selectedItem,selectedItem1);
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
                      update(datetrip,selectedItem,selectedItem1);

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

       f.checktrip(1).then((Value){
       ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         content: Text(Value[0]['trip_id'].toString()),
         behavior: SnackBarBehavior.floating,
       )
     );
     }
     );   f.checktrip(2).then((Value){
       ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         content: Text(Value[0]['trip_id'].toString()),
         behavior: SnackBarBehavior.floating,
       )
     );
     }
     );

         //card={} as AppCard;

         
        
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
