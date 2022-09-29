// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tres_de_la_cessna/src/pages/home/home_controller.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  HomeController con = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOS TRES DE LA CESSNA'),
      ),
      body: const Center(
        child: Text('Los tres de la cessna'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => con.goToSets(),
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),
    );
  }
}
