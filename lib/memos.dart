import 'package:cloud_firestore/cloud_firestore.dart';

class Memos {
  Memos(DocumentSnapshot document) {
    documentID = document.id;
    content = document['content'];
  }
  String documentID;
  String content;
}
