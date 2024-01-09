import 'package:flutter/material.dart';

import 'views/screen1.dart';
import 'views/screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: screen1(),routes: {screen1.routeName :(context) =>  screen1(),screen2.routeName :(context) =>  screen2(), },
    );}
}
