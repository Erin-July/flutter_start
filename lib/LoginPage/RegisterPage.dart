import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../PersonPage/PersonPage.dart';
import '../app.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisible1 = false;
  bool passwordVisible2 = false;

  @override
  void initState() {
    passwordVisible1 = false; //设置初始状态
    passwordVisible2 = false;
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
          TextField(
            // obscureText: false,
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
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(91, 91, 91, 1),
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(91, 91, 91, 1),
                    width: 2.0,
                  ),
                ),
                fillColor: Colors.white,
                filled: true),
          ),
        ],
      ),
    );
  }

  Widget _ackField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(
                color: Color.fromRGBO(91, 91, 91, 1),
                width: 2.0,
              ),
              color: Colors.white,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.grey.shade400,
                        size: 20,
                      ),
                      border: InputBorder.none,
                      hintText: '验证码是什么呢！',
                      hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(119, 119, 119, 1)),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(249, 217, 142, 1),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: TextButton(
                      child: Text(
                        '获取验证码',
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 12),
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
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
          TextField(
            obscureText: !passwordVisible1,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    //根据passwordVisible状态显示不同的图标
                    passwordVisible1 ? Icons.visibility : Icons.visibility_off,
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
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(91, 91, 91, 1),
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(91, 91, 91, 1),
                    width: 2.0,
                  ),
                ),
                fillColor: Colors.white,
                filled: true),
          )
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
          TextField(
            obscureText: !passwordVisible2,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    //根据passwordVisible状态显示不同的图标
                    passwordVisible2 ? Icons.visibility : Icons.visibility_off,
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
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(91, 91, 91, 1),
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(91, 91, 91, 1),
                    width: 2.0,
                  ),
                ),
                fillColor: Colors.white,
                filled: true),
          )
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ScaffoldRoute(
                      index: 3,
                    )));
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
