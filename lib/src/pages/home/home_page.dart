// ignore_for_file: must_be_immutable

import 'package:MusicaCessna/src/models/set.dart';
import 'package:MusicaCessna/src/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/no_data_widget.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  HomeController con = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('LOS TRES DE LA CESSNA'),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        builder: (value) => Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/LosTresDeLaCessna.png'),
                  fit: BoxFit.cover)),
          child: Stack(
            children: [
              _listSets(context),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => con.goToSets(),
        backgroundColor: Colors.white,
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
      onTap: () => con.goToCancionesPage(set),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        height: 65,
        //width: 100,
        margin: const EdgeInsets.only(top: 20),
        child: Card(
          color: Colors.white.withOpacity(0.9),
          child: ListTile(
            title: Container(
              alignment: Alignment.center,
              child: Text(
                set.name ?? '',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
            trailing: PopupMenuButton<int>(
              itemBuilder: (context) => [
                // PopupMenuItem 1
                PopupMenuItem(
                  value: 1,
                  // row with 2 children
                  child: Row(
                    children: const [
                      Icon(Icons.update),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Actualizar")
                    ],
                  ),
                ),
                // PopupMenuItem 2
                PopupMenuItem(
                  value: 2,
                  // row with two children
                  child: Row(
                    children: const [
                      Icon(Icons.delete),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Eliminar")
                    ],
                  ),
                ),
              ],
              //offset: Offset(0, 100),
              color: Colors.grey[100],
              elevation: 2,
              // on selected we show the dialog box
              onSelected: (value) {
                // if value 1 show dialog
                if (value == 1) {
                  con.goToUpdateSetPage(set);
                  // if value 2 show dialog
                } else if (value == 2) {}
              },
            ),
          ),
        ),
      ),
    );
  }
}
