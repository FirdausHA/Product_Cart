import 'package:example_cart/Bottom.dart';
import 'package:example_cart/screens/Dashboard.dart';
import 'package:example_cart/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false ,home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watch Store',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff293f6e),
        iconTheme: IconThemeData(
          color: Color(0xffbacad9),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff293f6e),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color(0xffbacad9),
          ),
        ),
        backgroundColor: Color(0xff293f6e),
      ),
      home: Home(),
    );
  }
}
