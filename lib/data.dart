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
List<String> fillFruitsSourceArray() {
  return [
    AppAssets.appleImage,
    AppAssets.appleImage,
    AppAssets.avocadoImage,
    AppAssets.avocadoImage,
    AppAssets.mangoImage,
    AppAssets.mangoImage,
    AppAssets.plumImage,
    AppAssets.plumImage,
    AppAssets.pineappleImage,
    AppAssets.pineappleImage,
    AppAssets.watermelonImage,
    AppAssets.watermelonImage,
    AppAssets.orangeImage,
    AppAssets.orangeImage,
    AppAssets.strawberryImage,
    AppAssets.strawberryImage,
    AppAssets.bananaImage,
    AppAssets.bananaImage,
  ];
}
List<String> fillVegetablesSourceArray() {
  return [
    AppAssets.broccoliImage,
    AppAssets.broccoliImage,
    AppAssets.carrotImage,
    AppAssets.carrotImage,
    AppAssets.courgetteImage,
    AppAssets.courgetteImage,
    AppAssets.eggplantImage,
    AppAssets.eggplantImage,
    AppAssets.hotPepperImage,
    AppAssets.hotPepperImage,
    AppAssets.onionImage,
    AppAssets.onionImage,
    AppAssets.peasImage,
    AppAssets.peasImage,
    AppAssets.potatoImage,
    AppAssets.potatoImage,
    AppAssets.tomatoImage,
    AppAssets.tomatoImage,
  ];
}

enum Level { Hard, Medium, Easy }
enum Type { Animals, Fruits, Vegetables }

// List getSourceArray(Level level, Type type) {
//   List<String> levelList = [];
//   List sourceArray = fillAnimalSourceArray();
//   if (level == Level.Hard) {
//     sourceArray.forEach((element) {
//       levelList.add(element);
//     });
//   } else if (level == Level.Medium) {
//     for (int i = 0; i < 12; i++) {
//       levelList.add(sourceArray[i]);
//     }
//   } else if (level == Level.Easy) {
//     for (int i = 0; i < 6; i++) {
//       levelList.add(sourceArray[i]);
//     }
//   }
//   levelList.shuffle();
//   return levelList;
// }

// List<bool> getInitialItemState(Level level) {
//   List<bool> initialItemState = [];
//   if (level == Level.Hard) {
//     for (int i = 0; i < 18; i++) {
//       initialItemState.add(true);
//     }
//   } else if (level == Level.Medium) {
//     for (int i = 0; i < 18; i++) {
//       initialItemState.add(true);
//     }
//   } else if (level == Level.Easy) {
//     for (int i = 0; i < 18; i++) {
//       initialItemState.add(true);
//     }
//   }
//   return initialItemState;
// }

// List<GlobalKey<FlipCardState>> getCardStateKeys(Level level) {
//   List<GlobalKey<FlipCardState>> cardStateKeys = [];
//   if (level == Level.Hard) {
//     for (int i = 0; i < 18; i++) {
//       cardStateKeys.add(GlobalKey<FlipCardState>());
//     }
//   } else if (level == Level.Medium) {
//     for (int i = 0; i < 12; i++) {
//       cardStateKeys.add(GlobalKey<FlipCardState>());
//     }
//   } else if (level == Level.Easy) {
//     for (int i = 0; i < 6; i++) {
//       cardStateKeys.add(GlobalKey<FlipCardState>());
//     }
//   }
//   return cardStateKeys;
// }
// Function to select source array based on type
List<String> getTypeSourceArray(Type type) {
  switch (type) {
    case Type.Animals:
      return fillAnimalSourceArray();
    case Type.Fruits:
      return fillFruitsSourceArray();
    case Type.Vegetables:
      return fillVegetablesSourceArray();
    default:
      return [];
  }
}

// Function to get source array based on level and type
List<String> getSourceArray(Level level, Type type) {
  List<String> levelList = [];
  List<String> sourceArray = getTypeSourceArray(type);

  int itemCount;
  if (level == Level.Hard) {
    itemCount = sourceArray.length;
  } else if (level == Level.Medium) {
    itemCount = 12;
  } else {
    itemCount = 6;
  }

  for (int i = 0; i < itemCount; i++) {
    levelList.add(sourceArray[i]);
  }
  levelList.shuffle();
  return levelList;
}

// Function to initialize item states based on level
List<bool> getInitialItemState(Level level) {
  int itemCount = level == Level.Hard ? 18 : (level == Level.Medium ? 12 : 6);
  return List.generate(itemCount, (_) => true);
}

// Function to initialize card state keys based on level
List<GlobalKey<FlipCardState>> getCardStateKeys(Level level) {
  int itemCount = level == Level.Hard ? 18 : (level == Level.Medium ? 12 : 6);
  return List.generate(itemCount, (_) => GlobalKey<FlipCardState>());
}