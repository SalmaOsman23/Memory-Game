import 'package:flutter/material.dart';
import 'package:memory_game/data.dart';
import 'package:memory_game/game_Screen.dart';
import 'package:memory_game/level_screen.dart';

class GameTypeScreen extends StatefulWidget {
  const GameTypeScreen({super.key, required this.level});
  final Level level;

  @override
  State<GameTypeScreen> createState() => _GameTypeScreenState();
}

class _GameTypeScreenState extends State<GameTypeScreen> {
  List<TypeDetails> typeDetails = [];

  @override
  void initState() {
    super.initState();

    // Populate typeDetails with the level-specific navigation functions
    typeDetails = [
      TypeDetails(
        name: "Vegetables",
        primaryColor: Colors.green,
        secondaryColor: Colors.green.withOpacity(0.5),
        goTo: GameScreen(level: widget.level, type: Type.Vegetables),
      ),
      TypeDetails(
        name: "Fruits",
        primaryColor: Colors.orange,
        secondaryColor: Colors.orange.withOpacity(0.5),
        goTo: GameScreen(level: widget.level, type: Type.Fruits),
      ),
      TypeDetails(
        name: "Animals",
        primaryColor: Colors.red,
        secondaryColor: Colors.red.withOpacity(0.5),
        goTo: GameScreen(level: widget.level, type: Type.Animals),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.red,
            size: 40,
          ),
        ),
        
        title: const Text(
          "Pick a type",
          style: TextStyle(
              color: Colors.red, fontSize: 30, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(height: MediaQuery.sizeOf(context).height / 20),
            SizedBox(
              height: MediaQuery.sizeOf(context).height *.8,
              child: ListView.builder(
                  itemCount: typeDetails.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    typeDetails[index].goTo));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: typeDetails[index].secondaryColor,
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
                                  color: typeDetails[index].primaryColor,
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
                                    typeDetails[index].name,
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

class TypeDetails {
  String name;
  Color primaryColor;
  Color secondaryColor;
  Widget goTo;
  TypeDetails(
      {required this.name,
      required this.primaryColor,
      required this.secondaryColor,
      required this.goTo});
}
