import 'package:flutter/material.dart';


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
          body:InkWell(
            // 去除水纹
            highlightColor: Colors.transparent,
            radius: 0.0,
            child: Column(
              children: <Widget>[

              ],
            ),
            onTap: (){
              FocusScope.of(context).requestFocus(FocusNode());
            },
          )
        )
    );
  }
}