import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sets_update_controller.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class SetsUpdatePage extends StatelessWidget {
  SetsUpdateController con = Get.put(SetsUpdateController());

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
      height: MediaQuery.of(context).size.height * 0.45,
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
          children: [_textYourInfo(), _textFieldSet(), _buttonUpdate(context)],
        ),
      ),
    );
  }

  Widget _textFieldSet() {
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

  Widget _buttonUpdate(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: ElevatedButton(
          onPressed: () => con.updateSets(context),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15)),
          child: const Text(
            'Actualizar',
            style: TextStyle(color: Colors.black),
          )),
    );
  }

  Widget _img() {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      child: Image.asset(
        'assets/LosTresDeLaCessna.png',
        width: 330,
        height: 330,
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
        'INGRESA El NOMBRE DEL APARTADO',
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
