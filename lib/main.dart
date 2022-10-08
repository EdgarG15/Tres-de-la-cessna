import 'package:MusicaCessna/src/pages/canciones/create/canciones_create_page.dart';
import 'package:MusicaCessna/src/pages/canciones/list/canciones_page.dart';
import 'package:MusicaCessna/src/pages/home/home_page.dart';
import 'package:MusicaCessna/src/pages/letras/letras_page.dart';
import 'package:MusicaCessna/src/pages/sets/sets_page.dart';
import 'package:MusicaCessna/src/pages/sets/update/sets_update_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
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
      home: _splash(),
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

  Widget _splash() {
    return SplashScreenView(
      navigateRoute: HomePage(),
      duration: 5000,
      imageSize: 500,
      imageSrc: "assets/LosTresDeLaCessna.png",
      text: "Los Tres de la Cessna",
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(
        fontSize: 40.0,
      ),
      colors: const [
        Colors.yellow,
        Colors.white,
        Colors.amber,
        Colors.white,
      ],
      backgroundColor: Colors.black,
    );
  }

  // Widget _pogressCircular() {
  //   return Center(
  //     child: Container(
  //       height: 50,
  //       width: 50,
  //       alignment: Alignment.bottomCenter,
  //       child: const CircularStepProgressIndicator(
  //         totalSteps: 100,
  //         currentStep: 72,
  //         selectedColor: Colors.yellow,
  //         unselectedColor: Colors.white,
  //         padding: 0,
  //         width: 100,
  //         child: Icon(
  //           Icons.music_note_sharp,
  //           color: Colors.amber,
  //           size: 25,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
