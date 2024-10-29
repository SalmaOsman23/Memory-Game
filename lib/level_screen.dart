import 'package:flutter/material.dart';
import 'package:memory_game/data.dart';
import 'package:memory_game/game_type_screen.dart';

class LevelScreen extends StatefulWidget {
  const LevelScreen({super.key});

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const  Text(
              "Select Difficulty Level",
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.w600, fontSize: 30),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height / 20),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .8,
              child: ListView.builder(
                  itemCount: detailsList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    detailsList[index].goTo));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: detailsList[index].secondaryColor,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 4,
                                        color: Colors.black45,
                                        spreadRadius: 0.5,
                                        offset: Offset(3, 4))
                                  ]),
                            ),
                            Container(
                              height: 90,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: detailsList[index].primaryColor,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 4,
                                        color: Colors.black12,
                                        spreadRadius: 0.3,
                                        offset: Offset(5, 3))
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    detailsList[index].name,
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                            color: Colors.black26,
                                            blurRadius: 2,
                                            offset: Offset(1, 2),
                                          ),
                                          Shadow(
                                            color: Colors.green,
                                            blurRadius: 2,
                                            offset: Offset(0.5, 2),
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class LevelDetails {
  String name;
  Color primaryColor;
  Color secondaryColor;
  Widget goTo;
  LevelDetails(
      {required this.name,
      required this.primaryColor,
      required this.secondaryColor,
      required this.goTo});
}

List<LevelDetails> detailsList = [
  LevelDetails(
      name: "EASY",
      primaryColor: Colors.green,
      secondaryColor: Colors.green.withOpacity(0.5),
      goTo: const GameTypeScreen(
        level: Level.Easy,
      )),
  LevelDetails(
      name: "MEDIUM",
      primaryColor: Colors.orange,
      secondaryColor: Colors.orange.withOpacity(0.5),
      goTo: const GameTypeScreen(level: Level.Medium)),
  LevelDetails(
      name: "HARD",
      primaryColor: Colors.red,
      secondaryColor: Colors.red.withOpacity(0.5),
      goTo: const GameTypeScreen(
        level: Level.Hard,
      )),
];
