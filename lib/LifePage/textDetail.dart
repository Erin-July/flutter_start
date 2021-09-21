import 'newArticle.dart';
import 'package:flutter/material.dart';
import 'component/search_static_bar.dart';

class textDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color.fromRGBO(248, 246, 241, 1),
          appBar: AppBar(
            //顶部导航栏
            title: Text('看个帖子，吃个桃桃'),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(117, 204, 164, 1),
            elevation: 2,
          ),
          body: Column(children: [
            Container(
              height: 60,
              width: 400,
              child: new Text(
                  '为了在整个应用中共享颜色和字体样式，我们可以使用主题。定义主题有两种方式：全局主题或使用Theme来定义应用程序局部的颜色和字体样式。 事实上，全局主题只是由应用程序根MaterialApp创建的Theme ！'),
            ),
          ])),
    );
  }
}
