// import 'dart:html';

import 'dart:ffi';

import 'newArticle.dart';
import 'textDetail.dart';
import 'package:flutter/material.dart';
import 'fuckq.dart';

import 'SearchPin.dart';
import 'package:flutter/material.dart';
import '../MsgPage/MsgPage.dart';
import '../ContactPage/ContactPage.dart';
import '../LifePage/LifePage.dart';
import '../PersonPage/PersonPage.dart';
import '../ContactPage/AddFriend.dart';
import 'hotList.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class PinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // _selectedIndex = widget.index;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color.fromRGBO(248, 246, 241, 1),
          appBar: AppBar(
            //顶部导航栏
            title: Text("拼人从众"),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(117, 204, 164, 1),
            elevation: 3,
            leading: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new newArticle()));
                }),
            actions: <Widget>[
              //导航栏右侧菜单

              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    //print('添加联系人');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new SearchPin()));
                  }),
            ],
          ),
          body: new ListView(
            children: <Widget>[
              SizedBox(
                height: 0.0,
              ),
              hotCard(itemList[0], context),
              hotCard(itemList[1], context),
              hotCard(itemList[2], context),
              hotCard(itemList[3], context),
              hotCard(itemList[4], context),
            ],
          )
          /*new ListView(
          children: <Widget>[
            new Container(
              child: Container(
                height: 120,
                margin: EdgeInsets.all(10),
                decoration: new BoxDecoration(
                  border:
                    Border.all(color:Colors.red, width: 3),
                  borderRadius: new BorderRadius.all(
                    new Radius.circular(20.0),
                  ),
                   image: new DecorationImage(image: new NetworkImage('https://www.baidu.com/img/flexible/logo/pc/result@2.png'),
                   fit: BoxFit.cover)
                ),
              ),
            )
          ],
        ),*/
          // drawer: new MyDrawer(), //抽屉
          ),
    );
  }

  Widget hotCard(RankItem item, context) {
    return new Container(
      decoration: new BoxDecoration(
        color: Color.fromRGBO(248, 246, 241, 1),
      ),
      child: new TextButton(
          onPressed: () {
            print('111');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new textDetail()));
          },
          child: new Container(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                    flex: 1,
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          child: new Text(item.order,
                              style: new TextStyle(
                                  color: item.order.compareTo("03") <= 0
                                      ? Colors.red
                                      : Colors.green,
                                  fontSize: 18.0)),
                          alignment: Alignment.topLeft,
                        )
                      ],
                    )),
                new Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              item.title,
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  height: 1.1,
                                  color: Colors.black),
                            ),
                            padding:
                                const EdgeInsets.only(bottom: 10.0, right: 4.0),
                            alignment: Alignment.topLeft,
                          ),
                          /*item.mark != null ?
                          new Container(
                              child: new Text(item.mark, overflow: TextOverflow.ellipsis, style: new TextStyle(color: Colors.black)),
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(bottom: 8.0,right: 4.0)
                          ) : new Container(),*/
                          new Container(
                            child: new Text(item.hotNum,
                                style: new TextStyle(color: Colors.grey)),
                            alignment: Alignment.topLeft,
                          )
                        ],
                      ),
                    )),
                new Expanded(
                    flex: 3,
                    child: Center(
                      child: new AspectRatio(
                          aspectRatio: 3.0 / 2.0,
                          child: new Container(
                            foregroundDecoration: new BoxDecoration(
                                image: new DecorationImage(
                                  image: new NetworkImage(item.imgUrl),
                                  centerSlice: new Rect.fromLTRB(
                                      270.0, 180.0, 1360.0, 730.0),
                                ),
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(6.0))),
                          )),
                    ))
              ],
            ),
          )),
    );
  }
}
