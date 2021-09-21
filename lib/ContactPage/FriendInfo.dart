import 'package:flutter/material.dart';
import 'package:startup_namer/MsgPage/ChatPage.dart';
import 'dart:convert';
import 'dart:io';

class FriendInfo extends StatefulWidget {
  @override
  FriendInfoState createState() {
    return FriendInfoState();
  }
}

class FriendInfoState extends State<FriendInfo> {
  var _friendInfo = 0;

  _getFriendInfo() async {
    // var url = new Uri.http('175.27.189.9','/common/getInfo');
    var url = new Uri.http('175.27.189.9','/contacts/getList',{'id':'18822197739','timestamp':new DateTime.now().millisecondsSinceEpoch});
    var httpClient = new HttpClient();
    int result;
      var request = await httpClient.getUrl(url);
      var response = await request.close();
      print(response.statusCode);
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        print(data);
        result = data["data"]["timestamp"];
      } else {
        result = -1;
      }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _friendInfo = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color.fromRGBO(248, 246, 241, 1),
          //顶部导航栏
          //返回上一页
          body: Column(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              new Text('$_friendInfo.'),
              new RaisedButton(
                onPressed: _getFriendInfo,
                child: new Text('Get friend info'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                      return ChatPage();
                    }));
                  },
                  // color: Colors.green,
                  child: Text("to ChatPage"))
            ],
          )),
    );
  }
}
