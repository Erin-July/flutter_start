import 'package:flutter/material.dart';

class TheBottomSheet extends StatelessWidget {
  const TheBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
        Expanded(
          flex: 1,
            child: Column(children: <Widget>[
          Container(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.folder),
            ),
          ),
          Container(
            child: Text("文件"),
          ),
        ])),
        Expanded(
            flex: 1,
            child: Column(
          children: <Widget>[
            Container(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.photo_size_select_actual_rounded)),
            ),
            Container(
              child: Text("图片"),
            )
          ],
        )),
        Expanded(
          child: SizedBox(width:0.5 * screenWidth)
        )
      ]);
  }
}
