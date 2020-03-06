import 'package:flutter/material.dart';
import 'package:qurantajweed/screens/SharedPreferencesHelper.dart';
import 'contentscreen.dart';
import 'searchscreen.dart';
import 'slider.dart';

import 'dashboardscreen.dart';
import 'globals.dart' as globals;
class DetailScreen extends StatelessWidget {
  final int idx;
  final int page;
  final int jump;
  final String name;
  // In the constructor, require a Todo.
  Future<bool> _onWillPop(BuildContext context) async {
    return (await Navigator.push(context, MaterialPageRoute(builder: (_) {
      return DashboardScreen();
    })));
  }

  DetailScreen(
      {Key key,
      @required this.idx,
      @required this.page,
      @required this.jump,
      @required this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    final _imageUrls = List<String>.generate(
      629,
      (index) =>
          "http://94.237.91.161/quran" +
          ((idx + 1) < 10 ? "0" : "").toString() +
          (idx + 1).toString() +
          "/page" +
          index.toString() +
          ".jpg",
    );
    final List<QuranNovels> quranNovels = [
      new QuranNovels(0, "رواية حفص وبالهامش قالون", 4, "quran01"),
      new QuranNovels(1, "رواية ورش عن نافع من طريق الأزرق", 4, "quran02"),
      new QuranNovels(2, "رواية ورش عن نافع من طريق الأصبهاني", 4, "quran03"),
      new QuranNovels(
          3, "مصحف ابن كثير برواية البزي وبالهامش قنبل", 4, "quran04"),
      new QuranNovels(4, "مصحف أبو عمرو البصري برواية الدوري وبالهامش السوسي",
          6, "quran05"),
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

    return new WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text(name != null ? name : ''),
            ),
            body: DecoratedBox(
                position: DecorationPosition.background,
                decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage('images/bg.png'), fit: BoxFit.cover),
                ),
                child: SliderWidget(
                    imageUrls: _imageUrls,
                    imageBorderRadius: BorderRadius.circular(8.0),
                    idx: idx,
                    page: globals.currentPage,
                    jump: jump)),
            drawer: Drawer(
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Text(
                      name != null ? name : '',
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF283406),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.view_list),
                    title: Text('الفهرس',
                        style: TextStyle(fontSize: 15.0, color: Colors.black)),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return ContentScreen(
                            idx: idx,
                            jump: jump,
                            name: name != null ? name : '');
                      }));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.search),
                    title: Text('البحث',
                        style: TextStyle(fontSize: 15.0, color: Colors.black)),
                    onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return SearchScreen( idx: idx,
                            jump: jump,
                            name: name != null ? name : '');
                      }));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.book),
                    title: Text(quranNovels[0].name,
                        style: TextStyle(fontSize: 15.0, color: Colors.black)),
                    onTap: () async {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      int sharedPage = await SharedPreferencesHelper.getPage();
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return DetailScreen(
                            idx: quranNovels[0].id,
                            page: globals.currentPage,
                            jump: quranNovels[0].jump,
                            name: quranNovels[0].name);
                      }));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.book),
                    title: Text(quranNovels[1].name,
                        style: TextStyle(fontSize: 15.0, color: Colors.black)),
                    onTap: () async {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      int sharedPage = await SharedPreferencesHelper.getPage();
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return DetailScreen(
                            idx: quranNovels[1].id,
                            page: globals.currentPage,
                            jump: quranNovels[1].jump,
                            name: quranNovels[1].name);
                      }));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.book),
                    title: Text(quranNovels[2].name,
                        style: TextStyle(fontSize: 15.0, color: Colors.black)),
                    onTap: () async {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      int sharedPage = await SharedPreferencesHelper.getPage();
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return DetailScreen(
                            idx: quranNovels[2].id,
                            page: globals.currentPage,
                            jump: quranNovels[2].jump,
                            name: quranNovels[2].name);
                      }));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.book),
                    title: Text(quranNovels[3].name,
                        style: TextStyle(fontSize: 15.0, color: Colors.black)),
                    onTap: () async {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      int sharedPage = await SharedPreferencesHelper.getPage();
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return DetailScreen(
                            idx: quranNovels[3].id,
                            page: globals.currentPage,
                            jump: quranNovels[3].jump,
                            name: quranNovels[3].name);
                      }));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.book),
                    title: Text(quranNovels[4].name,
                        style: TextStyle(fontSize: 15.0, color: Colors.black)),
                    onTap: () async {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      int sharedPage = await SharedPreferencesHelper.getPage();
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return DetailScreen(
                            idx: quranNovels[4].id,
                            page: globals.currentPage,
                            jump: quranNovels[4].jump,
                            name: quranNovels[4].name);
                      }));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.book),
                    title: Text(quranNovels[5].name,
                        style: TextStyle(fontSize: 15.0, color: Colors.black)),
                    onTap: () async {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      int sharedPage = await SharedPreferencesHelper.getPage();
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return DetailScreen(
                            idx: quranNovels[5].id,
                            page: globals.currentPage,
                            jump: quranNovels[5].jump,
                            name: quranNovels[5].name);
                      }));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.book),
                    title: Text(quranNovels[6].name,
                        style: TextStyle(fontSize: 15.0, color: Colors.black)),
                    onTap: () async {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      int sharedPage = await SharedPreferencesHelper.getPage();
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return DetailScreen(
                            idx: quranNovels[6].id,
                            page: globals.currentPage,
                            jump: quranNovels[6].jump,
                            name: quranNovels[6].name);
                      }));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.book),
                    title: Text(quranNovels[7].name,
                        style: TextStyle(fontSize: 15.0, color: Colors.black)),
                    onTap: () async {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      int sharedPage = await SharedPreferencesHelper.getPage();
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return DetailScreen(
                            idx: quranNovels[7].id,
                            page: globals.currentPage,
                            jump: quranNovels[7].jump,
                            name: quranNovels[7].name);
                      }));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.book),
                    title: Text(quranNovels[8].name,
                        style: TextStyle(fontSize: 15.0, color: Colors.black)),
                    onTap: () async {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      int sharedPage = await SharedPreferencesHelper.getPage();
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return DetailScreen(
                            idx: quranNovels[8].id,
                            page: globals.currentPage,
                            jump: quranNovels[8].jump,
                            name: quranNovels[8].name);
                      }));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.book),
                    title: Text(quranNovels[9].name,
                        style: TextStyle(fontSize: 15.0, color: Colors.black)),
                    onTap: () async {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      int sharedPage = await SharedPreferencesHelper.getPage();
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return DetailScreen(
                            idx: quranNovels[9].id,
                            page: globals.currentPage,
                            jump: quranNovels[9].jump,
                            name: quranNovels[9].name);
                      }));
                    },
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (_) {
                //    return ContentScreen(idx: idx, jump: jump, name: this.name);
                //  }));
                _scaffoldKey.currentState.openDrawer();
              },
              label: Text('القائمة'),
              icon: Icon(Icons.view_list),
              backgroundColor: Color(0xFF283406),
            )));
  }
}
