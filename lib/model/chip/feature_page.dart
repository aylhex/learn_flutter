import 'package:flutter/material.dart';


class FeaturePage extends StatefulWidget {
  @override
  _FeaturePage createState() => _FeaturePage();

}


class _FeaturePage extends State<FeaturePage> {

  /// 标签的list
  final List<String> dataList = ["个性化选择", "读书"];

  /// 标签的list
  final List<String> selectList = [];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("个性化选择"),),
      body:Container(
        padding: EdgeInsets.only(left: 8, right: 8),
        child:  Wrap(
          spacing: 4,
          runSpacing: -8,
          children: <Widget>[
            Chip(label: Text("个性化选择")),
            Chip(label: Text("读书")),
            Chip(label: Text("旅游")),
            Chip(label: Text("历史")),
            Chip(label: Text("金融")),
            Chip(label: Text("开车")),
            Chip(label: Text("游泳")),
          ],
        ),
      )
    );
  }
}