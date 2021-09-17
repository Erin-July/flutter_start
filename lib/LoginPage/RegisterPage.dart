import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../PersonPage/PersonPage.dart';
import '../app.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

class RegisterPage extends StatefulWidget {
  /// 用户点击时的回调函数。
  // Function onTimerFinish;

  RegisterPage({
    Key? key,
    // required this.onTimerFinish,
  }) : super(key: key);

  // RegisterPage({
  // this.countdown: 60,
  // required this.onTapCallback,
  // this.available: false,
  // });

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _formKey1 = new GlobalKey<FormState>();
  GlobalKey<FormState> _formKey2 = new GlobalKey<FormState>();
  GlobalKey<FormState> _formKey3 = new GlobalKey<FormState>();
  GlobalKey<FormState> _formKey4 = new GlobalKey<FormState>();
  String? _phoneNumber = "";
  String? _ackCode = "";
  String? _passWord = "";
  String? _ackPassWord = "";
  String? _codeMsg = "";
  String _token = "";
  String _passCodeMsg = "";
  int _passCode = -2;
  int _isCodeTrue = -1;

  /// 倒计时的计时器。
  Timer _timer = new Timer(Duration(), () {});

  /// 当前倒计时的秒数。
  int _countdownTime = 0;

  bool passwordVisible1 = false;
  bool passwordVisible2 = false;

  @override
  void initState() {
    super.initState();
    passwordVisible1 = false; //设置初始状态
    passwordVisible2 = false;
  }

  void startCountdownTimer() {
    // _color = Colors.grey.shade300;
    _timer = Timer.periodic(
        Duration(seconds: 1),
        (Timer timer) => {
              setState(() {
                if (_countdownTime < 1) {
                  // widget.onTimerFinish();
                  _timer.cancel();
                } else {
                  _countdownTime = _countdownTime - 1;
                }
              })
            });
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }

  static bool isChinaPhoneLegal(String str) {
    return RegExp(
            r"^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$")
        .hasMatch(str);
  }

  _getCode() async {
    var httpClient = new HttpClient();
    var url =
        new Uri.http('175.27.189.9', '/user/loginPre', {'id': _phoneNumber});
    String result;
    try {
      var request = await httpClient.getUrl(url);
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await utf8.decoder.bind(response).join();
        var data = jsonDecode(json);

        result = await data;
        print(data);
      } else {
        result = 'Error:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting Code';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ackCode = result;
    });
  }

  _getAckCode() async {
    var httpClient = new HttpClient();
    var url = new Uri.http(
        '175.27.189.9', '/user/login', {'id': _phoneNumber, 'code': _ackCode});
    // String result;
    // int _code = 1;
    var request = await httpClient.getUrl(url);
    var response = await request.close();

    if (response.statusCode == HttpStatus.ok) {
      var json = await utf8.decoder.bind(response).join();
      var data = jsonDecode(json);
      // _code = data['code'];
      // result = data['msg'];
      _codeMsg = data['msg'];
      _token = data['data']['token'];
      _isCodeTrue = data['code'];
      print(data);
    } else {
      _codeMsg = 'Error:\nHttp status ${response.statusCode}';
    }

    // return _token;
    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    // setState(() {
    //   _codeMsg = result;
    //   _isCodeTrue = _code;
    // });
  }

  String generate_MD5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  _postRegister() async {
    print('_token:' + _token);
    var timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    var httpClient = new HttpClient();
    var newToken = generate_MD5(timestamp.toString() + _token);
    var url = new Uri.http('175.27.189.9', '/user/newPwd');
    var request = await httpClient.postUrl(url);

    // String result;
    // int _code = 1;

    String queryString = Uri(queryParameters: {
      'id': _phoneNumber,
      'timestamp': timestamp.toString(),
      'token': newToken,
      'pwd': _passWord,
    }).query;

    print(queryString);
    request.headers.add("content-type", "application/x-www-form-urlencoded");
    request.write(queryString);
    var response = await request.close();
    // print(response.statusCode);
    if (response.statusCode == HttpStatus.ok) {
      var json = await utf8.decoder.bind(response).join();
      var data = jsonDecode(json);
      _passCode = data['code'];
      _passCodeMsg = data['msg'];
      print(data);
    } else {
      _passCodeMsg = 'Error:\nHttp status ${response.statusCode}';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    // setState(() {
    //   // _codeMsg = result;
    //   // _isCodeTrue = _code;
    // });
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
            // Text('Back',
            //     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
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
              // maxLength: 11,
              inputFormatters: [
                // WhitelistingTextInputFormatter.digitsOnly, //只允许输入数字
                // FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                LengthLimitingTextInputFormatter(11)
              ],
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.smartphone,
                    color: Colors.grey.shade400,
                    // size: 20,
                  ),
                  hintText: '输入你的手机号！',
                  hintStyle: TextStyle(
                      fontSize: 12, color: Color.fromRGBO(119, 119, 119, 1)),
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.all(Radius.circular(10)),
                  //     borderSide: BorderSide(color: Colors.red, width: 5.0)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true),
              // onChanged: (String? val) {},
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
          ),
        ],
      ),
    );
  }

  Widget _ackField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        // border: Border.all(
        //   color: Color.fromRGBO(91, 91, 91, 1),
        //   width: 2.0,
        // ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Form(
              key: _formKey2,
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(6)],
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.grey.shade400,
                    size: 20,
                  ),
                  border: InputBorder.none,
                  hintText: '验证码是什么呢！',
                  hintStyle: TextStyle(
                      fontSize: 12, color: Color.fromRGBO(119, 119, 119, 1)),
                  fillColor: Colors.white,
                  filled: true,
                ),
                // validator: (String? val) {
                //   if (val != null) {
                //     if (_isCodeTrue != 0)
                //       return _codeMsg;
                //     else
                //       return null;
                //   } else
                //     return null;
                // },
                onSaved: (String? val) {
                  _ackCode = val;
                },
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              height: 35,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: _countdownTime > 0
                      ? Colors.grey.shade300
                      : Color.fromRGBO(249, 217, 142, 1),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              // child: _ack(),
              child: TextButton(
                child: Text(
                  _countdownTime > 0 ? '$_countdownTime' + 's后重新获取' : '获取验证码',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
                ),
                onPressed: () {
                  var _form1 = _formKey1.currentState;
                  if (_form1 != null) {
                    _form1.save();
                    if (_form1.validate()) {
                      if (_countdownTime == 0) {
                        print(_phoneNumber);
                        _getCode();
                        setState(() {
                          _countdownTime = 60;
                        });
                        //开始倒计时
                        startCountdownTimer();
                      }
                    }
                  }
                },
              ),
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
            key: _formKey3,
            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              obscureText: !passwordVisible1,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      //根据passwordVisible状态显示不同的图标
                      passwordVisible1
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey.shade400,
                    ),
                    onPressed: () {
                      //更新状态控制密码显示或隐藏
                      setState(() {
                        passwordVisible1 = !passwordVisible1;
                      });
                    },
                  ),
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: Colors.grey.shade400,
                    size: 20,
                  ),
                  hintText: '请输入6-18位密码！',
                  hintStyle: TextStyle(
                      fontSize: 12, color: Color.fromRGBO(119, 119, 119, 1)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.white,
                      // width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.white,
                      // width: 2.0,
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
          ),
        ],
      ),
    );
  }

  Widget _ackpasswdField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Form(
            key: _formKey4,
            child: TextFormField(
              obscureText: !passwordVisible2,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      //根据passwordVisible状态显示不同的图标
                      passwordVisible2
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey.shade400,
                    ),
                    onPressed: () {
                      //更新状态控制密码显示或隐藏
                      setState(() {
                        passwordVisible2 = !passwordVisible2;
                      });
                    },
                  ),
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: Colors.grey.shade400,
                    size: 20,
                  ),
                  hintText: '请再次输入密码！',
                  hintStyle: TextStyle(
                      fontSize: 12, color: Color.fromRGBO(119, 119, 119, 1)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.white,
                      // width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.white,
                      // width: 2.0,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true),
              validator: (String? val) {
                return val != _passWord ? "两次密码输入不一致" : null;
              },
              onSaved: (String? val) {
                _ackPassWord = val;
              },
            ),
          ),
        ],
      ),
    );
  }

  void _forSubmitted() async {
    // var _form1 = _formKey1.currentState;
    var _form2 = _formKey2.currentState;
    var _form3 = _formKey3.currentState;
    var _form4 = _formKey4.currentState;
    // print(_form2);
    // print(_form3);
    // print(_form4);
    if (_form2 != null && _form3 != null && _form4 != null) {
      _form2.save();
      _form3.save();
      _form4.save();
      print(_token);
      await _getAckCode();
      print('**********');
      print(_codeMsg);
      print(_isCodeTrue);
      print(_token);
      if (_isCodeTrue != 0) {
        Fluttertoast.showToast(
            msg: _codeMsg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black45,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        if (_form3.validate() && _form4.validate()) {
          print(_token);
          await _postRegister();
          print('_passcode');
          print(_passCode);
          if (_passCode == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScaffoldRoute(
                  index: 3,
                ),
              ),
            );
          } else {
            Fluttertoast.showToast(
                msg: _passCodeMsg,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black45,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          //     print(_phoneNumber);
          //     print(_ackCode);

        }
      }
    }
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        // _codeSubmitted();
        _forSubmitted();
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ScaffoldRoute(
        //               index: 3,
        //             )));
      },
      child: Container(
        // width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
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
          'Complete!',
          style: GoogleFonts.cuprum(fontSize: 20, color: Colors.white),
        ),
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
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .15),
                    // Image.asset(
                    //   'assets/images/upp.png',
                    //   width: 180,
                    // ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      alignment: Alignment.centerLeft,
                      child: Text('Register',
                          style: GoogleFonts.cuprum(
                              fontSize: 35, color: Colors.grey.shade900)),
                    ),
                    SizedBox(height: 20),
                    _phoneField(),
                    SizedBox(height: 5),
                    _ackField(),
                    SizedBox(height: 5),
                    _passwdField(),
                    SizedBox(height: 5),
                    _ackpasswdField(),
                    SizedBox(height: 25),
                    _submitButton(),
                    // Container(
                    //   padding: EdgeInsets.symmetric(vertical: 5),
                    //   alignment: Alignment.centerRight,
                    //   child: Text('Forgot Password ?',
                    //       style: TextStyle(
                    //           fontSize: 10,
                    //           color: Color.fromRGBO(119, 119, 119, 1))),
                    // ),
                    // SizedBox(height: 30),
                    // _submitButton('Login'),
                    // SizedBox(height: height * .1),
                    // _divider(),
                    // _submitButton('Register'),
                  ],
                )),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ),
        ),
      ),
    );
  }
}
