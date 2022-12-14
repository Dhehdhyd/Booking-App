import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens/settings.dart';

class Help_and_support extends StatefulWidget {
  @override
  _Help_and_supportState createState() => _Help_and_supportState();
}

class _Help_and_supportState extends State<Help_and_support> {
  void launchWhatsapp({@required number,@required message})async{
    String url="whatsapp://send?phone=$number&text=$message";
    await canLaunch(url)?launch(url):print("لايستطيع فتح الواتس اب");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         actions: 
          [ Padding(
             padding: const EdgeInsets.only(left: 210),

             child: Text(" المساعدة و الدعم ",style:TextStyle(fontSize: 22,fontFamily: 'Lobster',height: 1.7,color: Colors.white)),
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
     child: Row(
       children: [
        Container(
          margin: EdgeInsets.only(left: 5),
          child: Column (
            
             children: [
    
               Container(
  
                 margin: EdgeInsets.only(top: 20),
                 child: Icon(Icons.call,color:fristappcolor,size: 50,),
               ),
SizedBox(height: 30,),
Container(
  child: InkWell(
    
 child: Row(
  
            children: [
  
              
  
  SizedBox(width: 8,),
  
              Text(" شركة البركة",style: TextStyle(color:secondtextcolor,fontSize: 15,fontWeight: FontWeight.bold),),
  
            ],
  
          ),
  
  
          onTap: (){        
  launch('tel:+967777190123');
  
          },
  
      ),
),
    SizedBox(height: 10,),
Container(
  child: InkWell(
    
 child: Row(
  
            children: [
  
              
  
  SizedBox(width: 8,),
  
              Text("شركة ابوسرهد",style: TextStyle(color:secondtextcolor,fontSize: 15,fontWeight: FontWeight.bold),),
  
            ],
  
          ),
  
  
          onTap: (){        
  launch('tel:+967777190123');
  
          },
  
      ),
),
          
         
         Container(
  child: InkWell(
    
 child: Row(
  
            children: [
  
              
  
  SizedBox(width: 8,),
  
              Text(" الدعم الفني ",style: TextStyle(color:secondtextcolor,fontSize: 15,fontWeight: FontWeight.bold),),
  
            ],
  
          ),
  
  
          onTap: (){        
  launch('tel:+967777190123');
  
          },
  
      ),
),    ],
           ),
        ),
SizedBox(width: 130,),
        Column(
          children: [
            Container(
               margin: EdgeInsets.only(top: 20),   
                   child: Icon(Icons.whatsapp_rounded,color: fristappcolor,size: 50,),
              ),
        
        SizedBox(height: 30,),
Container(
  child:   InkWell(

     child: Row(
  
          children: [
  
            
  
  SizedBox(width: 14,),
  
            Text(" شركة البركة",style: TextStyle(color:secondtextcolor,fontSize: 15,fontWeight: FontWeight.bold),),
  
          ],
  
        ),
  
  
        onTap: (){        
  launchWhatsapp(number: "+967777123456",message: "hello");
  
        },
  
      ),
),
    SizedBox(height: 10,),Container(
  child:   InkWell(

     child: Row(
  
          children: [
  
          
  
  SizedBox(width: 14,),
  
            Text(" شركة ابوسرهد",style: TextStyle(color:secondtextcolor,fontSize: 15,fontWeight: FontWeight.bold),),
  
          ],
  
        ),
  
  
        onTap: (){        
  launchWhatsapp(number: "+967777123456",message: "hello");
  
        },
  
      ),
), 
Container(
  child:   InkWell(

     child: Row(
  
          children: [
  
            
  
  SizedBox(width: 14,),
  
            Text("  الدعم الفني",style: TextStyle(color:secondtextcolor,fontSize: 15,fontWeight: FontWeight.bold),),
  
          ],
  
        ),
  
  
        onTap: (){        
  launchWhatsapp(number: "+967777123456",message: "hello");
  
        },
  
      ),
), ],
        ),
         ],
     ), 
     
    ),
    );
  }
}