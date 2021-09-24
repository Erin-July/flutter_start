import 'package:flutter/material.dart';
import 'component/SearchField.dart';
import 'StrangerRes.dart';

class AddFriend extends StatefulWidget {
  @override
  AddFriendState createState() {
    return AddFriendState();
  }
}

class AddFriendState extends State<AddFriend> {
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
            title: Text('addFriend'),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(117, 204, 164, 1),
            elevation: 2,
          ),
          body: Container(height: 60, width: 400,
              color: Color.fromRGBO(248, 246, 241, 1),
              child: SearchWidget(StrangerRes()))),
    );
  }
}
