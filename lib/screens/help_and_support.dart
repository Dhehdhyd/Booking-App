import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

             child: Text(" المساعدة والدعم ",style:TextStyle(fontSize: 22,fontFamily: 'Lobster',height: 1.7)),
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
                 child: Icon(Icons.call,color: Colors.green,size: 50,),
               ),
SizedBox(height: 30,),
Container(
  child:   RaisedButton(
    color: Color.fromRGBO(77, 0, 77,1),
    textColor:Colors.white, 
    shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0)
    ),
     
     child: Row(
  
            children: [
  
              Icon(Icons.call,color: Color.fromRGBO(0, 0, 77,1),),
  
  SizedBox(width: 5,),
  
              Text("إدارة الحجوزات",style: TextStyle(color: Colors.white),),
  
            ],
  
          ),
  
  
          onPressed: (){        
  launch('tel:+967777190123');
  
          },
  
      ),
),
    SizedBox(height: 10,),
Container(
  child:   RaisedButton(
     color: Color.fromRGBO(77, 0, 77,1),
    textColor:Colors.white, 
    shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0)
    ),
     
     child: Row(
  
            children: [
  
              Icon(Icons.call,color: Color.fromRGBO(0, 0, 77,1),),
  
  SizedBox(width: 5,),
  
              Text("الشكاوى والاقتراحات",style: TextStyle(color: Colors.white),),
  
            ],
  
          ),
  
  
          onPressed: (){        
  launch('tel:+967777190123');
          },
  
      ),
),
          
             ],
           ),
        ),
SizedBox(width: 10,),
        Column(
          children: [
            Container(
               margin: EdgeInsets.only(top: 20),   
                   child: Icon(Icons.whatsapp_rounded,color: Colors.green,size: 50,),
              ),
        
        SizedBox(height: 30,),
Container(
  child:   RaisedButton(
      color: Color.fromRGBO(77, 0, 77,1),
    textColor:Colors.white, 
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
    ),
     child: Row(
  
          children: [
  
            Icon(Icons.whatsapp,color: Color.fromRGBO(0, 0, 77,1),),
  
  SizedBox(width: 10,),
  
            Text("إدارة الحجوزات",style: TextStyle(color: Colors.white),),
  
          ],
  
        ),
  
  
        onPressed: (){        
  launchWhatsapp(number: "+967777123456",message: "hello");
  
        },
  
      ),
),
    SizedBox(height: 10,),
Container(
  child:   RaisedButton(
      color: Color.fromRGBO(77, 0, 77,1),
    textColor:Colors.white, 
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
    ),
     child: Row(
  
          children: [
  
            Icon(Icons.whatsapp,color: Color.fromRGBO(0, 0, 77,1),),
  
  SizedBox(width: 10,),
  
            Text("الشكاوى والاقتراحات",style: TextStyle(color: Colors.white),),
  
          ],
  
        ),
  
  
        onPressed: (){        
  launchWhatsapp(number: "+967777123456",message: "hello");
        },
  
      ),
),  ],
        ),
         ],
     ), 
     
    ),
    );
  }
}