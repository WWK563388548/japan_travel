import 'package:flutter/material.dart';
import 'package:japan_travel/pages/home_page.dart';
import 'package:japan_travel/pages/my_page.dart';
import 'package:japan_travel/pages/search_page.dart';
import 'package:japan_travel/pages/travel_note_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {

  final PageController _controller = PageController(
    initialPage: 0, // 初始显示第0个tab
  );
  final _iconInactiveColor = Colors.grey;
  final _iconActiveColor = Colors.blue;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelNotePage(),
          MyPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          print(index);
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: _iconActiveColor,
        unselectedItemColor: _iconInactiveColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              activeIcon: Icon(
                Icons.home,
              ),
              label: "首页"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              activeIcon: Icon(
                Icons.search,
              ),
            label: "搜索"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.camera_alt,
              ),
              activeIcon: Icon(
                Icons.camera_alt,
              ),
              label: "旅拍"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              activeIcon: Icon(
                Icons.account_circle,
              ),
              label: "我的"
          ),
        ],
      ),
    );
  }

}