import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tres_de_la_cessna/src/models/set.dart';
import 'package:tres_de_la_cessna/src/pages/canciones/canciones_controller.dart';

// ignore: must_be_immutable
class CancionesPage extends StatelessWidget {
  CancionesController con = Get.put(CancionesController());
  Set set = Set();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FloatingActionButton(
        onPressed: () => con.goToCancionesCreate(),
        backgroundColor: Colors.amber,
        child: const Icon(Icons.music_note),
      ),
      appBar: AppBar(
        title: Text(con.set.name ?? ''),
      ),
      body: const Center(
        child: Text('Canciones'),
      ),
    );
  }
}
