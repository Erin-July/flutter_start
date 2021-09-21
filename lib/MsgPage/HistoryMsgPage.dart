import 'package:flutter/material.dart';

class HistoryMsgPage extends StatelessWidget {
  const HistoryMsgPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('xiao bai'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(117, 204, 164, 1),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child:IconButton(
                icon: const Icon(Icons.account_circle),
                onPressed: (){
                  // Navigator.push(context,new MaterialPageRoute(builder: (context) { return HistoryPage(); }));
                },
              ),
            ),
          ],
          // elevation:
          //     Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        body: Column(
          children: [
            Flexible(
              child: ListView(
                padding: EdgeInsets.all(8.0),
                // reverse: true,
                // itemBuilder: (_, int index) => _messages[index],
                // itemCount: _messages.length,
              ),
            ),
            Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: ListTile(),
            ),
          ],
        ));
  }
}

