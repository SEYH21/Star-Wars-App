import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/datajs.dart';
import 'Introducing_page.dart';

class CustomDrawer extends StatelessWidget {
  Future<List<Results>> fetchPeople() async {
    final url = Uri.parse("https://swapi.dev/api/people/");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final results = jsonData['results'] as List<dynamic>;
      return results.map((result) => Results.fromJson(result)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> photos = <String>[
      "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/634e5fa5-3672-4a97-961b-fd8789a1f486/deqhkpj-4035e96f-61a4-440f-8b5b-1d6a2f7315c4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzYzNGU1ZmE1LTM2NzItNGE5Ny05NjFiLWZkODc4OWExZjQ4NlwvZGVxaGtwai00MDM1ZTk2Zi02MWE0LTQ0MGYtOGI1Yi0xZDZhMmY3MzE1YzQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.GQC4csBcIkks25J0E9SouvSxvGnh55dVoselJLLPbpM",
      "https://freepngimg.com/thumb/star_wars/177821-c3po-free-download-image.png",
      "https://www.pngall.com/wp-content/uploads/9/Star-Wars-R2-D2-PNG-Images.png",
      "https://freepngimg.com/save/16909-star-wars-darth-vader-png/946x844",
      "https://static.wikia.nocookie.net/heroes-fr/images/9/9d/Dbqcrpy-4eb4c672-8953-41ca-be29-4fc0f38834aa.png/revision/latest?cb=20200720212708&path-prefix=fr",
      "https://static.wikia.nocookie.net/doblaje/images/8/84/Owen_Lars_Young_STAR_WARS.png/revision/latest?cb=20170930191515&path-prefix=es",
      "https://static.wikia.nocookie.net/jedipedia/images/b/b8/Beru_lars_detail.png/revision/latest/scale-to-width-down/120?cb=20130208132949&path-prefix=de", //beru
      "https://static.wikia.nocookie.net/battlefront/images/3/3c/Powerup_Display_SensorDroid_Rebel_01_big-7da91136.png/revision/latest?cb=20151230193400", //r5-d4
      "https://lumiere-a.akamaihd.net/v1/images/image_606ff7f7.jpeg?region=352%2C0%2C1170%2C878",
      "https://www.pngall.com/wp-content/uploads/9/Obi-Wan-Kenobi-PNG-Download-Image.png"
    ];
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/sw_logo.jpg"),
              ),
            ),
          ),
          FutureBuilder<List<Results>>(
            future: fetchPeople(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Veriler yüklenirken bir yüklenme göstergesi gösterin.
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final people = snapshot.data ?? [];
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final person = people[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: ListTile(
                          onTap: () {
                            // ignore: unnecessary_null_comparison
                            if (person != null) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => IntroducingPageScreen(
                                    characterName: person.name ?? "",
                                    characterHeight: person.height ?? "",
                                    characterMass: person.mass ?? "",
                                    characterHairColor: person.hairColor ?? "",
                                    characterSkinColor: person.skinColor ?? "",
                                    characterEyeColor: person.eyeColor ?? "",
                                    characterBirthYear: person.birthYear ?? "",
                                    characterGender: person.gender ?? "",
                                    characterImage: photos[index],
                                  ),
                                ),
                              );
                            }
                          },
                          tileColor: Color.fromARGB(66, 211, 68, 68),
                          title: Text(
                            person.name ?? "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Trajan Pro',
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: people.length,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class Person {
  String? name;

  Person({this.name});

  // JSON verilerini Person nesnesine dönüştürme.
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
    );
  }
}
