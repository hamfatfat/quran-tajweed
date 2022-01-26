import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'pageviewerscreen.dart';

class QuranNovels {
  QuranNovels(int id, String name, int jump, String folder) {
    this.id = id;
    this.name = name;
    this.jump = jump;
    this.folder = folder;
  }
  late int id;
  late String name;
  late int jump;
  late  String folder;
}

enum ConfirmAction { CANCEL, ACCEPT }

class DashboardScreen extends StatelessWidget {
  final List<QuranNovels> quranNovels = [
    new QuranNovels(0, "رواية حفص وبالهامش قالون", 4, "quran01"),
    new QuranNovels(1, "رواية ورش عن نافع من طريق الأزرق", 4, "quran02"),
    new QuranNovels(2, "رواية ورش عن نافع من طريق الأصبهاني", 4, "quran03"),
    new QuranNovels(
        3, "مصحف ابن كثير برواية البزي وبالهامش قنبل", 4, "quran04"),
    new QuranNovels(
        4, "مصحف أبو عمرو البصري برواية الدوري وبالهامش السوسي", 6, "quran05"),
    new QuranNovels(
        5, "مصحف ابن عامر برواية هشام وبالهامش ابن ذكوان", 3, "quran06"),
    new QuranNovels(6, "رواية حفص وبالهامش شعبة", 3, "quran07"),
    new QuranNovels(7, "مصحف يعقوب برواية روح وبالهامش رويس", 4, "quran08"),
    new QuranNovels(
        8,
        "رواية حفص عن عاصم وبالهامش قراءة الإمام خلف العاشر من طريق الدرة",
        4,
        "quran09"),
    new QuranNovels(9, "مصحف القراءات", 0, "quran10")
  ];

  Future<bool?> _asyncConfirmDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('اضغط نعم لإغلاق البرنامج'),
          content: const Text(''),
          actions: <Widget>[
            FlatButton(
              child: const Text('كلا'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: const Text('نعم'),
              onPressed: () {
                exit(0);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> books = quranNovels
        .map((e) => (GestureDetector(
            child: new Container(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Card(
                    child: Row(children: [
                  new Container(
                      padding: EdgeInsets.only(
                          top: 10.0, bottom: 10, left: 10, right: 10),
                      child: CachedNetworkImage( placeholder: (context, url) =>
                          Container(child:Center(child:CircularProgressIndicator()), width: 50,height: 50,),
                          imageUrl: "https://azan.archi-tech-group.com/img/" + e.folder + "/page0.jpg",
                          width:100,
                          height:130),

                      // onZoomChanged: (double value) => print(value),
                      ),
                  Flexible(
                      child: Text(
                    e.name != null ? e.name : '',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  )),
                ]))),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(
                    idx: e.id, page: 0, jump: e.jump, name: e.name);
              }));
            })))
        .toList();
    return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF283406),
              automaticallyImplyLeading: false,
              title: Text('القراءات'),
            ),
            body: DecoratedBox(
                position: DecorationPosition.background,
                decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage('images/bg.png'), fit: BoxFit.cover),
                ),
                child: ListView(
                    scrollDirection: Axis.vertical, children: books)));
  }
}
