import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;

  const MyTextBox({super.key, required this.sectionName, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(sectionName),
            ],
          ),
          Text(text)
        ],
      ),
    );
  }
}
