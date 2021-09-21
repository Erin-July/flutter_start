import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/ContactPage/FriendInfo.dart';
import './contact_vo.dart';

class ContactItem extends StatelessWidget {
  final ContactVO item;

  ContactItem({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xffd9d9d9)))),
      height: 50.0,
      child: TextButton(

        onPressed: () {Navigator.push(context,
            MaterialPageRoute(builder: (context) => FriendInfo()));},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(item.avatarUrl,
                width: 36.0, height: 36.0, scale: 0.9),
            Container(
              margin: const EdgeInsets.only(left: 12.0),
              child: Text(
                item.name,
                style: TextStyle(fontSize: 18.0, color: Color(0xff353535)),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
