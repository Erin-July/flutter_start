import 'dart:convert';
// import 'dart:html';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class HttpPage extends StatefulWidget {
  HttpPage({Key? key}) : super(key: key);
  @override
  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
//   late IO.Socket channel;
  // late Image image;
  Image image = Image.asset('assets/images/upp.png');
  @override
  void initState() {
    super.initState();

    // image = _getInfo();
    _getInfo();
  }

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
  // late IO.Socket socket;
  List messageList = [];

// get() async {
//   var httpClient = new HttpClient();
//   var uri = new Uri.http(
//       'http://175.27.189.9', '/common/getInfo', {'param1': '42', 'param2': 'foo'});
//   var request = await httpClient.getUrl(uri);
//   var response = await request.close();
//   var responseBody = await response.transform(UTF8.decoder).join();
// }

  String generate_MD5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  get() async {
    String result;
    var httpClient = new HttpClient();
    var uri =
        new Uri.http('175.27.189.9', '/user/loginPre', {'id': '18822197739'});
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await utf8.decoder.bind(response).join();
    var data = jsonDecode(responseBody);
    result = data['msg'];
    // print(data);
  }

  String _isCodeTrue = "-1";
  String _token = "";
  _getAckCode() async {
    var httpClient = new HttpClient();
    var url = new Uri.http(
        '175.27.189.9', '/user/login', {'id': "18822197739", 'code': "025319"});
    String result;
    String token = "";
    var request = await httpClient.getUrl(url);
    var response = await request.close();

    if (response.statusCode == HttpStatus.ok) {
      var json = await utf8.decoder.bind(response).join();
      var data = jsonDecode(json);
      result = data['msg'];
      token = data['data']['token'];
      print(data);
      print(token);
    } else {
      result = 'Error:\nHttp status ${response.statusCode}';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _isCodeTrue = result;
      _token = token;
    });
  }

  _postRegister() async {
    var timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    var httpClient = new HttpClient();
    var newToken = generate_MD5(timestamp.toString() + _token);
    var url = new Uri.http('175.27.189.9', '/user/newPwd');

    // print(timestamp);
    // print(newToken);
    // var url = "175.27.189.9/user/login";
    var request = await httpClient.postUrl(url);
    // FormData data = new FormData(); // from dart:html

    // data.append('id', "18822197739");
    // data.append('timestamp', timestamp);
    // data.append('token', "18822197739");
    // data.append('id', "18822197739");

    Map jsonMap = {
      'id': "18822197739",
      'timestamp': timestamp,
      'token': newToken,
      'pwd': '123456',
    };
    String result;
    int _code = 1;
    // String _json = Uri.encodeComponent(json.encode(jsonMap));
    // print(_json);

    String queryString = Uri(queryParameters: {
      'id': "18822197739",
      'timestamp': timestamp.toString(),
      'token': newToken,
      'pwd': '123456',
    }).query;

    print(queryString);
    // var _jsonMap = FormData(jsonMap);
    // request.headers.add("Content-Type", "application/x-www-form-urlencoded");

    // String jsonString = json.encode(jsonMap); // encode map to json
    // String paramName = 'param'; // give the post param a name
    // String formBody = paramName + '=' + Uri.encodeQueryComponent(jsonString);
    // List<int> bodyBytes = utf8.encode(formBody);

    // request.headers.set("content-type", "multipart/form-data");
    request.headers.add("content-type", "application/x-www-form-urlencoded");
    // request.write(utf8.encode(json.encode(jsonMap)));
    // request.write(FormUrlEncodedContent(jsonMap));

    // request.write(
    //     "id='18822197739'&timestamp=$timestamp&token=$newToken&pwd='123456'");
    request.write(queryString);

    // print(json.encode(jsonMap));
    // request.headers.set("Content-Type", "multipart/form-data");
    // request.add(utf8.encode(json.encode(jsonMap)));
    // var request = await httpClient.postUrl(url);
    // var response = await request.close();

    var response = await request.close();
    // String responseBody = await response.transform(utf8.decoder).join();
    print(response.statusCode);
    // print(request.headers);
    // var json1 = await utf8.decoder.bind(response).join();
    // var data = jsonDecode(json1);
    // print(json1);
    if (response.statusCode == HttpStatus.ok) {
      var json = await utf8.decoder.bind(response).join();
      var data = jsonDecode(json);
      _code = data['code'];
      result = data['msg'];
      print(data);
    } else {
      result = 'Error:\nHttp status ${response.statusCode}';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      // _codeMsg = result;
      // _isCodeTrue = _code;
    });
  }

  _getLogin() async {
    var timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    var _pwd = "123456";
    var newToken = generate_MD5(timestamp.toString() + _pwd);
    var httpClient = new HttpClient();
    var url = new Uri.http('175.27.189.9', '/user/loginByPwd', {
      'id': "18822197739",
      'timestamp': timestamp.toString(),
      'token': newToken
    });
    String result;
    String token = "";
    var request = await httpClient.getUrl(url);
    var response = await request.close();

    if (response.statusCode == HttpStatus.ok) {
      var json = await utf8.decoder.bind(response).join();
      var data = jsonDecode(json);
      result = data['msg'];
      token = data['data']['token'];
      print(data);
      print(token);
    } else {
      result = 'Error:\nHttp status ${response.statusCode}';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      // _isCodeTrue = result;
      // _token = token;
    });
  }

  _getInfo() async {
    var httpClient = new HttpClient();
    var url =
        new Uri.http('175.27.189.9', '/user/getAvatar', {'id': "18822197739"});
    String result;
    String token = "";
    var request = await httpClient.getUrl(url);
    var response = await request.close();
    print('***');
    print(response.statusCode);
    if (response.statusCode == HttpStatus.ok) {
      print('***');
      Uint8List bytes = await consolidateHttpClientResponseBytes(response);
      image = Image.memory(bytes);
      // var json = await base64.decoder.bind(response).join();
      // var data = jsonDecode(json);
      // result = data['msg'];
      // token = data['data']['token'];
      print('***');
      print(bytes);
      // print(token);
    } else {
      result = 'Error:\nHttp status ${response.statusCode}';
    }

    return image;
    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    // if (!mounted) return;

    // setState(() {
    //   _isCodeTrue = result;
    //   _token = token;
    // });
  }

  // _postSetTags() async {
  //   var timestamp = DateTime.now().millisecondsSinceEpoch;
  //   var httpClient = new HttpClient();
  //   var newToken = generate_MD5(timestamp.toString() + _token);
  //   var url = new Uri.http('175.27.189.9', '/user/setTags');
  //   var request = await httpClient.postUrl(url);
  //   String result;
  //   int _code = 1;
  //   request.headers.add("content-type", "application/x-www-form-urlencoded");
  //   request.write(
  //       "id='18822197739'&timestamp=$timestamp&token=$newToken&tags='篮球;足球'");
  //   var response = await request.close();
  //   print(response.statusCode);
  //   if (response.statusCode == HttpStatus.ok) {
  //     var json = await utf8.decoder.bind(response).join();
  //     var data = jsonDecode(json);
  //     _code = data['code'];
  //     result = data['msg'];
  //     print(data);
  //   } else {
  //     result = 'Error:\nHttp status ${response.statusCode}';
  //   }

  //   // If the widget was removed from the tree while the message was in flight,
  //   // we want to discard the reply rather than calling setState to update our
  //   // non-existent appearance.
  //   if (!mounted) return;

  //   setState(() {
  //     // _codeMsg = result;
  //     // _isCodeTrue = _code;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("HTTP演示"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // get();
            // _getAckCode();
            // _postRegister();
            _getInfo();
            // _postSetTags();
            // print(_isCodeTrue);
            // print(timestamp);
            // 发送数据到服务端，直接监听
            // this.socket.emit('test', [
            //   {"msg": "hahaha"}
            // ]);

            //发送数据到服务端，设置回调函数
            // this.socket.emitWithAck('test', [
            //   {"msg": "hahaha"}
            // ], ack: (data) {
            //   print(data['msg']);
            // });
            // print('qwq');
          },
        ),
        body: Container(
          child: image,
        ),
        // ListView.builder(
        //   // 滚动控制器
        //   controller: this._scrollController,
        //   itemCount: this.messageList.length,
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       title: Text("${this.messageList[index]}"),
        // );
        // },
        // ),
      ),
    );
  }
}
