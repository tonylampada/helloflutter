import 'package:flutter/material.dart';
import 'package:helloflutter/login.dart';

void main() {
  runApp(MinhaApp());
}

class MinhaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Minha AppBar'),
      ),
      body: LoginWidget(),
    ));
  }
}
