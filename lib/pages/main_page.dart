import 'package:flutter/material.dart';

import 'drawer.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          "STAR WARS",
          style: TextStyle(fontFamily: 'Starjedi', fontSize: 28),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/gif.gif"),
          ),
        ),
        child: Column(),
      ),
    );
  }
}
