import 'package:flutter/material.dart';

class BackBtn extends StatelessWidget {
  final Color fill;

  const BackBtn({Key? key, required this.fill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0),
      child: RawMaterialButton(
          fillColor: fill,
          padding: const EdgeInsets.all(4.0),
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            size: 23.0,
          )),
    );
  }
}
