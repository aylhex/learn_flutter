import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:testflutter/model/Constant.dart';
import 'package:testflutter/model/pages/nine_picture_view_widget.dart';

class DynamicPage extends StatefulWidget {
  @override
  _DynamicPage createState() => _DynamicPage();

}

class _DynamicPage extends State<DynamicPage>{
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text("动态"),),
        body: Container(
          child: Padding(
            padding: EdgeInsets.only(right: 5.0, left: 5.0),
            child: data(),
          ),
        ),
      )
    );
  }
  Widget contextView(int index){
    return Column(
      children: <Widget>[
        headLine(),
        contentBodyWidget(),
        pictureBodyWidget(),
        tailLine(),
        SizedBox(height: 4.0,)
      ],
    );
  }

  Widget data(){
    return ListView(
      children: List.generate(10, (index)
      {
        return contextView(index);
      }),
    );
  }



  Widget headLine(){
    return Padding(
        padding: EdgeInsets.only(left: 2.0, right: 2.0),
        child: Container(
        padding: EdgeInsets.only(left: 2.0, right: 2.0,top: 4.0,bottom: 2.0),
        color: Colors.amberAccent,
        child: Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text("头像"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Column(
                    children: <Widget>[
                      Text("用户名称"),
                      Text("用户描述")
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                        alignment: Alignment.bottomRight,
                        padding: EdgeInsets.only(right: 8),
                        child: Text("转发")
                    )
                )
              ],
            )
        ),
    ));
  }

  Widget tailLine(){
    return Padding(
      padding: EdgeInsets.only(left: 2.0, right: 2.0),
      child: Container(
        color: Colors.lightBlueAccent,
        padding: EdgeInsets.only(top: 4.0, bottom: 2.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(Icons.thumb_up),
              Icon(Icons.message),
              Icon(Icons.edit),
            ],
          ),
        ),
      ),
    );
  }

  Widget pictureBodyWidget(){
    final List<String> picList = [
      Constant.ASSETS_IMG+"test1.jpeg",
      Constant.ASSETS_IMG+"test2.jpeg",
      Constant.ASSETS_IMG+"test3.jpeg",
      Constant.ASSETS_IMG+"test4.jpeg",
      Constant.ASSETS_IMG+"test5.jpeg",
      Constant.ASSETS_IMG+"test6.jpeg",
      Constant.ASSETS_IMG+"test7.jpeg",
      Constant.ASSETS_IMG+"test8.jpeg",
      Constant.ASSETS_IMG+"test9.jpeg",
    ];
    return Container(
     child: NinePictureView(picList),
    );
  }

  Widget contentBodyWidget(){
    var data = "全球最大的中文搜索引擎、致力于让网民更便捷地获取信息，找到所求。百度超过千亿的中文网页数据库，可以瞬间找到相关的搜索结果。";
    return Container(
      padding: EdgeInsets.only(top:6.0,bottom: 6.0),
      alignment: Alignment.bottomLeft,
      child: Text(data,
        style: TextStyle(fontSize: 16, ),
        textAlign: TextAlign.left,
        maxLines:2,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}


