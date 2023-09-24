import 'package:flutter/material.dart';

class IntroducingPageScreen extends StatelessWidget {
  final String characterName;

  final String characterHeight;
  final String characterMass;
  final String characterHairColor;
  final String characterSkinColor;
  final String characterEyeColor;
  final String characterBirthYear;
  final String characterGender;
  final String characterImage;

  const IntroducingPageScreen({
    required this.characterName,
    required this.characterHeight,
    required this.characterMass,
    required this.characterHairColor,
    required this.characterSkinColor,
    required this.characterEyeColor,
    required this.characterBirthYear,
    required this.characterGender,
    required this.characterImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          characterName,
          style: TextStyle(fontSize: 32),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/wp.jpg"), fit: BoxFit.cover)),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Expanded(
                    child: Image.network(
                      characterImage,
                      fit: BoxFit.contain,
                      height: 200,
                    ),
                  ),
                  CustomListTile("Height: $characterHeight"),
                  CustomListTile("Mass: $characterMass"),
                  CustomListTile("Hair Color: $characterHairColor"),
                  CustomListTile("Skin Color: $characterSkinColor"),
                  CustomListTile("Eye Color: $characterEyeColor"),
                  CustomListTile("Birth Year: $characterBirthYear"),
                  CustomListTile("Gender: $characterGender"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomListTile(String value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: Colors.deepPurple,
        elevation: 10,
        child: ListTile(
          title: Center(
            child: Text(
              value,
              style: const TextStyle(
                  color: Color.fromARGB(255, 90, 216, 40),
                  fontFamily: "Starjedi"),
            ),
          ),
        ),
      ),
    );
  }
}
