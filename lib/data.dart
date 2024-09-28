import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

List<String> fillSourceArray() {
  return [
    'assets/images/cow.jpg',
    'assets/images/cow.jpg',
    'assets/images/giraffe.png',
    'assets/images/giraffe.png',
    'assets/images/monkey.jpg',
    'assets/images/monkey.jpg',
    'assets/images/panda.jpg',
    'assets/images/panda.jpg',
    'assets/images/tiger.png',
    'assets/images/tiger.png',
    'assets/images/wolf.jpg',
    'assets/images/wolf.jpg',
    'assets/images/cow.jpg',
    'assets/images/cow.jpg',
    'assets/images/cow.jpg',
    'assets/images/cow.jpg',
    'assets/images/cow.jpg',
    'assets/images/cow.jpg',
  ];
}

enum Level { Hard, Medium, Easy }

List getSourceArray(Level level) {
  List<String> levelList = [];
  List sourceArray = fillSourceArray();
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
