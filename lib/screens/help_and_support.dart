import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
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
             padding: EdgeInsets.only(left: 210.0),

             child: Text(' المساعدة والدعم',style:TextStyle(fontSize: 16.sp,fontFamily: 'Lobster',height: 1.7,color:lightcolor)),
           ),

          ],backgroundColor: secondappcolor,
    
        ),
      body:
     Container(
     child: Row(
       children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          
          child: 

          Column (
            
             children: [
    
               Container(
  
                 margin: EdgeInsets.only(top: 10),
                 child: Icon(Icons.call,color:fristappcolor,size: 50,),
               ),
SizedBox(height: 7.h,),
Container(
  child: InkWell(
    
 child: Row(
  
            children: [
  
              
  
  
              Text(" مكتب البركة",style: TextStyle(color:secondtextcolor,fontSize: 10.sp,fontWeight: FontWeight.bold),),
  
            ],
  
          ),
  
  
          onTap: (){        
  launch('tel:+967 770066616');
  
          },
  
      ),
),
    SizedBox(height: 2.h,),
Container(
  child: InkWell(
    
 child: Row(
  
            children: [
  
              
  

  
              Text("مكتب ابوسرهد",style: TextStyle(color:secondtextcolor,fontSize: 10.sp,fontWeight: FontWeight.bold),),
  
            ],
  
          ),
  
  
          onTap: (){        
  launch('tel:+967 7774880893');
  
          },
  
      ),
),
          
    SizedBox(height: 2.h,),
         
         Container(
  child: InkWell(
    
 child: Row(
  
            children: [
  
              
  

  
              Text(" الدعم الفني ",style: TextStyle(color:secondtextcolor,fontSize: 10.sp,fontWeight: FontWeight.bold),),
  
            ],
  
          ),
  
  
          onTap: (){        
  launch('tel:+967 774205096');
  
          },
  
      ),
),    ],
           ),
        ),
    SizedBox(width: 40.w,),

        Column(
          children: [
            Container(
               margin: EdgeInsets.only(top: 10),   
                   child: Icon(Icons.whatsapp_rounded,color: fristappcolor,size: 50,),
              ),
        
        SizedBox(height: 7.h,),
Container(
  child:   InkWell(

     child: Row(
  
          children: [
  
            
  

  
            Text(" مكتب البركة",style: TextStyle(color:secondtextcolor,fontSize: 10.sp,fontWeight: FontWeight.bold),),
  
          ],
  
        ),
  
  
        onTap: (){        
  launchWhatsapp(number: "+967 770066616",message: "hello");
  
        },
  
      ),
),
    SizedBox(height: 2.h,),
    Container(
  child:   InkWell(

     child: Row(
  
          children: [
  
          
  

  
            Text(" مكتب ابوسرهد",style: TextStyle(color:secondtextcolor,fontSize: 10.sp,fontWeight: FontWeight.bold),),
  
          ],
  
        ),
  
  
        onTap: (){        
  launchWhatsapp(number: "++967 7774880893",message: "hello");
  
        },
  
      ),
),
    SizedBox(height: 2.h,),

Container(
  child:   InkWell(

     child: Row(
  
          children: [
  
            
  

  
            Text("  الدعم الفني",style: TextStyle(color:secondtextcolor,fontSize: 10.sp,fontWeight: FontWeight.bold),),
  
          ],
  
        ),
  
  
        onTap: (){        
  launchWhatsapp(number: "+967 779746008 ",message: "hello");
  
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