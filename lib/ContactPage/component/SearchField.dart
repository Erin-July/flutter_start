import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../SearchResult.dart';

class SearchWidget extends StatelessWidget {
  Widget? Page;
  SearchWidget(Widget widget) {
    this.Page = widget;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        width: double.infinity,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(0),
        //圆角边框
        decoration: BoxDecoration(
          //背景颜色
          color: Color.fromRGBO(248, 246, 241, 1),
          // color: Colors.red,
          //背景圆角
          borderRadius: BorderRadius.all(
            //四个角的圆角
            Radius.circular(10),
          ),
        ),
        //竖直方向线性排开
        child: Column(
          //包裹
          mainAxisSize: MainAxisSize.min,
          //左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              //上边距
              margin: EdgeInsets.only(top: 0),
              //内边距
              padding: EdgeInsets.only(left: 12, right: 12),
              //边框
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      // autofocus: false,
                      decoration: InputDecoration(
                        hintText: "搜索 ",
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: new Icon(Icons.search),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => this.Page!));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
