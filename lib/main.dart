import 'package:flutter/material.dart';
import 'package:proaims/provider/detailsListProvider.dart';
import 'package:proaims/ui/detaildView.dart';
import 'package:proaims/ui/homePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DetailListProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {"/detailList": (context) => DetailedView()},
    );
  }
}
