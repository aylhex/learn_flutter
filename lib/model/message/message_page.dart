import 'package:flutter/material.dart';
import 'package:testflutter/model/Post.dart';
import 'package:testflutter/model/message/chat_page.dart';

class MessagePage extends StatefulWidget {

  @override
  _MessagePage createState() => _MessagePage();
}

class _MessagePage extends State<MessagePage> {
  static final Set<String> saved = new Set<String>();

  Widget _listViewBuilder(BuildContext context, int index){
    DateTime now = new DateTime.now();
    TimeOfDay time = TimeOfDay(hour: now.hour, minute: now.minute);
    String mtime = "${time.hour}:${time.minute}";

    bool _favorite = saved.contains(posts[index].title);

    return InkWell(
      child: Container(
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Container(
                width: 40.0,
                height: 40.0,
                child: CircleAvatar(
                  radius: 36.0,
                  backgroundImage: NetworkImage(posts[index].imageUrl),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(posts[index].title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),

                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(mtime, style: TextStyle(color: Colors.grey),),
                      )
                    ],
                  ), Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(posts[index].author, style: TextStyle(fontSize: 14, color: Colors.grey),),

                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.alarm_off, size: 16,  color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return new ChatPage(title:posts[index].title);
          }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("消息"),),
      body: Container(
        padding: EdgeInsets.only(top: 8),
        child: ListView.separated(
          itemCount: posts.length,
          separatorBuilder: (BuildContext context, int index) => new Divider(),
          itemBuilder: _listViewBuilder,)
      )
    );
  }
}

