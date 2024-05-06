import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
//import 'package:flame/camera.dart';

import 'main_menu.dart';
import 'level.dart';

class WordFindGame extends FlameGame {
  late final mainMenu;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    camera.viewfinder.anchor = Anchor.topLeft;
    mainMenu = MainMenu();
    world.add(mainMenu);
  }

  @override
  Color backgroundColor() {
    return Level.blue;
  }
}
