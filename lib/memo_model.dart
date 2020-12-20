import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MemoModel with ChangeNotifier {
  String content = '';

  CollectionReference memo = FirebaseFirestore.instance.collection('memo');

  Future<void> addmemo() {
    return memo.add({'content': content});
  }
}
