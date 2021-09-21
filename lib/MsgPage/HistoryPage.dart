import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ChatPage.dart';
import 'package:startup_namer/MsgPage/HistoryMsgPage.dart';

// class HistoryPage extends StatelessWidget {
//   const HistoryPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//     );
//   }
// }

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  Widget _infoField() {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => InfoPage()));
      },
      child: Container(
        margin: EdgeInsets.only(left: 40, right: 30),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 70,
              height: 70,
              child: ClipOval(
                  // child: Image.asset('assets/images/hxy.bmp'),
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
                    'inver',
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  new Text(
                    '真实姓名：黄*雨',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            // Container(
            //   child: Icon(
            //     Icons.chevron_right,
            //     color: Colors.grey.shade600,
            //   ),
            // ),
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
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => TagPage()));
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
            // Container(
            //   child: Icon(
            //     Icons.chevron_right,
            //     color: Colors.grey.shade600,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _settingField() {
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => SetPage()));
      },
      child: Container(
        margin: EdgeInsets.only(left: 40, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Icon(
            //   Icons.settings_outlined,
            //   color: Colors.grey.shade600,
            // ),
            // SizedBox(
            //   width: 10,
            // ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 0.25 * screenWidth),
                child: TextButton(
                  onPressed:(){
                    Navigator.push(context,new MaterialPageRoute(builder: (context) { return HistoryMsgPage(); }));
                  },
                  child: Text(
                      "删除聊天信息",
                      textAlign: TextAlign.center,

                  ),


                  // style: TextStyle(
                  //   fontSize: 20,
                  //   color: Colors.red,
                  // ),
                ),
              ),

            Spacer(),
            // Container(
            //   child: Icon(
            //     Icons.chevron_right,
            //     color: Colors.grey.shade600,
            //   ),
            // ),
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

    return Scaffold(
      appBar: AppBar(
        title: Text('聊天信息'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(117, 204, 164, 1),
      ),
      body: Container(
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
      ),
    );
  }
}
