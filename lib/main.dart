import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/model/Constant.dart';
import 'package:testflutter/model/chip/feature_page.dart';
import 'package:testflutter/model/dynamic/dynamic_page.dart';
import 'package:testflutter/model/message/message_page.dart';
import 'package:testflutter/model/pages/nine_picture_view_widget.dart';
import 'package:testflutter/model/row_model.dart';
import 'package:testflutter/model/test_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BasicHome(),
    );
  }
}


class BasicHome extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return Home();
  }
}

class Home extends State<BasicHome>{
  final List<String> picList = [
    Constant.ASSETS_IMG+"test1.jpeg",
    Constant.ASSETS_IMG+"test2.jpeg",
    Constant.ASSETS_IMG+"test3.jpeg",
    Constant.ASSETS_IMG+"test4.jpeg",
    Constant.ASSETS_IMG+"test5.jpeg",
    Constant.ASSETS_IMG+"test6.jpeg",
    Constant.ASSETS_IMG+"test7.jpeg",
//    Constant.ASSETS_IMG+"test8.jpeg",
//    Constant.ASSETS_IMG+"test9.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    return DynamicPage();
  }
}





