import 'package:flutter/material.dart';
import 'package:star_wars_app/pages/main_page.dart';

void main() {
  runApp(StarWarsApp());
}

class StarWarsApp extends StatelessWidget {
  const StarWarsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPageScreen(),
    );
  }
}
