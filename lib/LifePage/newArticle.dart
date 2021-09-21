import 'package:flutter/material.dart';
import 'component/search_static_bar.dart';

class newArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color.fromRGBO(248, 246, 241, 1),
          appBar: AppBar(
            //顶部导航栏
            title: Text('发个拼拼，吃个桃桃'),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(117, 204, 164, 1),
            elevation: 2,
          ),
          body: Column(children: [
            Container(
              color: Color.fromRGBO(248, 246, 241, 1),

              constraints: BoxConstraints(
                  maxHeight: screenHeight*0.05,
                  maxWidth: screenWidth,
                  minHeight: screenHeight*0.05,
                  minWidth: screenWidth),
              padding: EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 8.0, bottom: 4.0),
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration.collapsed(
                  hintText: "请输入标题",
                ),
              ),),
            Container(
              color: Color.fromRGBO(248, 246, 241, 1),
              constraints: BoxConstraints(
                  maxHeight: screenHeight*0.5,
                  maxWidth: screenWidth,
                  minHeight: screenHeight*0.4,
                  minWidth: screenWidth),
              padding: EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 8.0, bottom: 4.0),
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration.collapsed(
                  hintText: "发个帖子吧",
                ),
              ),
            ),
            Container(

              child : IconButton(color:Colors.blue,iconSize: 40,icon: Icon(Icons.done),
                onPressed: () {
                  //print('添加联系人');
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => new newArticle()));
                })
              ,
            )
          ])),
    );
  }
}
