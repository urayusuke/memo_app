import 'package:cloud_firestore/cloud_firestore.dart';
import '../memos.dart';
import 'package:flutter/material.dart';

class MemoListModel extends ChangeNotifier {
  List<Memos> memos = [];

  Future fetchMemos() async {
    final docs = await FirebaseFirestore.instance.collection('memo').get();
    final memos = docs.docs.map((doc) => Memos(doc['content'])).toList();
    this.memos = memos;
    notifyListeners();
  }
}
