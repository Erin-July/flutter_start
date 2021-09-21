import 'PinPage.dart';
import 'hotList.dart';
import 'package:flutter/material.dart';

class LifePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color.fromRGBO(248, 246, 241, 1),
          body: Column(children: <Widget>[
            Container(
              height: 50,
              width: 1000,
              child: new ListTile(
                // 前缀
                leading: Icon(Icons.navigation),
                // 标题

                title: Text("拼人从众",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                // 副标题
                //subtitle: Text("常见的底部导航栏组件"),
                // 后缀
                trailing: Icon(Icons.chevron_right),
                // 点击事件
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new PinPage()));
                },
                // 长按事件
                onLongPress: () {
                  print("object");
                },
              ),
              padding: EdgeInsets.symmetric(horizontal: 0),
            ),
            Divider(
              height: 0, // Divider 组件高度
              thickness: 0, // 分割线线宽，分割线居于 Divider 中心
              indent: 20, // 分割线左侧间距
              endIndent: 20, // 分割线右侧间距
              color: Colors.grey, // 分割线颜色
            ),
            Container(
              height: 50,
              width: 600,
              child: new ListTile(
                  // 前缀
                  leading: Icon(Icons.navigation),
                  // 标题

                  title: Text("自习室",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  // 副标题
                  //subtitle: Text("常见的底部导航栏组件"),
                  // 后缀
                  trailing: Icon(Icons.chevron_right),
                  // 点击事件
                  onTap: () {
                    // Navigator.push(
                    //    context,
                    //  MaterialPageRoute(
                    // //    builder:(context)=>new BottomNavigation()
                    //  )
                    //);
                  },
                  // 长按事件
                  onLongPress: () {
                    print("object");
                  }),
              padding: EdgeInsets.symmetric(horizontal: 0),
            ),
            Divider(
              height: 0, // Divider 组件高度
              thickness: 0, // 分割线线宽，分割线居于 Divider 中心
              indent: 20, // 分割线左侧间距
              endIndent: 20, // 分割线右侧间距
              color: Colors.grey, // 分割线颜色
            ),
            Container(
              height: 50,
              width: 400,
              child: new ListTile(
                  // 前缀
                  leading: Icon(Icons.navigation),
                  // 标题

                  title: Text("录音扫描",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  // 副标题
                  //subtitle: Text("常见的底部导航栏组件"),
                  // 后缀
                  trailing: Icon(Icons.chevron_right),
                  // 点击事件
                  onTap: () {
                    // Navigator.push(
                    //    context,
                    //  MaterialPageRoute(
                    // //    builder:(context)=>new BottomNavigation()
                    //  )
                    //);
                  },
                  // 长按事件
                  onLongPress: () {
                    print("object");
                  }),
              padding: EdgeInsets.symmetric(horizontal: 0),
            ),
            Divider(
              height: 0, // Divider 组件高度
              thickness: 0, // 分割线线宽，分割线居于 Divider 中心
              indent: 20, // 分割线左侧间距
              endIndent: 20, // 分割线右侧间距
              color: Colors.grey, // 分割线颜色
            ),
            Container(
              height: 50,
              width: 400,
              child: new ListTile(
                  // 前缀
                  leading: Icon(Icons.navigation),
                  // 标题

                  title: Text("笔记识别",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  // 副标题
                  //subtitle: Text("帮你笔记转pdf哦！"),
                  // 后缀
                  trailing: Icon(Icons.chevron_right),
                  // 点击事件
                  onTap: () {
                    // Navigator.push(
                    //    context,
                    //  MaterialPageRoute(
                    // //    builder:(context)=>new BottomNavigation()
                    //  )
                    //);
                  },
                  // 长按事件
                  onLongPress: () {
                    print("object");
                  }),
              padding: EdgeInsets.symmetric(horizontal: 0),
            )
          ]),
        ));
  }
}
