import 'package:flutter/material.dart';
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
             padding: const EdgeInsets.only(left: 250),

             child: Text(" الإعدادت ",style:TextStyle(fontSize: 22,fontFamily: 'Lobster',height: 1.7)),
           ),], 
          flexibleSpace: Container(
          decoration: BoxDecoration(
gradient: LinearGradient(colors: [
fristappcolor,
fristappcolor,
  


],),
          ),
          ),

        ),
      body:
    Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:200.0),
            child: Text("تغير الوان التطبيق",style:TextStyle(fontSize: 18,height: 1.7)),
            
          ),
      SizedBox(height: 5,) ,
    Divider(color: Colors.black,),
      SizedBox(height: 10,) ,
 Padding(
            padding: const EdgeInsets.only(left:200.0),
            child: Text(" الوان خلفية التطبيق",style:TextStyle(fontSize: 18)),
            
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
 
              
              children: [
                Padding(
                  padding: const EdgeInsets.all(40),
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
                  padding: const EdgeInsets.all(40),
                  child: Text("أسود"),
                ), 
              ],
            ),
          ),
      SizedBox(height: 20,) ,
    Divider(color: darkcolor,),
 
      SizedBox(height: 5,) ,
      Padding(
            padding: const EdgeInsets.only(left:160.0),
            child: Text("تغير لوني التطبيق الإساسيين ",style:TextStyle(fontSize: 18)),
            
          ),
      SizedBox(height: 30,) ,
 
            Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [

                Container(
      width: 150,
                 
    
    child: ElevatedButton(
     style: ElevatedButton.styleFrom(
      primary: secondappcolor,

       shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
    ),
    ),
      child: 
    Text(" اللون الإول",style:TextStyle(fontSize: 15,color: lightcolor)),
      
     
      onPressed: (){
 
           
        

      },
    ),
                
          ),
        
          Container(
      width: 150,
                 
    
    child:  ElevatedButton(
     style: ElevatedButton.styleFrom(
      primary: secondappcolor,


       shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
    ),
    ),
      child: 
    Text(" اللون الثاني",style:TextStyle(fontSize: 15,color:lightcolor)),
      
 
      onPressed: (){
 
           
        

      },
    ),
                
          ),
            ],
            ),
        SizedBox(height: 20,) ,
    Divider(color: darkcolor,), ],
      ),
      
    ),
    );
  }
}