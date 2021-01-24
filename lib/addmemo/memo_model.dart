import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../memos.dart';

class MemoModel with ChangeNotifier {
  String content = '';

  CollectionReference memo = FirebaseFirestore.instance.collection('memo');

  Future<void> addmemo() {
    if (content.isEmpty) {
      throw ('空で保存出来ません');
    }
    return memo.add(
      {
        'content': content,
        'createdAt': Timestamp.now(),
      },
    );
  }

  Future updatememo(Memos memos) async {
    final document =
        FirebaseFirestore.instance.collection('memo').doc(memos.documentID);
    await document.update(
      {
        'content': content,
        'updateAt': Timestamp.now(),
      },
    );
  }
}
