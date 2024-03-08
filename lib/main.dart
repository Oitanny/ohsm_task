import 'package:flutter/material.dart';
import 'package:hotelvista/views/sales.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OHSM',

      home:  SalesPage(),
    );
  }
}

