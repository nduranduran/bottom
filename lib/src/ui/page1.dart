import 'package:bottomnavegationbar/src/ui/page2.dart';
import 'package:bottomnavegationbar/src/ui/page3.dart';
import 'package:bottomnavegationbar/src/ui/page4.dart';
import 'package:bottomnavegationbar/src/ui/widgets/buttonnavegation.dart';
import 'package:flutter/material.dart';


class PageUno extends StatefulWidget {
@override
_PageUnoState createState() => _PageUnoState();
}
class _PageUnoState extends State<PageUno> {
int _selectedIndex = 0;
final PageController _pageController = PageController();

@override
Widget build(BuildContext context) {
return WillPopScope(
  onWillPop: ()async {
    if (_pageController.page.round() == _pageController.initialPage) {
      return true;
    } else {
      _pageController.previousPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
      );
      return false;
    }
  }, 
child: Scaffold(
  bottomNavigationBar: BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.portrait), title: Text('Profile')),
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
      BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart), title: Text('Shop'))
    ],
    onTap: _onTappedBar,
    selectedItemColor: Colors.orange,
    currentIndex: _selectedIndex,
  ),
  body: PageView(
    physics:new NeverScrollableScrollPhysics(),
    controller: _pageController,
    onPageChanged: (index) {
       print("ahora se encuentra en la pagina:"+index.toString());
       setState(() {
        _selectedIndex = index;
      });
    },
    children: <Widget>[
      PageDos(),
      PageTres(),
      PageCuatro(),
    ],
  ),
),);
}

void _onTappedBar(int value) {
setState(() {
  _selectedIndex = value;
});
_pageController.jumpToPage(value);
}
}
