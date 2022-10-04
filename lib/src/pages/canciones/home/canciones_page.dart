import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tres_de_la_cessna/src/models/set.dart';
import 'package:tres_de_la_cessna/src/pages/canciones/home/canciones_controller.dart';

// ignore: must_be_immutable
class CancionesPage extends StatelessWidget {
  CancionesController con = Get.put(CancionesController());
  Set set = Set();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buttonCreate(context, set),
      appBar: AppBar(
        title: Text(con.set.name ?? ''),
      ),
      body: const Center(
        child: Text('Canciones'),
      ),
    );
  }

  Widget _buttonCreate(BuildContext context, Set set) {
    return Container(
      alignment: Alignment.bottomRight,
      height: 70,
      margin: const EdgeInsets.only(bottom: 20, right: 20),
      child: FloatingActionButton(
        onPressed: () => con.openBottomSheet(context, con.set),
        child: const Icon(Icons.music_note),
      ),
    );
  }
}
