import 'package:cloud_firestore/cloud_firestore.dart';
import '../memos.dart';
import 'package:flutter/material.dart';

class MemoListModel extends ChangeNotifier {
  List<Memos> memos = [];

  Future fetchMemos() async {
    final document = await FirebaseFirestore.instance.collection('memo').get();
    // Memosのcontentにドキュメントとして、値を代入している
    final memos = document.docs.map((doc) => Memos(doc)).toList();
    this.memos = memos;
    notifyListeners();
  }
}
