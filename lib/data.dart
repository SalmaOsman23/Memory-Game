import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/utils/app_assets.dart';

// List<String> fillAnimalSourceArray() {
//   return [
//     'assets/animals/images/cow.jpg',
//     'assets/animals/images/cow.jpg',
//     'assets/animals/images/giraffe.png',
//     'assets/animals/images/giraffe.png',
//     'assets/animals/images/monkey.jpg',
//     'assets/animals/images/monkey.jpg',
//     'assets/animals/images/panda.jpg',
//     'assets/animals/images/panda.jpg',
//     'assets/animals/images/tiger.png',
//     'assets/animals/images/tiger.png',
//     'assets/animals/images/wolf.jpg',
//     'assets/animals/images/wolf.jpg',
//     'assets/animals/images/turtle.jpg',
//     'assets/animals/images/turtle.jpg',
//     'assets/animals/images/zebra.png',
//     'assets/animals/images/zebra.png',
//     'assets/animals/images/elephant.jpg',
//     'assets/animals/images/elephant.jpg',
//   ];
// }
List<String> fillAnimalSourceArray() {
  return [
    AppAssets.cowImage,
    AppAssets.cowImage,
    AppAssets.giraffeImage,
    AppAssets.giraffeImage,
    AppAssets.giraffeImage,
    AppAssets.giraffeImage,
    AppAssets.pandaImage,
    AppAssets.pandaImage,
    AppAssets.tigerImage,
    AppAssets.tigerImage,
    AppAssets.wolfImage,
    AppAssets.wolfImage,
    AppAssets.turtleImage,
    AppAssets.turtleImage,
    AppAssets.zebraImage,
    AppAssets.zebraImage,
    AppAssets.eggplantImage,
    AppAssets.eggplantImage,
  ];
}

enum Level { Hard, Medium, Easy }
enum Type { Animals, Fruits, Vegetables }

List getSourceArray(Level level) {
  List<String> levelList = [];
  List sourceArray = fillAnimalSourceArray();
  if (level == Level.Hard) {
    sourceArray.forEach((element) {
      levelList.add(element);
    });
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      levelList.add(sourceArray[i]);
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 6; i++) {
      levelList.add(sourceArray[i]);
    }
  }
  levelList.shuffle();
  return levelList;
}

List<bool> getInitialItemState(Level level) {
  List<bool> initialItemState = [];
  if (level == Level.Hard) {
    for (int i = 0; i < 18; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.Medium) {
    for (int i = 0; i < 18; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 18; i++) {
      initialItemState.add(true);
    }
  }
  return initialItemState;
}

List<GlobalKey<FlipCardState>> getCardStateKeys(Level level) {
  List<GlobalKey<FlipCardState>> cardStateKeys = [];
  if (level == Level.Hard) {
    for (int i = 0; i < 18; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 6; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  }
  return cardStateKeys;
}
