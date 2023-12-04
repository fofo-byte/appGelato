import 'package:flutter/material.dart';

class MessageScaffold extends StatelessWidget {
  const MessageScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Messages : ',
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
