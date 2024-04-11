import '../main.dart';
import '../level.dart';
import '../text.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';

// for 6 x 6 letters grid
class Grid{

  final List<String> letters;
  final backgroundColors = List.generate(
    36,
    (index) => Level.gray2,
    growable: false,
  );

  List<TextRendering> letterCells = [];

  double x = 0;
  double y = 0;
  double diffX = 0;
  double diffY = 0;

  Grid(double cellWidth, double cellHeight, this.letters) {
    for(var i = 0; i < 36; i++) {
      switch(i) {
        case 6:
          y += diffY; // advance to next row
          x = 0; // to add new cells to start of next row
          break;
        case 12:
          y += diffY;
          x = 0;
          break;
        case 18:
          y += diffY;
          x = 0;
          break;
        case 24:
          y += diffY;
          x = 0;
          break;
        case 30:
          y += diffY;
          x = 0;
          break;
      }

      letterCells.add(
        TextRendering(
          letters[i],
          backgroundColors[i],
          Vector2(
            x,
            y,
          ),
          Vector2(
            cellWidth,
            cellHeight,
          )
        )
      );

      if(i == 0) {
        diffX = letterCells[0].width;
        diffY = letterCells[0].height;
      }

      x += diffX;

    }
  }
}
