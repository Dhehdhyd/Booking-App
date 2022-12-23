import 'package:flutter/material.dart';
import '../class_tools/app_card_trip.dart';
import '../main.dart';
import '../screens/settings.dart';
import 'package:intl/intl.dart';//تنسيق التاريخ

class Counter_date extends StatefulWidget {
  @override
  _Counter_dateState createState() => _Counter_dateState();
}
//حقل التاريخ كامل
 String dateday="${DateFormat.yMd().format(DateTime.now())}";

 int day=16;
  int mounth=9;
  int year=2022;
class _Counter_dateState extends State<Counter_date> {
List<String> s=[''];
 _Counter_dateState(){ 
   //التاريخ حق اليوم ثم يجزئه
   s="${DateFormat.yMd().format(DateTime.now())}".split('/');
  String days=s[1];
   day= int.parse(days);
     String mounths=s[0];
   mounth= int.parse(mounths);
     String years=s[2];
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
    filter_trips=1;
        //  card=AppCard();
        });
   
    },
    child: Text('<<',style: TextStyle(fontSize: 12,color:Colors.white)),
    
    
    ),
         
    Text(day.toString()+" - "+mounth.toString()+" - "+year.toString()
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

    filter_trips=1;
         // card=AppCard();
        });
      
    },
    child: Text('>>',style: TextStyle(fontSize: 12,color:Colors.white)),
    
    
    ),
        ],
      ),
      
    );
  }
}