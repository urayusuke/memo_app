import 'package:flutter/material.dart';
import 'package:memo_app/memo.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Memo_App'),
        ),
        body: Center(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Memo()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
