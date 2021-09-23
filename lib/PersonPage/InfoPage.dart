// import 'dart:ffi';
import 'package:startup_namer/Global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_format/date_format.dart';
import 'dart:typed_data';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);
  // final String? id;
  // final String token;
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  String _keyword = Global.nickname;
  int? sex = Global.gender;
  int _setInfoCode = -1;
  String _setInfoCodeMsg = "";

  DateTime _selectedDate = DateTime.utc(
      int.parse(Global.birth.split('-')[0]),
      int.parse(Global.birth.split('-')[1]),
      int.parse(Global.birth.split('-')[2]));

  void init() {
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
    if (Global.infoMsg != "") {
      Fluttertoast.showToast(
          msg: Global.infoMsg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black45,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  void initState() {
    super.initState();
    init();
    print(Global.phoneNumber);
    print(Global.token);
  }

  Future<void> _setDate() async {
    print(_selectedDate);
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (date == null) return;

    setState(() {
      _selectedDate = date;
    });
  }

  Widget _nkField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        // border: Border.all(
        //   color: Color.fromRGBO(91, 91, 91, 1),
        //   width: 2.0,
        // ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Container(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.mood_outlined,
                  color: Colors.grey.shade500,
                  // size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '这里可以修改自己的昵称！',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            // alignment: Alignment.center,
            // width: 200,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              controller: TextEditingController.fromValue(
                TextEditingValue(
                  text: '${_keyword}', //判断keyword是否为空
                  // 保持光标在最后
                  selection: TextSelection.fromPosition(
                    TextPosition(
                        affinity: TextAffinity.downstream,
                        offset: '${_keyword}'.length),
                  ),
                ),
              ),
              onChanged: (String value) {
                setState(() {
                  _keyword = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _genderField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        // border: Border.all(
        //   color: Color.fromRGBO(91, 91, 91, 1),
        //   width: 2.0,
        // ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Container(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.transgender_outlined,
                  color: Colors.grey.shade500,
                  // size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '这里可以修改自己的性别！',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            // width: 200,
            child: Row(
              children: <Widget>[
                Flexible(
                  child: RadioListTile(
                    value: 0,
                    onChanged: (int? value) {
                      setState(() {
                        this.sex = value;
                      });
                    },
                    groupValue: this.sex,
                    secondary: Icon(
                      Icons.male,
                      color: Colors.blue.shade600,
                    ),
                    selected: this.sex == 0,
                  ),
                ),
                Flexible(
                  child: RadioListTile(
                    value: 1,
                    onChanged: (int? value) {
                      setState(() {
                        this.sex = value;
                      });
                    },
                    groupValue: this.sex,
                    secondary: Icon(
                      Icons.female,
                      color: Colors.pink.shade300,
                    ),
                    selected: this.sex == 1,
                  ),
                ),
                Flexible(
                  child: RadioListTile(
                    value: 2,
                    onChanged: (int? value) {
                      setState(() {
                        this.sex = value;
                      });
                    },
                    groupValue: this.sex,
                    secondary: Icon(
                      Icons.visibility_off,
                      color: Colors.grey.shade700,
                    ),
                    selected: this.sex == 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _birthField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        // border: Border.all(
        //   color: Color.fromRGBO(91, 91, 91, 1),
        //   width: 2.0,
        // ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Container(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.cake_outlined,
                  color: Colors.grey.shade500,
                  // size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '这里可以修改自己的生日！',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          TextButton(
            child: Text(
              "${formatDate(_selectedDate, [
                    yyyy,
                    ' 年 ',
                    mm,
                    ' 月 ',
                    dd,
                    ' 日 '
                  ])}",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade900, fontSize: 16),
            ),
            onPressed: () {
              _setDate();
            },
          ),
        ],
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

  String generate_MD5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  _postSetInfo() async {
    print('_token:' + Global.token);
    var timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    var httpClient = new HttpClient();
    var newToken = generate_MD5(timestamp.toString() + Global.token);
    var url = new Uri.http('175.27.189.9', '/user/setInfo');
    var request = await httpClient.postUrl(url);

    String msg = "";
    int code = -2;
    // int _code = 1;

    String queryString = Uri(queryParameters: {
      'id': Global.phoneNumber,
      'timestamp': timestamp.toString(),
      'token': newToken,
      'birth': formatDate(_selectedDate, [
        yyyy,
        '-',
        mm,
        '-',
        dd,
      ]),
      'nickname': _keyword,
      'gender': sex.toString(),
      'school': Global.school,
    }).query;

    print(queryString);
    request.headers.add("content-type", "application/x-www-form-urlencoded");
    request.write(queryString);
    var response = await request.close();
    // print(response.statusCode);
    if (response.statusCode == HttpStatus.ok) {
      var json = await utf8.decoder.bind(response).join();
      var data = jsonDecode(json);
      code = data['code'];
      msg = data['msg'];
      print(data);
    } else {
      msg = 'Error:\nHttp status ${response.statusCode}';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _setInfoCode = code;
      _setInfoCodeMsg = msg;
    });
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () async {
        await _postSetInfo();
        print(_setInfoCode);
        if (_setInfoCode == 0) {
          Global.birth = formatDate(_selectedDate, [
            yyyy,
            '-',
            mm,
            '-',
            dd,
          ]);
          Global.nickname = _keyword;
          Global.gender = int.parse(sex.toString());
          Fluttertoast.showToast(
              msg: "修改成功",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black45,
              textColor: Colors.white,
              fontSize: 16.0);
          Future.delayed(Duration(milliseconds: 1000), () {
            Navigator.of(context).pop(_keyword);
          });
        } else {
          Fluttertoast.showToast(
              msg: _setInfoCodeMsg,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black45,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      child: Container(
        // width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          // gradient: LinearGradient(
          //     begin: Alignment.centerLeft,
          //     end: Alignment.centerRight,
          //     colors: [Color(0xfffbb448), Color(0xfff7892b)])
          color: Color.fromRGBO(249, 217, 142, 1),
        ),
        child: Text(
          'Save',
          style: GoogleFonts.cuprum(fontSize: 20, color: Colors.grey.shade600),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 246, 241, 1),
      appBar: AppBar(
        //顶部导航栏
        // automaticallyImplyLeading: true,
        title: Text(
          'My Profile',
          style: GoogleFonts.cuprum(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(117, 204, 164, 1),
        elevation: 2,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(Global.nickname),
        ),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: ClipOval(
                        child: Global.avatar,
                      ),
                    ),
                    // _divider(),
                    SizedBox(height: 10),
                    _nkField(),
                    _genderField(),
                    _birthField(),
                    SizedBox(height: 20),
                    _submitButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
