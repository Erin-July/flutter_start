import 'package:flutter/material.dart';
import 'package:startup_namer/Global.dart';
import 'InfoPage.dart';
import 'SetPage.dart';
import 'TagPage.dart';
import 'dart:typed_data';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);
  // final String? id;
  // final String token;
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  // late Image _avatar;
  // Image _avatar = Image.asset('assets/images/tx.jpg');
  // String _avatarMsg = "";
  // late String _id = widget.id.toString().substring(7, 11);
  // late String _token = widget.token;

  @override
  void initState() {
    super.initState();
    print(Global.phoneNumber);
    print(Global.token);
    // _getAvatar();
    if (Global.avatarMsg != "") {
      Fluttertoast.showToast(
          msg: Global.avatarMsg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black45,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  // _getAvatar() async {
  //   var httpClient = new HttpClient();
  //   var url = new Uri.http(
  //       '175.27.189.9', '/user/getAvatar', {'id': Global.phoneNumber});
  //   String result = "";
  //   Image image = Image.asset('assets/images/tx.jpg');
  //   var request = await httpClient.getUrl(url);
  //   var response = await request.close();
  //   if (response.statusCode == HttpStatus.ok) {
  //     Uint8List bytes = await consolidateHttpClientResponseBytes(response);
  //     // print(bytes);
  //     if (bytes.isNotEmpty)
  //       image = Image.memory(bytes);
  //     else
  //       result = 'Error';
  //   } else {
  //     result = 'Error:\nHttp status ${response.statusCode}';
  //   }
  //   if (!mounted) return;
  //   setState(() {
  //     _avatar = image;
  //     _avatarMsg = result;
  //   });
  // }

  Widget _infoField() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => InfoPage()));
      },
      child: Container(
        margin: EdgeInsets.only(left: 40, right: 30),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 70,
              height: 70,
              child: ClipOval(
                child: Global.avatar,
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
                    Global.phoneNumber,
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  new Text(
                    '真实姓名：海*棠',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              child: Icon(
                Icons.chevron_right,
                color: Colors.grey.shade600,
              ),
            ),
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
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TagPage()));
      },
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
            _tag('方舟百级玩家'),
            Spacer(),
            Container(
              child: Icon(
                Icons.chevron_right,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingField() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SetPage()));
      },
      child: Container(
        margin: EdgeInsets.only(left: 40, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.settings_outlined,
              color: Colors.grey.shade600,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '设置',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
            Spacer(),
            Container(
              child: Icon(
                Icons.chevron_right,
                color: Colors.grey.shade600,
              ),
            ),
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
    return Container(
      child: Stack(
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
                  // _divider(),
                  // _editField(),
                  _divider(),
                  _settingField(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
