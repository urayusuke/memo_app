import 'package:flutter/material.dart';
import 'package:memo_app/addmemo/memo_model.dart';
import 'package:provider/provider.dart';
import 'package:memo_app/memos.dart';

class AddMemo extends StatelessWidget {
  final Memos memos;
  AddMemo({this.memos});
  @override
  Widget build(BuildContext context) {
    final textEditingController = TextEditingController();
    final bool isUpdate = memos != null;
    if (isUpdate) {
      textEditingController.text = memos.content;
    }
    return ChangeNotifierProvider<MemoModel>(
        create: (context) => MemoModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(isUpdate ? 'メモの編集' : 'メモの作成'),
            // actions: [isUpdate ? modelUpdateAction : modelAddAction],
            actions: [],
          ),
          body: Consumer<MemoModel>(
            builder: (context, model, text) {
              return Column(
                children: <Widget>[
                  TextField(
                    controller: textEditingController,
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
                  TextButton(
                    child: Text(
                      isUpdate ? '更新' : '保 存',
                      style: TextStyle(
                        fontSize: 17,
                        // color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      if (isUpdate) {
                        await modelUpdateAction(model, memos, context);
                      } else {
                        await modelAddAction(model, context);
                      }
                    },
                  )
                ],
              );
            },
          ),
        ));
  }
}

Future modelAddAction(MemoModel model, BuildContext context) async {
  try {
    await model.addmemo();
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('保存しました'),
            actions: <Widget>[
              TextButton(
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
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}

Future modelUpdateAction(
    MemoModel model, Memos memos, BuildContext context) async {
  try {
    await model.updatememo(memos);
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('更新しました'),
            actions: <Widget>[
              TextButton(
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
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
