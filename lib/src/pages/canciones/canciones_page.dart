import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tres_de_la_cessna/src/pages/canciones/canciones_controller.dart';

class CancionesPage extends StatelessWidget {
  CancionesController con = Get.put(CancionesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FloatingActionButton(
        onPressed: () => con.goToCancionesCreate(),
        backgroundColor: Colors.amber,
        child: const Icon(Icons.music_note),
      ),
      appBar: AppBar(
        title: const Text('Canciones'),
      ),
      body: const Center(
        child: Text('Canciones'),
      ),
    );
  }
}
