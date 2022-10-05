import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tres_de_la_cessna/src/models/canciones.dart';
import 'package:tres_de_la_cessna/src/pages/letras/letras_controller.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class LetrasPage extends StatelessWidget {
  LetrasController con = Get.put(LetrasController());
  Canciones canciones = Canciones();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(con.canciones.name ?? ''),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 20, bottom: 50),
              child: Text(
                con.canciones.letter ?? '',
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
