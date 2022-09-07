import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart'; // splashscreen: ^1.3.5
import 'package:flutter_localizations/flutter_localizations.dart';//اتجاة الكتابة
import '../main.dart';
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
            photoSize: 200,
            backgroundColor: Colors.white,
            //لو اريد تدرج في اللوان
           /* gradientBackground: LinearGradient(colors: [
  Color.fromRGBO(0, 0, 77,1),
  Color.fromRGBO(77, 0, 77,1),
  Color.fromRGBO(0, 0, 77,1), ] ),*/
    
          image: Image.asset("assets/images/bus.png",alignment: Alignment.center),
          seconds: 1,
          navigateAfterSeconds:MyApp(),
          loaderColor: Color.fromRGBO(0, 0, 77, 1),  
          loadingText: Text('...Loading',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),),
          ),
           
      ),
    );
  }
}


