import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'RegisterPage.dart';

class CertiPage extends StatefulWidget {
  CertiPage({Key? key}) : super(key: key);
  @override
  _CertiPageState createState() => _CertiPageState();
}

class _CertiPageState extends State<CertiPage> {
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

  Widget _schoolField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            // obscureText: false,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.school,
                  color: Colors.grey.shade400,
                  // size: 20,
                ),
                hintText: '输入你的大学吧！',
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
          ),
        ],
      ),
    );
  }

  Widget _nameField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
              // obscureText: false,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.face,
                    color: Colors.grey.shade400,
                    // size: 20,
                  ),
                  hintText: '我很想知道你的真实姓名呢！',
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
                  filled: true))
        ],
      ),
    );
  }

  Widget _idField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
              // obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.credit_card,
                    color: Colors.grey.shade400,
                    // size: 20,
                  ),
                  hintText: '身份证号绝对会保密哦！',
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
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterPage()));
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
          'Next',
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
                      child: Text('Student Certification',
                          style: GoogleFonts.cuprum(
                              fontSize: 35, color: Colors.grey.shade900)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.centerLeft,
                      child: Text('我们需要验证你是个学生才可以哦！\n所有输入信息均仅作验证使用。',
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade700)),
                    ),
                    SizedBox(height: 5),
                    _schoolField(),
                    SizedBox(height: 5),
                    _nameField(),
                    SizedBox(height: 5),
                    _idField(),
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
