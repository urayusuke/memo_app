import 'package:flutter/material.dart';
import 'package:memo_app/memos.dart';
import 'package:memo_app/addmemo/memo_model.dart';
import 'package:provider/provider.dart';

class EditMemo extends StatelessWidget {
  final Memos memos;
  EditMemo({this.memos});
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
          title: Text('編集'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_sharp),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Consumer<MemoModel>(
          builder: (context, model, text) {
            return Column(
              children: <Widget>[
                TextField(
                  controller: textEditingController,
                  onChanged: (text) {
                    model.content = text;
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
