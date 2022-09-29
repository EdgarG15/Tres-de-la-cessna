import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tres_de_la_cessna/src/pages/home/home_page.dart';
import 'package:tres_de_la_cessna/src/pages/sets/sets_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Los Tres de la Cessna',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      getPages: [
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/sets', page: () => SetsPage())
      ],
    );
  }
}
