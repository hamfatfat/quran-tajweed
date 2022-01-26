import 'package:flutter/material.dart';

import 'pageviewerscreen.dart';
import 'globals.dart' as globals;
import 'sura.dart';

class ContentScreen extends StatelessWidget {
  final int idx;
  final int jump;
  final String name;
  // In the constructor", require a Todo.
  ContentScreen(
      {key, required this.idx, required this.jump, required this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> souras = soura
        .map((e) => (GestureDetector(
            child: new Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Card(
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(e.soura != null ? e.soura : ''),
                              Text(e.page != null ? e.page.toString() : ''),
                            ])))),
            onTap: () {
              globals.currentPage = e.page - 1;
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(
                    idx: this.idx,
                    page: e.page - 1,
                    jump: this.jump,
                    name: this.name);
              }));
            })))
        .toList();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF283406),
          title: Text('الفهرس'),
        ),
        body: DecoratedBox(
            position: DecorationPosition.background,
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                  image: AssetImage('images/bg.png'), fit: BoxFit.cover),
            ),
            child: ListView(scrollDirection: Axis.vertical, children: souras)));
  }
}
