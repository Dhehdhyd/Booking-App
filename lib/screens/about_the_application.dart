import 'package:flutter/material.dart';
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
             padding: const EdgeInsets.only(left: 230),

             child: Text(" حول التطبيق ",style:TextStyle(fontSize: 22,fontFamily: 'Lobster',height: 1.7,color: Colors.white)),
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
          SizedBox(height: 10,),
          Container(
                     width: 90,
                     height: 90,
                     margin: EdgeInsets.only(top: 5),
                     alignment: Alignment.center,
                     child: Image.asset("assets/images/W3A.jpg",alignment: Alignment.center,fit: BoxFit.fill,)
                     ),
                     SizedBox(height: 20,),
     Padding(
       padding: const EdgeInsets.all(15.0),
       child: Text('تطبيق TravBus هو أول تطبيق مقدم من فريق W3A لتقنية المعلومات . يهدف التطبيق لمساعدة المسافرين في تسهيل عملية الحجز وعملية البحث عن الرحلة المناسبة لهم .حيث يقارن بين أسعار الرحلات المقدمة من أشهر مكاتب السفريات في الجمهورية اليمنية . حيث يقدم هذا التطبيق جميع الرحلات المتوفرة بين جميع المحافظات  الجمهوريةاليمنية , وكذلك بين المدن اليمنية والسعودية.  ',
       style: TextStyle(fontFamily: 'Lobster',fontSize: 17,fontWeight: FontWeight.bold,height: 2,color:secondtextcolor),),
     ) ,  ],
      ),
      
    ),
    );
  }
}