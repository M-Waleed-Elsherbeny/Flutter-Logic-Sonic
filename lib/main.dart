import 'package:flutter/material.dart';
import 'package:logic_with_sonic/root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logic with Sonic',
      debugShowCheckedModeBanner: false,
      home: MainRoot(),
    );
  }
  
}
