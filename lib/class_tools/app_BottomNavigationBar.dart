import 'package:flutter/material.dart';
import '../main.dart';
import '../screens/create_an_account_page.dart';
// الشريط السفلي
class AppBottomNavigationBar extends StatefulWidget {
  @override
  _AppBottomNavigationBarState createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
    int select_index_page=0;
     void select_page(BuildContext ctx,int index_page)
  {
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (_){
        if(index_page==0)
        return MyHomePage();
        else
        return Mycreate_account();

      }
    )
    );
  }
  //الانتقال في ايقونة الشريط السفلي
void _createaccount(int index){
  setState(() {
      select_index_page=index;
    });
select_page(context,select_index_page);

}
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
//backgroundColor:  Colors.white,
//selectedItemColor: Color.fromRGBO(0, 0, 77,1),
//unselectedItemColor: Color.fromRGBO(77, 0, 77,1),
currentIndex: select_index_page,
//selectedFontSize: 12,
//unselectedFontSize: 12,
type: BottomNavigationBarType.shifting,
  onTap:_createaccount,
  
items: [BottomNavigationBarItem(
  
 backgroundColor:Color.fromRGBO(77, 0, 77,1),
 
icon:Icon(Icons.home),
label: "الصفحة الرئسية",

),
BottomNavigationBarItem(
  backgroundColor:Color.fromRGBO(77, 0, 77,1),
  icon:Icon(Icons.create),

label: "انشاء حساب",

),
],
),
    );
  }
}

 