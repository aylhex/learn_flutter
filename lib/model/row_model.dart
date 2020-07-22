import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';


class RowDemo extends StatefulWidget {
  @override
  _RowDemo createState() => _RowDemo();

}


class _RowDemo extends State<RowDemo> {
  static final  wordPair = new WordPair.random();
  final List<WordPair> _suggestions = <WordPair>[];
  static final Set<WordPair> saved = new Set<WordPair>();

  Widget _buildRow(WordPair pair){

    final bool alreadySaved = saved.contains(pair);
    return ListTile(
      title: Text(pair.toString(), style: TextStyle(fontSize: 20)),
      trailing:
      Icon(alreadySaved? Icons.favorite: Icons.favorite_border, color: alreadySaved ? Colors.red :null,),
      onTap: (){
        setState(() {
          if(alreadySaved){
            saved.remove(pair);
          }else{
            saved.add(pair);
          }
        });

      },
    );

  }


  Widget _listViewBuilder(BuildContext context, int index){

    if(index.isOdd){
      return new Divider();
    }
    _suggestions.addAll(generateWordPairs().take(10));

    final int num = index ~/ 2;
    // 如果是建议列表中最后一个单词对
    if (num >= _suggestions.length) {
      // ...接着再生成10个单词对，然后添加到建议列表
      _suggestions.addAll(generateWordPairs().take(10));
    }

    //return Text(_suggestions[num].toString(), style: TextStyle(fontSize: 20));
    return _buildRow(_suggestions[num]);

  }

  @override
  Widget build(BuildContext context) {

    void _pushSaved() {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context)
        {
          final Iterable<ListTile> tiles = saved.map((WordPair pair)
          {
            return new ListTile(title: Text(pair.asPascalCase, style: TextStyle(fontSize: 20)));
          });
          final List<Widget> divided = ListTile.divideTiles(context: context, tiles: tiles).toList();

          return new Scaffold(         // 新增 6 行代码开始 ...
              appBar: new AppBar(title: const Text('Saved Suggestions'),),
              body: new ListView(children: divided)
          );
        }
      ));
    }


    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter"),
          elevation: 20,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(16),
          child: ListView.builder(itemBuilder: _listViewBuilder),
        )
    );
  }
}