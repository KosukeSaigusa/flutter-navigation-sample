import 'package:flutter/material.dart';

class TimelineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タイムライン'),
      ),
      body: const Center(child: Text('タイムラインの画面')),
    );
  }
}
