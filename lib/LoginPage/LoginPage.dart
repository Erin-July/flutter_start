import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startup_namer/Global.dart';
import '../app.dart';
import 'CertiPage.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/foundation.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey1 = new GlobalKey<FormState>();
  GlobalKey<FormState> _formKey2 = new GlobalKey<FormState>();
  bool passwordVisible = false;
  String? _phoneNumber = "";
  String? _passWord = "";
  int _code = -2;
  String _codeMsg = "";
  // String _token = "";
  @override
  void initState() {
    passwordVisible = false; //设置初始状态
  }

  Widget _phoneField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Form(
            key: _formKey1,
            child: TextFormField(
              // obscureText: false,
              keyboardType: TextInputType.phone,
              inputFormatters: [LengthLimitingTextInputFormatter(11)],
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.grey.shade400,
                  ),
                  hintText: '请输入手机号！',
                  hintStyle: TextStyle(
                      fontSize: 12, color: Color.fromRGBO(119, 119, 119, 1)),
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.all(Radius.circular(10)),
                  //     borderSide: BorderSide(color: Colors.red, width: 5.0)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true),
              validator: (String? val) {
                if (val != null) {
                  if (!RegExp(
                          r"^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$")
                      .hasMatch(val)) {
                    return "手机号格式不正确";
                  } else
                    return null;
                }
              },
              onSaved: (String? val) {
                _phoneNumber = val;
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _passwdField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Form(
            key: _formKey2,
            child: TextFormField(
              obscureText: !passwordVisible,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: Colors.grey.shade400,
                    size: 20,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      //根据passwordVisible状态显示不同的图标
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey.shade400,
                    ),
                    onPressed: () {
                      //更新状态控制密码显示或隐藏
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                  hintText: '请输入你密码！我不偷看哦~',
                  hintStyle: TextStyle(
                      fontSize: 12, color: Color.fromRGBO(119, 119, 119, 1)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true),
              validator: (String? val) {
                if (val != null) {
                  return (val.length < 6 || val.length > 25) ? "密码长度错误" : null;
                } else
                  return null;
              },
              onSaved: (String? val) {
                _passWord = val;
              },
            ),
          )
        ],
      ),
    );
  }

  // Widget _emailPasswordWidget() {
  //   return Column(
  //     children: <Widget>[
  //       _entryField("Phone number"),
  //       _entryField("Password", isPassword: true),
  //     ],
  //   );
  // }

  String generate_MD5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  _getLogin() async {
    var timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    var _pwd = _passWord;
    var newToken;
    var token;
    if (_pwd != null) {
      newToken = generate_MD5(timestamp.toString() + _pwd);
    }
    var httpClient = new HttpClient();
    var url = new Uri.http('175.27.189.9', '/user/loginByPwd', {
      'id': _phoneNumber,
      'timestamp': timestamp.toString(),
      'token': newToken
    });
    // String result;
    // String token = "";
    var request = await httpClient.getUrl(url);
    var response = await request.close();

    if (response.statusCode == HttpStatus.ok) {
      var json = await utf8.decoder.bind(response).join();
      var data = jsonDecode(json);
      _codeMsg = data['msg'];
      _code = data['code'];
      token = data['data']['token'];
      print(data);
      // print(token);
    } else {
      _codeMsg = 'Error:\nHttp status ${response.statusCode}';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      Global.phoneNumber = _phoneNumber.toString();
      // _isCodeTrue = result;
      Global.token = token;
    });
    return _code;
  }

  _getAvatar() async {
    var httpClient = new HttpClient();
    var url = new Uri.http(
        '175.27.189.9', '/user/getAvatar', {'id': Global.phoneNumber});
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
      Global.avatar = image;
      Global.avatarMsg = result;
    });
  }

  _getInfo() async {
    var httpClient = new HttpClient();
    var url = new Uri.http(
        '175.27.189.9', '/user/getInfo', {'id': Global.phoneNumber});
    String result = "";
    var data = {};
    var code = -1;
    var request = await httpClient.getUrl(url);
    var response = await request.close();
    if (response.statusCode == HttpStatus.ok) {
      var json = await utf8.decoder.bind(response).join();
      data = jsonDecode(json);
      code = data['code'];
      result = data['msg'];
    } else {
      result = 'Error:\nHttp status ${response.statusCode}';
    }
    if (!mounted) return;
    setState(() {
      if (code == 0) {
        Global.birth = data['data']['birth'];
        Global.gender = data['data']['gender'];
        Global.nickname = data['data']['nickname'];
        Global.tag = data['data']['tag'];
        Global.school = data['data']['school'];
      } else {
        Global.infoMsg = result;
      }
    });
  }

  void _forSubmitted() async {
    // print('&&&&&');
    var _form1 = _formKey1.currentState;
    var _form2 = _formKey2.currentState;
    // print(_form1);
    // print(_form2);
    if (_form1 != null && _form2 != null) {
      _form1.save();
      _form2.save();
      // print(_form1);
      // print(_form2);
      if (_form1.validate() && _form2.validate()) {
        _code = await _getLogin();
        if (_code == 0) {
          _getAvatar();
          _getInfo();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ScaffoldRoute(index: 0)));
        } else if (_code == 1) {
          Fluttertoast.showToast(
              msg: "用户名或密码错误",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black45,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          Fluttertoast.showToast(
              msg: _codeMsg,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black45,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    }
  }

  Widget _submitButton(String title) {
    return InkWell(
      onTap: () {
        if (title == 'Login') {
          // print('****');
          _forSubmitted();
        } else if (title == 'Register') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CertiPage()));
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
          color: Color.fromRGBO(117, 204, 164, 1),
        ),
        child: Text(
          title,
          style: GoogleFonts.cuprum(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text(
            'or',
            style: TextStyle(color: Color.fromRGBO(119, 119, 119, 1)),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(248, 246, 241, 1),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: height * .12),
              Image.asset(
                'assets/images/ucoo1.png',
                width: 300,
              ),
              SizedBox(height: 25),
              _phoneField(),
              SizedBox(height: 5),
              _passwdField(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.centerRight,
                child: Text('Forgot Password ?',
                    style: TextStyle(
                        fontSize: 10, color: Color.fromRGBO(119, 119, 119, 1))),
              ),
              SizedBox(height: 30),
              _submitButton('Login'),
              SizedBox(height: height * .12),
              _divider(),
              _submitButton('Register'),
            ],
          )),
        ),
      ),
    );
  }
}
