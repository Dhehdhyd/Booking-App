import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';//اتجاة الكتابة
import 'package:intl/intl.dart';//تنسيق التاريخ
import '../screens/start_page.dart';
import '../screens/create_an_account_page.dart';
import '../screens/settings.dart';
import '../class_tools/app_drawer.dart';
import '../class_tools/app_card_trip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Functions/fetch.dart';

ThemeMode tm=ThemeMode.light;
bool darkMode=false;
 int day=16;
  int mounth=09;
  int year=2022;
  List data_inc_dec1=[];
  List<String> data_inc_dec=[''];
String mounths="";
  String days="";
  String years="";

Fetch f=Fetch();


void main()async{
  //عندما ينشاء حساب تتسجل بيانات العميل اي انه قد انشاء حساب فيتم ارجاع قيمة متغير الانشاء لكي لا اسمح له بانشاء حساب جديد
WidgetsFlutterBinding.ensureInitialized();
//هذا الشرط لي لانه جهازي قد حفظ البيانات افعل هذا الشرط بس
         // if(create_account==true)
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


//////////////////////////////////////////////////// الاداة حق فلاتر حقل التاريخ////////////////////////////////
  String selectedDate=selectedDate1.toString();
    List<String> s=selectedDate.split(' ');
    
  String datetrip=s[0];
      List<String> s2=s[0].split('-');

  String datetrip1=s2[2]+'-'+s2[1]+'-'+s2[0];
 
              
              
  int filter_trips=0;
//حقل التاريخ اليوم/////////////////////////////////////////////////////
  DateTime d=DateTime.now();

String dd=d.toString();
    List<String> ss=dd.split(' ');
    
      List<String> ss2=ss[0].split('-');

  String dateday=ss2[2]+'-'+ss2[1]+'-'+ss2[0];
////////////////////////////////////////////////////////////////////
class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
///////////////////////////////////////////////////////////////////دوال الحقل الزيادة والنقصان حق التاريخ/////////////////////////
 
//تحديث التاريخ بعد الزيادة او النقصان
 updatedata(dayss,mounthss,yearss){
      setState(() {
 Dateday=yearss+mounthss+dayss;
 
      });
}
 _MyHomePageState(){ 
   //التاريخ حق اليوم ثم يجزئه
 data_inc_dec1= DateTime.now().toString().split(' ');
   data_inc_dec="${data_inc_dec1[0]}".split('-');
   days=data_inc_dec[2];

   day= int.parse(days);
          mounths=data_inc_dec[1];

   mounth= int.parse(mounths);
    years=data_inc_dec[0];

   year= int.parse(years);
 }

 
  inc(){

    if(mounth==4||mounth==6||mounth==9||mounth==11)
    {
      if(day<30)
      {
        setState(() {
                  day++;
                });

      }
      else if(day==30)
      {day=1;
        if(mounth<12)
        {
          setState(() {
                      mounth++;
                    });
        }
        else if(mounth==12)
        {mounth=1;
          setState(() {
                      year++;
                    });
        }
      }
    }
   else if(mounth==1||mounth==3||mounth==5||mounth==7||mounth==8||mounth==10||mounth==12)
    {
      if(day<31)
      {
        setState(() {
                  day++;
                });

      }
      else if(day==31)
      {day=1;
        if(mounth<12)
        {
          setState(() {
                      mounth++;
                    });
        }
        else if(mounth==12)
        {mounth=1;
          setState(() {
                      year++;
                    });
        }
      }
    }
      else if(mounth==2)
    {
      if(day<28)
      {
        setState(() {
                  day++;
                });

      }
      else if(day==28)
      {day=1;
        if(mounth<12)
        {
          setState(() {
                      mounth++;
                    });
        }
        else if(mounth==12)
        {mounth=1;
          setState(() {
                      year++;
                    });
        }
      }
    }
  }
dec(){
    if(mounth==4||mounth==2||mounth==6||mounth==9||mounth==11)
    {
      if(day>1)
      {
        setState(() {
                  day--;
                });

      }
      else if(day==1)
      {day=31;
        if(mounth>1)
        {
          setState(() {
                      mounth--;
                    });
        }
        else if(mounth==1)
        {mounth=12;
          setState(() {
                      year--;
                    });
        }
      }
    }
   else if(mounth==1||mounth==5||mounth==7||mounth==8||mounth==10||mounth==12)
    {
      if(day>1)
      {
        setState(() {
                  day--;
                });

      }
      else if(day==1)
      {day=30;
        if(mounth>1)
        {
          setState(() {
                      mounth--;
                    });
        }
        else if(mounth==1)
        {mounth=12;
          setState(() {
                      year--;
                    });
        }
      }
    }
      else if(mounth==3)
    {
      if(day>1)
      {
        setState(() {
                  day--;
                });

      }
      else if(day==1)
      {day=28;
        if(mounth>1)
        {
          setState(() {
                      mounth--;
                    });
        }
        else if(mounth==11)
        {mounth=12;
          setState(() {
                      year--;
                    });
        }
      }
    }
  }
          
 

/////////////////////////////////////////////////////////////////end/////////////////////////////////////
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
 update(selectedDate,selectedItem,selectedItem1,selectedDate1){
      
  select_date=selectedDate;
  select_date1=selectedDate1;
from_city=selectedItem;
to_city=selectedItem1;
    
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
              datetrip=s[0];});
              s2=s[0].split('-');
             datetrip1=s2[2]+'-'+s2[1]+'-'+s2[0];
              update(datetrip,selectedItem,selectedItem1,datetrip1);




            });
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
           
                      selectedItem = newValue;
                     update(datetrip,selectedItem,selectedItem1,datetrip1);
         
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
   
                      selectedItem1 = newValue;
                      update(datetrip,selectedItem,selectedItem1,datetrip1);
       
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
        // setState(() {
                 date_picker(); 
                //});
                } ,
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
                    
                     
        //يتم عرض الرحلات التي تم البحث عنها حيث يتغير قيمة متغير الفلتره ثم يتغير قيمة متغير الرحلات
setState(() {
          filter_trips=2;

});

  
    }
    ,
    child: Text('بحث ',style: TextStyle(fontSize: 15,color:lightcolor)),
    
    
    ),
    
  ],
       crossAxisAlignment: CrossAxisAlignment.stretch, 
    ),
),
/////////////////////////////////////// الزيادة والنقصان في التاريخ//////////////////////////////////////////////
Container(
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
           ElevatedButton(
     style: ElevatedButton.styleFrom(
      primary: secondappcolor,
 
textStyle:TextStyle(color:Colors.white,),
       shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(110.0)
    ),
    ),
     
    
    onPressed:(){
if( data_inc_dec[2].compareTo(days)==0&&data_inc_dec[1].compareTo(mounths)==0&&data_inc_dec[0].compareTo(years)==0)
{
  ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         content: Text("لا يتم عرض الرحلات بعد تاريخ اليوم"),
         behavior: SnackBarBehavior.floating,
       )
     );  
}
             else{
               dec();
                if(mounth==1||mounth==2||mounth==3||mounth==4||mounth==5||mounth==6||mounth==7||mounth==8||mounth==9)
{mounths="0"+mounth.toString();}
else
{mounths=mounth.toString();}
  if(day==1||day==2||day==3||day==4||day==5||day==6||day==7||day==8||day==9)
{days="0"+day.toString();}
else
{days=day.toString();}
years=year.toString();
updatedata(days,mounths,years);
 setState(() {
   filter_trips=1;
});

             } 
    

       
   
    },
    child: Text('<<',style: TextStyle(fontSize: 12,color:Colors.white)),
    
    
    ),
         
    Text(days+" - "+mounths+" - "+years
    ,style: TextStyle(fontSize: 15,color: thridtextcolor,fontFamily: 'Lobster')),
          ElevatedButton(
     style: ElevatedButton.styleFrom(
      primary: secondappcolor,
 
textStyle:TextStyle(color:Colors.white,),
       shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(110.0)
    ),
    ),
    
    
    onPressed:(){
          inc();
           if(mounth==1||mounth==2||mounth==3||mounth==4||mounth==5||mounth==6||mounth==7||mounth==8||mounth==9)
{mounths="0"+mounth.toString();}
else
{mounths=mounth.toString();}
  if(day==1||day==2||day==3||day==4||day==5||day==6||day==7||day==8||day==9)
{days="0"+day.toString();}
else
{days=day.toString();}
years=year.toString();
setState(() {
   filter_trips=1;
});
   
updatedata(days,mounths,years);

      
      
    },
    child: Text('>>',style: TextStyle(fontSize: 12,color:Colors.white)),
    
    
    ),
        ],
      ),
      
    ),
//////////////////////////////////////////////////////////////////END//////////////////////////////////////////  
SizedBox(height: 30,),
// متغير الرحلات
AppCard(),


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
