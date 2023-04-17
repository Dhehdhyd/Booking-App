import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
 // اللوان الخاصة بتطبيق
  Color darkcolor=Colors.black;
  Color lightcolor=Colors.white;
  Color fristappcolor= Color.fromRGBO(60, 157, 195,1);
  Color secondappcolor= Color.fromRGBO(60, 90, 195,1);

Color fristtextcolor= Color.fromRGBO(0, 0, 0,1);
  Color secondtextcolor= Color.fromRGBO(60, 90, 195,1);
  Color thridtextcolor= Color.fromRGBO(60, 157, 195,1);

ThemeMode _tm=ThemeMode.light;
bool _swval=false;
class Settingpage extends StatefulWidget {
   
  @override
  _SettingpageState createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
         actions: 
          [ Padding(
             padding: EdgeInsets.only(left:75),

             child: Text(" الإعدادت ",style:TextStyle(fontSize: 12.sp,fontFamily: 'Lobster',height: 0.7.h)),
           ),], 
          flexibleSpace: Container(
          decoration: BoxDecoration(
gradient: LinearGradient(colors: [
 secondappcolor,
 secondappcolor,

  


],),
          ),
          ),

        ),
      body:
    Container(
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left:100.0),
            child: Text("تغير الوان التطبيق",style:TextStyle(fontSize: 10.sp,height: 0.7.h)),
            
          ),
      SizedBox(height: 2.5.h,) ,
    Divider(color: Colors.black,),
      SizedBox(height: 5.h,) ,
 Padding(
            padding: EdgeInsets.only(left:100.0),
            child: Text(" الوان خلفية التطبيق",style:TextStyle(fontSize: 10.sp)),
            
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
 
              
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("ابيض"),
                ),
                Switch(
                  value: _swval,
                  onChanged: (bool value){
                    setState(() {
                                          _swval=value;
                                          if(_swval==false)
                                          {_tm=ThemeMode.light;}
                                          else {_tm=ThemeMode.dark;}
                                        });
                  },
                  activeColor: darkcolor,
                  inactiveThumbColor: lightcolor,
                ),
               Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("أسود"),
                ), 
              ],
            ),
          ),
      SizedBox(height: 10.h,) ,
    Divider(color: darkcolor,),
 
      SizedBox(height: 2.5.h,) ,
      Padding(
            padding:  EdgeInsets.only(left:80.0),
            child: Text("تغير لوني التطبيق الإساسيين ",style:TextStyle(fontSize: 10.sp)),
            
          ),
      SizedBox(height: 15.h,) ,
 
            Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [

                Container(
      width: 75.w,
                 
    
    child: ElevatedButton(
     style: ElevatedButton.styleFrom(
      primary: secondappcolor,

       shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
    ),
    ),
      child: 
    Text(" اللون الإول",style:TextStyle(fontSize: 10.sp,color: lightcolor)),
      
     
      onPressed: (){
 
           
        

      },
    ),
                
          ),
        
          Container(
      width: 75.w,
                 
    
    child:  ElevatedButton(
     style: ElevatedButton.styleFrom(
      primary: secondappcolor,


       shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
    ),
    ),
      child: 
    Text(" اللون الثاني",style:TextStyle(fontSize: 10.sp,color:lightcolor)),
      
 
      onPressed: (){
 
           
        

      },
    ),
                
          ),
            ],
            ),
        SizedBox(height: 10.h,) ,
    Divider(color: darkcolor,), ],
      ),
      
    ),
    );
  }
}