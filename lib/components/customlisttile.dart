import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String theTitle;
  final String subtitle;

  const CustomListTile({
    super.key,
    required this.theTitle,
    required this.subtitle,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        theTitle,
        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        textAlign: TextAlign.right,
      ),
      subtitle: Text(subtitle,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
    );
  }
}
