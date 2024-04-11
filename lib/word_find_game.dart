import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import '../main_menu.dart';
import '../level.dart';

class WordFindGame extends FlameGame {
  late final mainMenu;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    mainMenu = MainMenu();
    add(mainMenu);
  }

  @override
  Color backgroundColor() {
    return Level.blue;
  }
}
