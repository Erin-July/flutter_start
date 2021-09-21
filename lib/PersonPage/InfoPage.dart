// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_format/date_format.dart';
import 'dart:typed_data';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key, this.id = "123456789", this.token = ""})
      : super(key: key);
  final String? id;
  final String token;
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  String _keyword = 'inver';
  int? sex = 2;
  DateTime _selectedDate = DateTime.utc(2000, 1, 1);

  Image _avatar = Image.asset('assets/images/tx.jpg');
  String _avatarMsg = "";
  String _infoMsg = "";
  int _infoCode = -1;
  late String _id = widget.id.toString();
  late String _token = widget.token;
  var _info = {};
  // var _info = {};
  int _birthY = 2000, _birthM = 1, _birthD = 1;

  void init() async {
    await _getAvatar();
    await _getInfo();
    if (_avatarMsg != "") {
      Fluttertoast.showToast(
          msg: _avatarMsg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black45,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    if (_infoMsg != "OK" || _infoCode == 2) {
      Fluttertoast.showToast(
          msg: _infoMsg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black45,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    // print(_avatarMsg);
    // print(_infoMsg);
    // print(_info);
    if (_avatarMsg == "" && _infoMsg == "OK") {
      print("**");
      print(_info);
      String _birth = (_info['data']['birth']);
      _birthY = int.parse(_birth.split('-')[0]);
      _birthM = int.parse(_birth.split('-')[1]);
      _birthD = int.parse(_birth.split('-')[2]);
      _selectedDate = DateTime.utc(_birthY, _birthM, _birthD);
      sex = _info['data']['gender'];
      _keyword = _info['data']['nickname'];
      print(_selectedDate);
      print(sex);
      print(_keyword);
    }
  }

  @override
  void initState() {
    super.initState();
    // _getAvatar();
    // _getInfo();
    init();
    print(widget.id);
    print(widget.token);
  }

  _getAvatar() async {
    var httpClient = new HttpClient();
    var url = new Uri.http('175.27.189.9', '/user/getAvatar', {'id': _id});
    String result = "";
    Image image = Image.asset('assets/images/tx.jpg');
    var request = await httpClient.getUrl(url);
    var response = await request.close();
    if (response.statusCode == HttpStatus.ok) {
      Uint8List bytes = await consolidateHttpClientResponseBytes(response);
      image = Image.memory(bytes);
    } else {
      result = 'Error:\nHttp status ${response.statusCode}';
    }
    if (!mounted) return;
    setState(() {
      _avatar = image;
      _avatarMsg = result;
    });
  }

  _getInfo() async {
    var httpClient = new HttpClient();
    var url = new Uri.http('175.27.189.9', '/user/getInfo', {'id': _id});
    String result = "";
    var data = {};
    var code = -1;
    // String token = "";
    // Image image = Image.asset('assets/images/hxy.bmp');
    // Image image;
    // Uint8List _image;
    var request = await httpClient.getUrl(url);
    var response = await request.close();
    // print('***');
    // print(response.statusCode);
    if (response.statusCode == HttpStatus.ok) {
      // print('***');
      // Uint8List bytes = await consolidateHttpClientResponseBytes(response);
      // print(bytes);
      // image = Image.memory(bytes);
      var json = await utf8.decoder.bind(response).join();
      data = jsonDecode(json);
      code = data['code'];
      result = data['msg'];
      // result = data['msg'];
      // token = data['data']['token'];
      // print(result);
      // print(data);
      // print(token);
      // return bytes;
    } else {
      result = 'Error:\nHttp status ${response.statusCode}';
    }
    if (!mounted) return;
    setState(() {
      _info = data;
      _infoMsg = result;
      _infoCode = code;
    });
    // return image;
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
                  text: '${this._keyword}', //判断keyword是否为空
                  // 保持光标在最后
                  selection: TextSelection.fromPosition(
                    TextPosition(
                        affinity: TextAffinity.downstream,
                        offset: '${this._keyword}'.length),
                  ),
                ),
              ),
              onChanged: (String value) {
                setState(() {
                  this._keyword = value;
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

  Widget _submitButton() {
    return InkWell(
      onTap: () {},
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
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.white,
        //   ),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
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
                        child: _avatar,
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
