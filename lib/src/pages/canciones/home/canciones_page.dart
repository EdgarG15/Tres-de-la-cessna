import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tres_de_la_cessna/src/models/set.dart';
import 'package:tres_de_la_cessna/src/pages/canciones/create/canciones_create_controller.dart';
import 'package:tres_de_la_cessna/src/pages/canciones/home/canciones_controller.dart';

import '../../../models/canciones.dart';
import '../../../widgets/no_data_widget.dart';

// ignore: must_be_immutable
class CancionesPage extends StatelessWidget {
  CancionesCreateController con = Get.put(CancionesCreateController());
  CancionesController controller = Get.put(CancionesController());
  Set set = Set();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buttonCreate(),
      appBar: AppBar(
        title: Text(con.set.name ?? ''),
        leading: IconButton(
          onPressed: () => controller.goToHomePage(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: GetBuilder<CancionesCreateController>(
        builder: (value) => Stack(
          children: [
            _listCanciones(context),
          ],
        ),
      ),
    );
  }

  Widget _listCanciones(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: controller.getCanciones(),
          builder: (context, AsyncSnapshot<List<Canciones>> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    itemBuilder: (_, index) {
                      return _canciones(snapshot.data![index], index);
                    });
              } else {
                return Center(
                  child: NoDataWidget(text: 'No hay canciones'),
                );
              }
            } else {
              return Center(
                child: NoDataWidget(text: 'No hay canciones'),
              );
            }
          },
        ));
  }

  Widget _canciones(Canciones canciones, int index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60,
        //width: 100,
        margin: const EdgeInsets.only(top: 20),
        child: Card(
          color: Colors.blue[600],
          child: Container(
            alignment: Alignment.center,
            child: Text(
              canciones.name ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonCreate() {
    return Container(
      alignment: Alignment.bottomRight,
      height: 70,
      margin: const EdgeInsets.only(bottom: 20, right: 20),
      child: FloatingActionButton(
        onPressed: () => con.goToCancionesCreate(set),
        child: const Icon(Icons.music_note),
      ),
    );
  }
}