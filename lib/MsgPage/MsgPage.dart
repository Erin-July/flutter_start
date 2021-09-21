import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/Provider/ChatListProvider.dart';
import 'ChatPage.dart';
// import '';

class MsgPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Center(
    //     child: Column(
    //   children: <Widget>[
    //     Container(
    //       child: TextButton(
    //           onPressed: () {
    //             Navigator.push(context,
    //                 new MaterialPageRoute(builder: (context) {
    //               return ChatPage();
    //             }));
    //           },
    //           // color: Colors.green,
    //           child: Text("to ChatPage")),
    //     ),
    return Container(
        child: MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatListProvider(),
        )
      ],
      child: ChatList(),
    ));
    //   ],
    // ));
  }
}

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatListProvider provider = Provider.of<ChatListProvider>(context);
    if (provider == null) {
      return Center(child: CircularProgressIndicator());
    }
    return SizedBox(
      height: 620.0,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: provider.users.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return ChatPage();
                  }));
                },
                // leading: Image.network(provider.chats[index].userIds[0].userAvatar),
                title: Text(provider.users[index].userName),
                // subtitle: Text(provider.chats[index].lastContent),
                // trailing: Container(
                //   width: 50,
                //   child: Text(provider.chats[index].lastUpdateTime),
                // )
              ),
              Divider()
            ]);
          }),
    );
  }
}
