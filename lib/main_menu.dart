import '../levels.dart';
import '../word_find_game.dart';
import '../solveds.dart';
import '../button.dart';
import '../level.dart';
import '../about_screen.dart';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';

class MainMenu extends PositionComponent with HasGameReference<WordFindGame>{
  MainMenu() {
    solveds = Solveds();
  }


  late final Solveds solveds;

  late final double levelButtonWidth;
  late final double levelButtonHeight;

  final List<MyButton> levelButtons = [];
  late final List<Color> buttonsColors;
  late final MyButton _aboutButton;

  double x = 0;
  double y = 0;
  double diffX = 0;
  double diffY = 0;

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    levelButtonWidth = game.size.x / 5;
    levelButtonHeight = game.size.y / 2 / 5;

    await _makeLevelButtons();
    _makeAboutButton();

    addAll(levelButtons);
    add(_aboutButton);
  }

  void _makeAboutButton() {
    _aboutButton = MyButton(
      "ABOUT",
      Level.gray,
      Vector2(
        0,
        game.size.y / 2,
      ),

      Vector2(
        game.size.x,
        game.size.y / 2 / 5,
      ),

      () {
        game.remove(this);
        game.add(AboutScreen());
      },
    );
  }

  void _enterToLevelIfItIsOpen(int index, Level level) {
    if(solveds.solvedsAsString[index] == 'O' || solveds.solvedsAsString[index] == 'Y') {
      selectedLevelIndex = index;
      game.remove(this);
      game.add(level);
    }
  }

  Future<void> _makeLevelButtons() async {
    await solveds.makeSolveds();

    buttonsColors = List.generate(
      25,
      (index) {
        switch(solveds.solvedsAsString[index]) {
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

    for(int i = 0; i < 25; i++) {
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
          (i + 1).toString(),
          buttonsColors[i],
          Vector2(x, y),
          Vector2(
            levelButtonWidth,
            levelButtonHeight,
          ),
          () {
            switch(i) {
              case 0:
                _enterToLevelIfItIsOpen(i, Level1());
              case 1:
                _enterToLevelIfItIsOpen(i, Level2());
              case 2:
                _enterToLevelIfItIsOpen(i, Level3());
              case 3:
                _enterToLevelIfItIsOpen(i, Level4());
              case 4:
                _enterToLevelIfItIsOpen(i, Level5());
              case 5:
                _enterToLevelIfItIsOpen(i, Level6());
              case 6:
                _enterToLevelIfItIsOpen(i, Level7());
              case 7:
                _enterToLevelIfItIsOpen(i, Level8());
              case 8:
                _enterToLevelIfItIsOpen(i, Level9());
              case 9:
                _enterToLevelIfItIsOpen(i, Level10());
              case 10:
                _enterToLevelIfItIsOpen(i, Level11());
              case 11:
                _enterToLevelIfItIsOpen(i, Level12());
              case 12:
                _enterToLevelIfItIsOpen(i, Level13());
              case 13:
                _enterToLevelIfItIsOpen(i, Level14());
              case 14:
                _enterToLevelIfItIsOpen(i, Level15());
              case 15:
                _enterToLevelIfItIsOpen(i, Level16());
              case 16:
                _enterToLevelIfItIsOpen(i, Level17());
              case 17:
                _enterToLevelIfItIsOpen(i, Level18());
              case 18:
                _enterToLevelIfItIsOpen(i, Level19());
              case 19:
                _enterToLevelIfItIsOpen(i, Level20());
              case 20:
                _enterToLevelIfItIsOpen(i, Level21());
              case 21:
                _enterToLevelIfItIsOpen(i, Level22());
              case 22:
                _enterToLevelIfItIsOpen(i, Level23());
              case 23:
                _enterToLevelIfItIsOpen(i, Level24());
              case 24:
                _enterToLevelIfItIsOpen(i, Level25());
            }
          },
        )
      );

      x += levelButtonWidth;

    }
  }
}
