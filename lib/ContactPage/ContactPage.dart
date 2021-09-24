import 'package:flutter/material.dart';
import 'NewFriends.dart';
import 'SearchResult.dart';
import 'component/SearchField.dart';
import 'component/contact_sider_list.dart';
import 'component/contact_item.dart';
import 'component/contact_vo.dart';

class ContactPage extends StatefulWidget {
  @override
  ContactPageState createState() {
    return ContactPageState();
  }
}

class ContactPageState extends State<ContactPage> {
  // final items = new List<String>.generate(100, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color.fromRGBO(248, 246, 241, 1),
          body: Column(children: <Widget>[
            Container(
                height: 55,
                width: 400,
                color: Color.fromRGBO(248, 246, 241, 1),
                child: SearchWidget(SearchResult())),
            Expanded(
              flex: 2,
              child: Container(
                  child: new ListTile(
                title: Text("新朋友"),
                dense: true,
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewFriends()));
                },
              )),
            ),
            Expanded(
                flex: 3,
                child: ButtonBar(
                  alignment: MainAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    ///****************To Do***************///
                    TextButton(onPressed: () {}, child: Text('好友')),
                    TextButton(onPressed: () {}, child: Text('群组')),
                  ],
                )),
            Expanded(
                flex: 18,
                child: Scaffold(
                    body: ContactSiderList(
                  //好友列表
                  items: contacts,
                  itemBuilder: (BuildContext contet, int index) {
                    //列表项
                    return Container(
                      child: ContactItem(
                        item: contacts[index],
                      ),
                    );
                  },
                  //字母构造器
                  sectionBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 32.0,
                      padding: const EdgeInsets.only(left: 14.0),
                      color: Colors.grey[300],
                      alignment: Alignment.centerLeft,
                      child: Text(
                        contacts[index].seationKey,
                        style:
                            TextStyle(fontSize: 14.0, color: Color(0xff909090)),
                      ),
                    );
                  },
                )))
          ])),
    );
  }
}
