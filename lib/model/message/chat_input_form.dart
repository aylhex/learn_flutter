import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:testflutter/model/Constant.dart';


class ChatInputFormWidget extends StatefulWidget {
  ChatInputFormWidget({Key key, @required this.scrollController}) : super(key: key);
  final ScrollController scrollController;

  @override
  _InputFormWidget createState() => _InputFormWidget();

}


class _InputFormWidget extends State<ChatInputFormWidget> {

  TextEditingController _messController = new TextEditingController();
  String _message;
  bool canSend = false;
  bool emoji = false;
  bool voice = false;
  Widget _sendButton(){
    return SizedBox(
      width: 70,
      child: FlatButton(
        child: Text('发送', style: TextStyle(color: Colors.white)),
        color: Colors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        onPressed: () {
          print("Send Message==>"+_message);
          _messController.clear();
        },
      ),
    );
  }


  double _softKeyHeight = 200;

  Widget _buildBottomItems() {

    if(emoji){
      return Container(
        height: _softKeyHeight,
        child: Center(child: Text("表情item")),
      );
    }
    if(voice){
      return Container(
        height: _softKeyHeight,
        child:Center(
          child: IconButton(
              icon: Icon(Icons.keyboard_voice, color: Colors.lightBlueAccent),
              onPressed: (){
                print("开始语音");
              }
              ),
        ),
      );
    }
    else{
      return Container();
    }
  }


  @override
  void initState() {
    super.initState();
    _messController.addListener(()
    {
      _message = _messController.text;
      setState(() {
        if(_messController.text.length > 0){
          canSend = true;
        }else if(_messController.text.length == 0){
          canSend = false;
        }
      });
    });
  }

  @override
  void dispose() {
    _messController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15,top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                      child: Container(
                        decoration: BoxDecoration(//背景
                          color: Colors.white,
                          //设置四周圆角 角度
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          //设置四周边框
                          //border: new Border.all(width: 1, color: Colors.),
                        ),
                        child:TextField(
                          controller: _messController,
                          autofocus: false,
                          maxLines: 6,
                          minLines: 1,
                          style: TextStyle(textBaseline: TextBaseline.alphabetic),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20, right: 10),
                            hintText: '请输入消息...',
                            border: InputBorder.none,
                            //suffixIcon: Icon(Icons.message, color: canSend ? Colors.blue : Colors.grey)
                          ),
                        ),
                      ),
                ),
                Padding(
                  padding: canSend ? EdgeInsets.only(right: 15, left: 8, bottom: 2):EdgeInsets.only(right: 15),
                  //padding:  EdgeInsets.only(top: 8,right: 10, left: 8),
                  child: canSend ? _sendButton():null,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.keyboard_voice, color:  voice ? Colors.blueAccent:Colors.grey,),
                    onPressed: (){
                      setState(() {
                        if(!voice){
                          voice = true;
                        }else{
                          voice = false;
                        }
                      });
                    }),
                Icon(Icons.image, color: Colors.grey,),
                Icon(Icons.android, color: Colors.grey,),
                IconButton(
                  icon: Icon(Icons.tag_faces, color: emoji ? Colors.blueAccent:Colors.grey,),
                  onPressed: (){
                    setState(() {
                      if(!emoji){
                        emoji = true;
                      }else{
                        emoji = false;
                      }
                    });
                  },
                ),
                Icon(Icons.add_circle,  color: Colors.grey),
              ],
            ),
          ),
          _buildBottomItems()
        ],
      ),
    );
  }

}


