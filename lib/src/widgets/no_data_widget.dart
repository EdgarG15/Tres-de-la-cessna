// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  String text = '';

  NoDataWidget({this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/no_Data.png',
            height: 400,
            width: 500,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
