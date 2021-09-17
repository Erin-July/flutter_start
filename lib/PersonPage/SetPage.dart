import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../LoginPage/LoginPage.dart';

class SetPage extends StatefulWidget {
  const SetPage({Key? key}) : super(key: key);

  @override
  _SetPageState createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  Widget _field(title, icon, widget) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget));
      },
      child: Container(
        margin: EdgeInsets.only(left: 40, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.grey.shade600,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
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

  Widget _pwdfield() {
    return InkWell(
      onTap: () {
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => widget));
      },
      child: Container(
        margin: EdgeInsets.only(left: 40, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.vpn_key,
              color: Colors.grey.shade600,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '修改密码',
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

  Widget _idField() {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => {});
      },
      child: Container(
        margin: EdgeInsets.only(left: 40, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.person_outline,
              color: Colors.grey.shade600,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '实名认证',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
            Spacer(),
            Text(
              '黄*雨',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
            ),
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

  Widget _schoolField() {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => {});
      },
      child: Container(
        margin: EdgeInsets.only(left: 40, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.school_outlined,
              color: Colors.grey.shade600,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '学校',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
            Spacer(),
            Text(
              '天津大学',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
            ),
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

  Widget _phoneField() {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => {});
      },
      child: Container(
        margin: EdgeInsets.only(left: 40, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.smartphone_outlined,
              color: Colors.grey.shade600,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '手机号',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
            Spacer(),
            Text(
              '18822197739',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
            ),
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
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 246, 241, 1),
      appBar: AppBar(
        //顶部导航栏
        // automaticallyImplyLeading: true,
        title: Text(
          'Settings',
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
              margin: EdgeInsets.symmetric(vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _field('账号与安全', Icons.manage_accounts_outlined, _account()),
                    _divider(),
                    _field('清理缓存', Icons.cleaning_services_outlined, _clean()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logoutButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        // width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 40),
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
          color: Colors.grey.shade400,
        ),
        child: Text(
          'Log Out',
          style: GoogleFonts.cuprum(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _account() {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(248, 246, 241, 1),
      appBar: AppBar(
        //顶部导航栏
        // automaticallyImplyLeading: true,
        title: Text(
          'Account Security',
          style: GoogleFonts.cuprum(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(117, 204, 164, 1),
        elevation: 2,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // _field('账号与安全', Icons.manage_accounts_outlined, _account()),
                    _idField(),
                    _divider(),
                    _schoolField(),
                    _divider(),
                    _phoneField(),
                    _divider(),
                    _pwdfield(),
                    SizedBox(
                      height: 300,
                    ),
                    _logoutButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _clean() {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(248, 246, 241, 1),
      appBar: AppBar(
        //顶部导航栏
        // automaticallyImplyLeading: true,
        title: Text(
          'Manage Cache',
          style: GoogleFonts.cuprum(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(117, 204, 164, 1),
        elevation: 2,
      ),
      // body: new ListView(children: divided),
    );
  }
}
