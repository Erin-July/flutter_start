import 'package:flutter/material.dart';

class FriendInfo extends StatefulWidget {
  const FriendInfo({Key? key}) : super(key: key);

  @override
  FriendInfoState createState() => FriendInfoState();
}

class FriendInfoState extends State<FriendInfo> {
  Widget _infoField() {
    return Container(
      child: Container(
        margin: EdgeInsets.only(left: 40, right: 30),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 70,
              height: 70,
              child: ClipOval(
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40),
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    'xxx',
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  new Text(
                    '姓名：***',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _tag(String title) {
    return Container(
      height: 28,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(left: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(20.0),
        color: Color.fromRGBO(249, 217, 142, 1),
      ),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(248, 246, 241, 1),
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _tagField() {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 40, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.style_outlined,
              color: Colors.grey.shade600,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '标签',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
            SizedBox(
              width: 10,
            ),
            _tag('K歌之王'),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Divider(
          thickness: 1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return Container();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // appBar: AppBar(
          //   //返回上一页
          //   leading: IconButton(
          //       icon: Icon(Icons.arrow_back),
          //       onPressed: () {
          //         Navigator.pop(context);
          //       }),
          //   title: Text('addFriend'),
          //   centerTitle: true,
          //   backgroundColor: Color.fromRGBO(117, 204, 164, 1),
          //   elevation: 2,
          // ),
          body: Column(
            children: <Widget>[
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 40),
                margin: EdgeInsets.symmetric(vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      _infoField(),
                      _divider(),
                      _tagField(),
                      _divider(),
                      TextButton(onPressed: () {}, child: Text('发消息')),
                      TextButton(onPressed: () {}, child: Text('删除好友')),
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
