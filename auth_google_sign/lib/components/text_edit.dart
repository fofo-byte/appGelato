import 'package:flutter/material.dart';

class TextEdit extends StatelessWidget {
  final TextEditingController controller;
  final String textSection;

  const TextEdit(
      {super.key, required this.controller, required this.textSection});

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modification Profil'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              textSection,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Inserer votre nom'),
          )
        ],
      ),
    );
  }
}
