import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('No Data'),
      ),
      body: const Center(
        child: Text('No Data'),
      ),
    );
  }
}
