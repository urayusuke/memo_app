import 'package:flutter/material.dart';

class Memo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("メモ作成"),
      ),
      body: Container(
        child: TextField(
          decoration:
              InputDecoration(border: InputBorder.none, hintText: '内 容'),
          maxLines: 10,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
