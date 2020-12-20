import 'package:flutter/material.dart';
import 'package:memo_app/memo_model.dart';
import 'package:provider/provider.dart';

class AddMemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MemoModel>(
        create: (context) => MemoModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('メモ作成'),
            actions: [modelAction],
          ),
          body: Consumer<MemoModel>(
            builder: (context, model, text) {
              return Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: '内 容'),
                    maxLines: 10,
                    style: TextStyle(fontSize: 20),
                    onChanged: (text) {
                      model.content = text;
                    },
                  ),
                ],
              );
            },
          ),
        ));
  }
}

get modelAction => Consumer<MemoModel>(
      builder: (context, model, text) => RaisedButton(
        child: Text('完了'),
        onPressed: () async {
          await model.addmemo();
          Navigator.pop(context);
        },
      ),
    );
