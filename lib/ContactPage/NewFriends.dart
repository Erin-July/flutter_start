import 'package:flutter/material.dart';

class NewFriends extends StatefulWidget {
  @override
  NewFriendsState createState() {
    return NewFriendsState();
  }
}

class NewFriendsState extends State<NewFriends> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(248, 246, 241, 1),
        //顶部导航栏
        appBar: AppBar(
          //返回上一页
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text('NewFriends'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(117, 204, 164, 1),
          elevation: 2,
        ),
      ),
    );
  }
}
