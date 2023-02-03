import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart'; // splashscreen: ^1.3.5
import 'package:flutter_localizations/flutter_localizations.dart';//اتجاة الكتابة
import '../main.dart';
import '../screens/settings.dart';
class mystartpage extends StatefulWidget {
  @override
  _mystartpageState createState() => _mystartpageState();
}

class _mystartpageState extends State<mystartpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
   supportedLocales: [
    Locale('ar', 'AE'), // English, no country code
  ],

      home: Scaffold(
        body: 
        SplashScreen(
            photoSize: 250,
            
            
            gradientBackground: LinearGradient(
                begin : Alignment.topCenter,
  end :Alignment.bottomCenter,
  colors: [
              
  fristappcolor,
  secondappcolor,
  
   ] ),
    
          image: Image.asset("assets/images/bus5.png",alignment: Alignment.bottomCenter,),
          seconds: 1,
          navigateAfterSeconds:MyApp(),
          loaderColor: thridtextcolor,  
          loadingText: Text('...Loading',style: TextStyle(fontWeight:FontWeight.bold,color: Color.fromRGBO(255, 255, 255, 0.8), fontSize: 18),),
          ),
           
      ),
    );
  }
}


