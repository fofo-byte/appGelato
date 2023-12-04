import 'package:flutter/material.dart';

class FavoriteScaffold extends StatelessWidget {
  const FavoriteScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoris"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Favoris: ',
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
