// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import './screens/dashboardscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("ar", "LB"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: Locale("ar", "LB"),
        title: 'إقرأ',
        home: Scaffold(
            body: DoubleBackToCloseApp(
          child: DashboardScreen(),
          snackBar: const SnackBar(
            content: Text('اضغط مرة أخرى لإغلاق البرنامج'),
          ),
        )),
        theme: ThemeData(
          // Define the default brightness and colors.
          //brightness: Brightness.dark,
          primaryColor: Color(0xFF283406),
          accentColor: Colors.cyan[600],
        ));
  }
}
