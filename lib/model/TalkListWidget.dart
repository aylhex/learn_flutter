import 'package:flutter/material.dart';

import 'Post.dart';


class TalkListWidget extends StatefulWidget {

  TalkListWidget({Key key, @required this.scrollController}) : super(key: key);
  final ScrollController scrollController;

  @override
  _TalkListWidget createState() => _TalkListWidget();
}


class _TalkListWidget extends State<TalkListWidget> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    //SingleMesCollection mesCol = cTalkingCol(context);
    return Expanded(
        child: Scaffold(
          backgroundColor: Colors.grey[50],
          body:CustomScrollView(
            slivers: <Widget>[
              SliverSafeArea(
                sliver: SliverPadding(
                  padding: EdgeInsets.all(8.0),
                  sliver: SliverListDemo(),
                ),
              )
            ],
          )
        )
    );
  }
}

class SliverListDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Material(
                  shadowColor: Colors.grey.withOpacity(0.5),
                  child:Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          headImage(index),
                          SizedBox(width: 10),
                          testWidget(index)
                        ],
                      )
                    ],
                  )
              )
          );
        },
        childCount: posts.length),
    );
  }
}

Widget headImage(int index)  {
  return ClipRRect(
    borderRadius: BorderRadius.circular(50.0),
    child: Image.network(posts[index].imageUrl, height: 60, width: 40,),
  );
}

Widget testWidget(int index)  {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        child: Text(posts[index].author, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.lightBlueAccent,
        ),
        child: Padding(padding: EdgeInsets.only(left:15,top: 15, right: 15,bottom: 15),
          child: Text(posts[index].title, style: TextStyle(fontSize: 16, color: Colors.black)),
        ),
      )
    ],
  );
}