// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tres_de_la_cessna/src/models/set.dart';
import 'package:tres_de_la_cessna/src/pages/home/home_controller.dart';
import 'package:tres_de_la_cessna/src/widgets/no_data_widget.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  HomeController con = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOS TRES DE LA CESSNA'),
      ),
      body: GetBuilder<HomeController>(
        builder: (value) => Stack(
          children: [
            _listSets(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => con.goToSets(),
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _listSets(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: FutureBuilder(
        future: con.getSets(),
        builder: (context, AsyncSnapshot<List<Set>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                itemBuilder: (_, index) {
                  return _set(snapshot.data![index]);
                },
              );
            } else {
              return Center(
                child: NoDataWidget(
                  text: 'No hay Sets )=',
                ),
              );
            }
          } else {
            return Center(
              child: NoDataWidget(
                text: 'No hay Sets )=',
              ),
            );
          }
        },
      ),
    );
  }

  Widget _set(Set set) {
    return GestureDetector(
      onTap: () => con.goToCancionesPage(),
      child: Container(
        height: 60,
        //width: 100,
        margin: const EdgeInsets.only(top: 20),
        child: Card(
          color: Colors.blue[700],
          child: Center(
            child: Text(
              set.name ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
