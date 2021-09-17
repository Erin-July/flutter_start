import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SnackBarPage extends StatefulWidget {
  const SnackBarPage({Key? key}) : super(key: key);

  @override
  _SnackBarPageState createState() => _SnackBarPageState();
}

class _SnackBarPageState extends State<SnackBarPage> {
  // _showSnackBar(BuildContext context) {
  //   Scaffold.of(context).showSnackBar(
  //     SnackBar(
  //       margin: EdgeInsets.symmetric(
  //         horizontal: 80,
  //       ),
  //       content: Text(
  //         'showSnackBar',
  //         style: TextStyle(color: Colors.black),
  //       ),
  //       backgroundColor: Colors.white,
  //       // elevation: 10,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       behavior: SnackBarBehavior.floating,
  //       // action: SnackBarAction(
  //       //   label: '知道了',
  //       //   onPressed: () {
  //       //     Scaffold.of(context).removeCurrentSnackBar();
  //       //   },
  //       // ),
  //       duration: Duration(seconds: 1),
  //       onVisible: () {
  //         print('onVisible');
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('SnackBar'),
            ),
            body: Container(
              alignment: Alignment.center,
              child: RaisedButton(
                child: Text("弹出toast"),
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "你今天真好看",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black45,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
              ),
            )));
  }
}
