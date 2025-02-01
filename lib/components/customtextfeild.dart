import 'package:flutter/material.dart';

class Customtextfeild extends StatelessWidget {
  final TextEditingController mycontroller;

  const Customtextfeild({super.key, required this.mycontroller});
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: mycontroller,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 18),
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          contentPadding: EdgeInsetsDirectional.only(
            start: 10,
            end: 10,
            bottom: 15,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ));
  }
}
