import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("2"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("to 1"))
        ],
      ),
    );
    // return InkWell(
    //   onTap: () {
    //     Navigator.pop(context);
    //   },
    //   child: Container(
    //     padding: EdgeInsets.symmetric(horizontal: 10),
    //     child: Row(
    //       children: <Widget>[
    //         Container(
    //           padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
    //           child: Icon(Icons.arrow_back_ios, color: Colors.black),
    //         ),
    //         // Text('Back',
    //         //     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
    //       ],
    //     ),
    //   ),
    // );
  }
}