import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pageviewerscreen.dart';
import 'globals.dart' as globals;
import 'quran.dart';
import 'sura.dart';

class SearchScreen extends StatefulWidget {
  final int idx;
  final int jump;
  final String name;
  SearchScreen({Key key, @required this.idx, @required this.jump, @required this.name}) : super(key: key);
  @override
  SearchScreenState createState() => new SearchScreenState(this.idx, this.jump, this.name);
}

class SearchScreenState extends State<SearchScreen> {
  final int idx;
  final int jump;
  final String name;
  SearchScreenState(@required this.idx, @required this.jump, @required this.name);

  TextEditingController editingController = TextEditingController();
  var items = List<Ayah>();
  var duplicateItems = List<Ayah>();
  @override
  void initState() {
    var quran = new Quran();
    //items=quran.getQuranAyat();
    duplicateItems = quran.getQuranAyat();
    super.initState();
  }

  void filterSearchResults(String query) {
    List<Ayah> dummySearchList = List<Ayah>();
    if (query.isNotEmpty) {
      List<Ayah> dummyListData = List<Ayah>();
      duplicateItems.forEach((item) {
        if (item.nass_safy.contains(query)) {
          item.suraText = soura.firstWhere((x) => x.id == item.sura).soura;
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        // items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('البحث'),
        ),
        body: DecoratedBox(
            position: DecorationPosition.background,
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                  image: AssetImage('images/bg.png'), fit: BoxFit.cover),
            ),
            child: Container(
                child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      filterSearchResults(value);
                    },
                    controller: editingController,
                    decoration: InputDecoration(
                        labelText: "البحث",
                        hintText: "البحث فقط في مصحف المدينة",
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)))),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          child: new Container(
                              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                              child: Card(
                                  elevation: 8.0,
                                  margin: new EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 6.0),
                                  child: Container(
                                      decoration: BoxDecoration(),
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 10.0),
                                        title: Text('${items[index].text}',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black)),
                                        subtitle: Text(
                                            '${items[index].suraText} صفحة: ${items[index].safha}'),
                                      )))),
                          onTap: () {
                            globals.currentPage=items[index].safha-1;
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return DetailScreen(
                                  idx: this.idx,
                                  page: items[index].safha,
                                  jump: this.jump,
                                  name: this.name);
                            }));
                          });
                    },
                  ),
                ),
              ],
            ))));
  }
}
