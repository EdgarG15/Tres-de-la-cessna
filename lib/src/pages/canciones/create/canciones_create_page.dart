// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tres_de_la_cessna/src/pages/canciones/create/canciones_create_controller.dart';

// ignore: must_be_immutable
class CancionesCreatePage extends StatelessWidget {
  CancionesCreateController con = Get.put(CancionesCreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundCover(context),
          _boxForm(context),
          Column(
            children: [
              _img(),
            ],
          ),
          _buttonBack(),
        ],
      ),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.4, left: 50, right: 50),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
          ]),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textYourInfo(),
            _textFieldCancion(),
            _textFieldLetra(),
            _buttonRegister(context)
          ],
        ),
      ),
    );
  }

  Widget _textFieldCancion() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: con.nameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            hintText: 'Nombre', prefixIcon: Icon(Icons.music_video_outlined)),
      ),
    );
  }

  Widget _textFieldLetra() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: TextField(
        controller: con.letterController,
        maxLines: 10,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Letra',
          prefixIcon: Container(
            margin: const EdgeInsets.only(bottom: 190),
            child: const Icon(Icons.format_list_bulleted_rounded),
          ),
        ),
      ),
    );
  }

  Widget _buttonRegister(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: ElevatedButton(
          onPressed: () => con.cancionesForm(),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15)),
          child: const Text(
            'AÑADIR',
            style: TextStyle(color: Colors.black),
          )),
    );
  }

  Widget _img() {
    return Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/LosTresDeLaCessna.png',
        width: 430,
        height: 430,
      ),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.45,
      color: Colors.black,
    );
  }

  Widget _textYourInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 30),
      child: const Text(
        'INGRESA LOS DATOS DE LA CANCION',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buttonBack() {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.only(left: 20),
      child: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 30,
        ),
      ),
    ));
  }
}
