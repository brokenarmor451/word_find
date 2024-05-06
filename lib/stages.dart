import 'package:flutter/material.dart';
import 'package:flame/components.dart';

import 'levels.dart';
import 'level.dart';
import 'button.dart';
import 'solveds.dart';
import 'main_menu.dart';
import 'word_find_game.dart';

abstract class Stage extends PositionComponent with HasGameReference<WordFindGame> {
  Stage(this.mainMenuReference) {
    solveds = Solveds();
  }

  final List<MyButton> levelButtons = [];

  late final double levelButtonWidth;
  late final double levelButtonHeight;
  double x = 0;
  double y = 0;

  late final Solveds solveds;

  // to get corresponding level index if
  // level is higher than 25
  final stageDifference = 0;

  // to remove main menu and enter to level
  late final MainMenu mainMenuReference;

  // to enter specified level
  final List<Level> levels = [];

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    levelButtonWidth = game.size.x / 5;
    levelButtonHeight = game.size.y / 2 / 5;

    await _makeLevelButtons();

    addAll(levelButtons);
  }

  void _enterToLevelIfItIsOpen(int index) {
    if(solveds.solvedsAsString[index + stageDifference] == 'O' || solveds.solvedsAsString[index + stageDifference] == 'Y') {
      selectedLevelIndex = index + stageDifference;
      game.world.remove(mainMenuReference);
      game.world.add(levels[index]);
    }
  }

  Future<void> _makeLevelButtons() async {
    await solveds.makeSolveds();

    final List<Color> buttonsColors = List.generate(
      levels.length,
      (index) {
        switch(solveds.solvedsAsString[index + stageDifference]) {
          case 'Y':
            return Level.green;
          case 'O':
            return Level.purple2;
          default:
            return Level.gray;
        }
      },
      growable: false,
    );

    for(int i = 0; i < levels.length; i++) {
      switch(i) {
        case 5:
          y += levelButtonHeight;
          x = 0;
          break;
        case 10:
          y += levelButtonHeight;
          x = 0;
          break;
        case 15:
          y += levelButtonHeight;
          x = 0;
          break;
        case 20:
          y += levelButtonHeight;
          x = 0;
          break;
      }

      levelButtons.add(
        MyButton(
          text: (i + stageDifference + 1).toString(),
          position: Vector2(x, y),
          size: Vector2(
            levelButtonWidth,
            levelButtonHeight,
          ),
          backgroundColor: buttonsColors[i],
          textColor: Level.yellow,
          runFunction: () {
            _enterToLevelIfItIsOpen(i);
          },
        )
      );

      x += levelButtonWidth;

    }
  }
}

class Stage1 extends Stage{
  Stage1(super.mainMenuReference);

  final List<Level> levels = [
    Level1(),
    Level2(),
    Level3(),
    Level4(),
    Level5(),
    Level6(),
    Level7(),
    Level8(),
    Level9(),
    Level10(),
    Level11(),
    Level12(),
    Level13(),
    Level14(),
    Level15(),
    Level16(),
    Level17(),
    Level18(),
    Level19(),
    Level20(),
    Level21(),
    Level22(),
    Level23(),
    Level24(),
    Level25(),
  ];
}

class Stage2 extends Stage {
  Stage2(super.mainMenuReference);

  final stageDifference = 25;

  final List<Level> levels = [
    Level26(),
    Level27(),
  ];
}
