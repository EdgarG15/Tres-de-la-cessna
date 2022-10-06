import 'package:MusicaCessna/src/pages/canciones/create/canciones_create_page.dart';
import 'package:MusicaCessna/src/pages/canciones/list/canciones_page.dart';
import 'package:MusicaCessna/src/pages/home/home_page.dart';
import 'package:MusicaCessna/src/pages/letras/letras_page.dart';
import 'package:MusicaCessna/src/pages/sets/sets_page.dart';
import 'package:MusicaCessna/src/pages/sets/update/sets_update_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/pages/canciones/update/canciones_update_page.dart';

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
        //brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.amber,
        textTheme: GoogleFonts.arsenalTextTheme(),
      ),
      home: HomePage(),
      getPages: [
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/sets', page: () => SetsPage()),
        GetPage(name: '/canciones', page: () => CancionesPage()),
        GetPage(name: '/canciones_create', page: () => CancionesCreatePage()),
        GetPage(name: '/letras', page: () => LetrasPage()),
        GetPage(name: '/sets/update', page: () => SetsUpdatePage()),
        GetPage(name: '/canciones/update', page: () => CancionesUpdatePage()),
      ],
    );
  }
}
