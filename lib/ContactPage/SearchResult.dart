import 'package:flutter/material.dart';
import 'component/contact_sider_list.dart';
import 'component/contact_item.dart';
import 'component/contact_vo.dart';

class SearchResult extends StatefulWidget {
  @override
  SearchResultState createState() {
    return SearchResultState();
  }
}

class SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color.fromRGBO(248, 246, 241, 1),
            body: Column(children: <Widget>[
              Expanded(
                flex: 1,
                child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
              Expanded(
                flex: 10,
                  child: Scaffold(
                      body: ContactSiderList(
                //列表
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
                  return Container();
                },
              )))
            ])));
  }
}
