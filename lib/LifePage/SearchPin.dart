import 'package:flutter/material.dart';
import 'component/search_static_bar.dart';

class SearchPin extends StatefulWidget {
  @override
  AddFriendState createState(){
    return AddFriendState();
  }
}

class AddFriendState extends State<SearchPin>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color.fromRGBO(248, 246, 241, 1),
          appBar: AppBar(
            //顶部导航栏
            elevation: 3,
            leading:   IconButton(icon:Icon (Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
            //顶部导航栏
            title: Text('拼拼搜索'),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(117, 204, 164, 1),

          ),
          body: Container(
            height: 60,
              width: 400,

              child: SearchStaticBar(
              )
          )


      ),
    );
  }
}