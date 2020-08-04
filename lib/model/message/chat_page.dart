import 'package:flutter/material.dart';
import 'package:testflutter/model/TalkListWidget.dart';
import 'package:testflutter/model/message/chat_input_form.dart';


class ChatPage extends StatefulWidget {

  String _title;
  ChatPage({String title}){
    _title = title;
  }

  @override
  _ChatPage createState() => _ChatPage();

}

class _ChatPage extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget._title),centerTitle: true),
      body: Container(
          child: Column(
            children: <Widget>[
              TalkListWidget(),
              ChatInputFormWidget(),
            ],
          ),
      ),
    );
  }
}