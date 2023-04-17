import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../screens/settings.dart';

class About_the_application extends StatefulWidget {
  @override
  _About_the_applicationState createState() => _About_the_applicationState();
}

class _About_the_applicationState extends State<About_the_application> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
              appBar: AppBar(
          
         actions: 
          [ Padding(
             padding: EdgeInsets.only(left: 210.0),

             child: Text(' حول التطبيق',style:TextStyle(fontSize: 16.sp,fontFamily: 'Lobster',height: 1.7,color:lightcolor)),
           ),

          ],backgroundColor: secondappcolor,
    
        ),
      body:
    Container(
      child: Column(
        children: [
          SizedBox(height: 5.h,),
          Container(
                     width: 30.w,
                     height: 30.h,
                     margin: EdgeInsets.only(top: 2.5),
                     alignment: Alignment.center,
                     child: Image.asset("assets/images/W3A.jpg",alignment: Alignment.center,fit: BoxFit.fill,)
                     ),
                     SizedBox(height: 5.h,),
     Padding(
       padding: const EdgeInsets.all(10.0),
       child: Text('تطبيق TravBus هو أول تطبيق مقدم من فريق W3A لتقنية المعلومات . يهدف التطبيق لمساعدة المسافرين في تسهيل عملية الحجز وعملية البحث عن الرحلة المناسبة لهم .حيث يقارن بين أسعار الرحلات المقدمة من أشهر مكاتب السفريات في الجمهورية اليمنية . حيث يقدم هذا التطبيق جميع الرحلات المتوفرة بين جميع المحافظات  الجمهوريةاليمنية , وكذلك بين المدن اليمنية والسعودية.  ',
       style: TextStyle(fontFamily: 'Lobster',fontSize: 11.sp,fontWeight: FontWeight.bold,color:secondtextcolor),),
     ) ,  ],
      ),
      
    ),
    );
  }
}