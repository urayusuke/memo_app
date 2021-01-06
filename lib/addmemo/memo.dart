import 'package:flutter/material.dart';
import 'package:memo_app/addmemo/memo_model.dart';
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
                      filled: true,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      border: InputBorder.none,
                      hintText: '内 容',
                    ),
                    maxLines: 20,
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
      builder: (context, model, text) => FlatButton(
        child: Text(
          '保 存',
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
        onPressed: () async {
          try {
            await model.addmemo();
            await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('保存しました'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('OK'),
                        onPressed: () {
                          // メモ作成画面に戻す
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                });
            // トップ画面へ戻す
            Navigator.of(context).pop();
          } catch (e) {
            await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(e.toString()),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                });
          }
        },
      ),
    );
