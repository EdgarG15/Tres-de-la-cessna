import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/canciones.dart';
import 'letras_controller.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class LetrasPage extends StatelessWidget {
  LetrasController con = Get.put(LetrasController());
  Canciones canciones = Canciones();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(con.canciones.name ?? ''),
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: IconButton(
                tooltip: 'Disminuir Tamaño',
                onPressed: () => con.disminuirLetra(),
                icon: const Icon(Icons.text_decrease),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: IconButton(
                tooltip: 'Aumentar Tamaño',
                onPressed: () => con.aumentarLetra(),
                icon: const Icon(Icons.text_increase),
              ),
            ),
          ],
        ),
        body: ScrollConfiguration(
          behavior: const ScrollBehavior(),
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: Colors.white,
            child: ListView(
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 20, bottom: 50, right: 10, left: 10),
                    child: SelectableText(
                      con.canciones.letter ?? '',
                      style: TextStyle(
                          fontSize: con.fontSize.value,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
