import 'package:flutter/material.dart';
import 'package:memo_app/addmemo/memo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'main/main_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MemoListModel>(
      create: (_) => MemoListModel()..fetchMemos(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('メモアプリ'),
        ),
        body: Consumer<MemoListModel>(
          builder: (context, model, child) {
            model.fetchMemos();
            final memos = model.memos;
            final listTiles = memos
                .map((memos) => ListTile(
                      title: Text(memos.content),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddMemo(
                                memos: memos,
                              ),
                            ),
                          );
                        },
                      ),
                    ))
                .toList();
            return ListView(
              children: listTiles,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => AddMemo(),
                  fullscreenDialog: true,
                ));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
