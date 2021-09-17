// import 'dart:html';

// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'MsgPage/MsgPage.dart';
import 'ContactPage/ContactPage.dart';
import 'LifePage/LifePage.dart';
import 'PersonPage/PersonPage.dart';
import 'package:google_fonts/google_fonts.dart';

class ScaffoldRoute extends StatefulWidget {
  ScaffoldRoute({Key? key, this.index = 0}) : super(key: key);
  final int index;
  @override
  _ScaffoldRouteState createState() => new _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  late int _selectedIndex = widget.index;
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.textsms),
      title: Text(
        'Messages',
        style: TextStyle(fontSize: 10),
      ),
      // label: "Messages",
      activeIcon: Icon(Icons.forum),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sentiment_neutral),
      title: Text(
        'Contacts',
        style: TextStyle(fontSize: 10),
      ),
      // label: "Contacts",
      activeIcon: Icon(Icons.sentiment_very_satisfied),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.other_houses),
      title: Text(
        'Life',
        style: TextStyle(fontSize: 10),
      ),
      // label: "Life",
      activeIcon: Icon(Icons.house),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline_outlined),
      title: Text(
        'Me',
        style: TextStyle(fontSize: 10),
      ),
      // label: "Me",
      activeIcon: Icon(Icons.hail),
    ),
  ];

  final pages = [MsgPage(), ContactPage(), LifePage(), PersonPage()];
  final titles = ["Messages", "Contacts", "Life", "Me"];
  // final titles = [Text("Messages"), Text("Contacts"), Text("Life"), Text("Me")];

  @override
  Widget build(BuildContext context) {
    // _selectedIndex = widget.index;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(248, 246, 241, 1),
        appBar: AppBar(
          //顶部导航栏
          title: Text(
            titles[_selectedIndex],
            style: GoogleFonts.cuprum(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          // title: titles[_selectedIndex],
          centerTitle: true,
          backgroundColor: Color.fromRGBO(117, 204, 164, 1),
          elevation: 2,
          actions: _selectedIndex == 1
              ? <Widget>[
                  //导航栏右侧菜单
                  IconButton(icon: Icon(Icons.add), onPressed: () {}),
                ]
              : <Widget>[],
        ),
        // drawer: new MyDrawer(), //抽屉
        bottomNavigationBar: BottomNavigationBar(
          // 底部导航
          items: bottomNavItems,
          currentIndex: _selectedIndex,
          fixedColor: Color.fromRGBO(249, 217, 142, 1),
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          elevation: 2,
          // unselectedFontSize: 12.0,
          // selectedFontSize: 12.0,
          // unselectedItemColor: Color.fromRGBO(117, 204, 164, 1),
        ),
        body: pages[_selectedIndex],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // void _onAdd() {}
}
