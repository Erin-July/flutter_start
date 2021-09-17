import 'package:flutter/material.dart';

// 引入Socket.io
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketPage extends StatefulWidget {
  SocketPage({Key? key}) : super(key: key);
  @override
  _SocketPageState createState() => _SocketPageState();
}

class _SocketPageState extends State<SocketPage> {
//   late IO.Socket channel;

//   @override
//   void initState() {
//     super.initState();

//     _listenWebSocket();
//   }

//   void _listenWebSocket() async {
//     // 构建请求头，可以放一些cookie等信息，这里加上了origin，因为服务端有origin校验
//     Map<String, dynamic> headers = new Map();
//     // headers['origin'] = 'http://127.0.0.1:7001';
//     // 建立websocket链接
//     // 链接的书写规范，schame://host:port/namespace, 这里socket_io_client在处理链接时候会把path和后面的query参数都作为namespace来处理，所以如果我们的namespace是/的话，就直接使用http://host/
//     channel = IO.io('ws://175.27.789.9/', <String, dynamic>{
//       // 请求的path
//       // 'path': '/ws',
//       // 构造的header放这里
//       'extraHeaders': headers,
//       // 查询参数，扔这里
//       'query': {'EIO': 3, 'transport': 'websocket'},
//       // 说明需要升级成websocket链接
//       'transports': ['websocket'],
//     });

//     // 链接建立成功之后，可以发送数据到socket.io的后端了
//     channel.on('connect', (_) {
//       print('connect');
//       // 发送消息和回调函数给socket.io服务端，在服务端可以直接获取到该方法，然后调用
//       channel.emitWithAck('exchange', '11111', ack: (data) {
//         print('ack $data');
//         if (data != null) {
//           print('from server $data');
//         } else {
//           print("Null");
//         }
//       });
//     });
//     // 链接建立失败时调用
//     channel.on('error', (data) {
//       print('error');
//       print(data);
//     });
//     // 链接出错时调用
//     channel.on("connect_error", (data) => print('connect_error: '));
//     // 链接断开时调用
//     channel.on('disconnect', (_) => print('disconnect======'));
//     // 链接关闭时调用
//     channel.on('close', (_) => print('close===='));
//     // 服务端emit一个message的事件时，可以直接监听到
//     channel.on('message', (data) {
//       print('onmessage');
//       print(data);
//     });
//   }

// // 关闭websocket链接，避免内存占用
//   @override
//   void dispose() {
//     super.dispose();

//     print('close');
//     channel.close();
//   }

  ScrollController _scrollController = new ScrollController();
  late IO.Socket socket;
  List messageList = [];

  @override
  void initState() {
    super.initState();
    // 和服务器端建立连接
    this.socket = IO.io('ws://175.27.189.9/', <String, dynamic>{
      // 'path': '/ws',
      'transports': ['websocket'],
    });
    // 连接事件
    this.socket.on('connect', (_) {
      print('connect..');
    });
    // 接受来自服务端的数据
    this.socket.on('toClient', (data) {
      print(data);
      setState(() {
        this.messageList.add(data);
      });
      // 改变滚动条的位置
      this
          ._scrollController
          .jumpTo(_scrollController.position.maxScrollExtent + 80);
    });

    // 链接关闭时调用
    this.socket.on('close', (_) => print('close connect'));

    // 服务端emit一个test的事件时，可以直接监听到
    this.socket.on('test', (data) {
      print('on message');
      print(data);
    });

    // 断开连接
    this.socket.on('disconnect', (_) {
      print('disconnect');
    });

    // 链接建立失败时调用
    this.socket.on('error', (data) {
      print('error');
      print(data);
    });
    // 链接出错时调用
    this.socket.on("connect_error", (data) {
      print('connect_error');
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Socket.io演示"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // 发送数据到服务端，直接监听
            // this.socket.emit('test', [
            //   {"msg": "hahaha"}
            // ]);

            //发送数据到服务端，设置回调函数
            this.socket.emitWithAck('test', [
              {"msg": "hahaha"}
            ], ack: (data) {
              print(data['msg']);
            });
            print('qwq');
          },
        ),
        body: ListView.builder(
          // 滚动控制器
          controller: this._scrollController,
          itemCount: this.messageList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("${this.messageList[index]}"),
            );
          },
        ),
      ),
    );
  }
}
