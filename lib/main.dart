import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';

import 'word_find_game.dart';

void main() {
  runApp(
    SafeArea(
      child: GameWidget(
        game: WordFindGame(),
      ),
    ),
  );
}
