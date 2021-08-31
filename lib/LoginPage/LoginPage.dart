import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app.dart';
import 'CertiPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = false;

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
          TextField(
            // obscureText: false,
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

  Widget _passwdField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
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

  // Widget _emailPasswordWidget() {
  //   return Column(
  //     children: <Widget>[
  //       _entryField("Phone number"),
  //       _entryField("Password", isPassword: true),
  //     ],
  //   );
  // }

  Widget _submitButton(String title) {
    return InkWell(
      onTap: () {
        if (title == 'Login') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScaffoldRoute(
                        index: 0,
                      )));
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
              SizedBox(height: height * .15),
              Image.asset(
                'assets/images/upp.png',
                width: 180,
              ),
              SizedBox(height: 20),
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
              SizedBox(height: height * .15),
              _divider(),
              _submitButton('Register'),
            ],
          )),
        ),
      ),
    );
  }
}
