import 'package:flutter/material.dart';
import '../class_tools/app_card_trip.dart';
import '../main.dart';
import '../screens/settings.dart';
import 'package:intl/intl.dart';//تنسيق التاريخ

//حقل التاريخ كامل
 String dateday="${DateFormat.yMd().format(DateTime.now())}";
class Counter_date extends StatefulWidget {
  @override
  _Counter_dateState createState() => _Counter_dateState();
}


 int day=16;
  int mounth=09;
  int year=2022;
  List s1=[];
  List<String> s=[''];
String mounths="";
  String days="";
  String years="";

class _Counter_dateState extends State<Counter_date> {
List<String> s=[''];
//تحديث التاريخ بعد الزيادة او النقصان
 update(dayss,mounthss,yearss){
      setState(() {
 f.Dateday=yearss+mounthss+dayss;
      });
}
 _Counter_dateState(){ 
   //التاريخ حق اليوم ثم يجزئه
 s1= DateTime.now().toString().split(' ');
   s="${s1[0]}".split('-');
   days=s[2];
   day= int.parse(days);
          mounths=s[1];

   mounth= int.parse(mounths);
    years=s[0];
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
  @override
  Widget build(BuildContext context) {
    return Container(
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
     
    
    onPressed:(){setState(() {
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
update(days,mounths,years);
    filter_trips=1;

          card=AppCard();
         // card={} as AppCard;

        });
   
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
    
    
    onPressed:(){setState(() {
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

    filter_trips=1;
update(days,mounths,years);

         // card={} as AppCard;

          card=AppCard();
        });
      
    },
    child: Text('>>',style: TextStyle(fontSize: 12,color:Colors.white)),
    
    
    ),
        ],
      ),
      
    );
  }
}