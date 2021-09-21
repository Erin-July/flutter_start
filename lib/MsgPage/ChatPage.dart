// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/MsgPage/TheBottomSheet.dart';
import 'package:startup_namer/MsgPage/HistoryPage.dart';
// import 'package:flutter_app/ContactPage/ContactPage.dart';

// final ThemeData kIOSTheme = ThemeData(
//   primarySwatch: Colors.green,
//   primaryColor: Colors.grey[100],
//   primaryColorBrightness: Brightness.light,
// );
//
// final ThemeData kDefaultTheme = ThemeData(
//   primarySwatch: Colors.green,
//   accentColor: Colors.orangeAccent[400],
// );

String _name = 'xiao bai';


class ChatMessage extends StatelessWidget {
  ChatMessage({required this.text, required this.animationController});

  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(child: Text(_name[0])),
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _name,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5.0),
                      child: Text(text),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = [];
  final _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _iscomposing = false;
  var _imgPath;

  Widget _buildTextComposer() {
    double screenHeight = MediaQuery.of(context).size.height;
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.mic),
                onPressed: (){},
              ),
            ),
            Flexible(
              child: TextField(
                autofocus: false,
                controller: _textController,
                onChanged: (String text) {
                  setState(() {
                    _iscomposing = text.isNotEmpty;
                  });
                },
                onSubmitted: _iscomposing ? _handleSubmitted : null,
                decoration:
                InputDecoration.collapsed(hintText: 'Send a message'),
                focusNode: _focusNode,
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _iscomposing
                      ? () => _handleSubmitted(_textController.text)
                      : null,
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.add_circle),
                onPressed:(){
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(10)
                    ),
                      context: context,
                      builder: (_){
                        return MultiProvider(
                          providers: [ChangeNotifierProvider(create: (BuildContext context) {},)],
                          child: Container(
                              height: 0.15 * screenHeight,  //定义高度
                              child: TheBottomSheet()),
                        )
                        ;
                      }
                  );
                },
              )
            )
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _iscomposing = false;
    });
    var message = ChatMessage(
      text: text,
      animationController: AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    _focusNode.requestFocus();
    message.animationController.forward();
  }

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
                    Navigator.push(context,new MaterialPageRoute(builder: (context) { return HistoryPage(); }));
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
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer(),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    for (var message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  // Widget _ImageView(imgPath) {
  //   if (imgPath == null) {
  //     return Center(
  //       child: Text("请选择图片或拍照"),
  //     );
  //   } else {
  //     return Image.file(
  //       imgPath,
  //     );
  //   }
  // }
  //
  //
  // /*拍照*/
  // _takePhoto() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.camera);
  //
  //   setState(() {
  //     _imgPath = image;
  //   });
  // }

}

// class ImagePickerWidget extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _ImagePickerState();
//   }
// }
//
// class _ImagePickerState extends State<ImagePickerWidget> {
//   var _imgPath;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("ImagePicker"),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               _ImageView(_imgPath),
//               RaisedButton(
//                 onPressed: _takePhoto,
//                 child: Text("拍照"),
//               ),
//               RaisedButton(
//                 onPressed: _openGallery,
//                 child: Text("选择照片"),
//               ),
//             ],
//           ),
//         ));
//   }
//
//   /*图片控件*/
//   Widget _ImageView(imgPath) {
//     if (imgPath == null) {
//       return Center(
//         child: Text("请选择图片或拍照"),
//       );
//     } else {
//       return Image.file(
//         imgPath,
//       );
//     }
//   }
//
//
//   /*拍照*/
//   _takePhoto() async {
//     var image = await ImagePicker.pickImage(source: ImageSource.camera);
//
//     setState(() {
//       _imgPath = image;
//     });
//   }
//
//   /*相册*/
//   _openGallery() async {
//     var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _imgPath = image;
//     });
//   }
// }