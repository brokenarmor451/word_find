import 'package:flame/events.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../grid.dart';
import '../main_menu.dart';
import '../word_find_game.dart';
import '../solveds.dart';
import '../button.dart';
import '../text.dart';

int selectedLevelIndex = 0;

abstract class Level extends PositionComponent with TapCallbacks, DragCallbacks, HasGameReference<WordFindGame> {

  Level() {
    solveds = Solveds();
  }

  late final Grid grid;
  late final WordList wordlist;
  late final MyLine myline;
  late final MainMenu mainMenu;
  late final MyButton _exitButton;
  late final Solveds solveds;

  final List<String> letters = [];
  final List<int> starts = [];
  final List<int> ends = [];
  final List<List<int>> wordsIndices = [];
  final List<List<double>> wordsStartPlaces = List.generate(
    4,
    (index) => [],
    growable: false,
  );
  final List<List<double>> wordsEndPlaces = List.generate(
    4,
    (index) => [],
    growable: false,
  );
  final List<String> words = [];

  int selectedWord = -1;

  static final Color green = Color(0xFFA8CD9F);
  static final Color gray = Color(0xFFB5C0D0);
  static final Color gray2 = Color(0xFF9CAFAA);
  static final Color darkGreen = Color(0xFF627254);
  static final Color purple = Color(0xFF401F71);
  static final Color darkBlue = Color(0xFF496989);
  static final Color red = Color(0xFFA0153E);
  static final Color darkBlue2 = Color(0xFF5755FE);
  static final Color purple2 = Color(0xFF430A5D);
  static final Color blue = Color(0xFF7AA2E3);

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    size = Vector2(game.size.x, game.size.y / 2);
    grid = Grid(game.size.x / 6, game.size.y / 2 / 6, letters);

    myline = MyLine();

    wordlist = WordList(game.size.y / 2,game.size.x, game.size.y / 3 / 4, words);

    wordlist.completeWordsRenders();

    _makeExitButton(0, game.size.y / 2 + game.size.y / 3, game.size.x, game.size.y / 6);

    addAll(grid.letterCells);

    add(myline);

    addAll(wordlist.wordsRenders);

    add(_exitButton);
  }

  @override
  void onMount() {
    super.onMount();
    assignPositions();
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    final eventpos = event.canvasPosition;
    myline.xy2 = Offset(eventpos.x, eventpos.y);
  }

  @override
  void onTapDown(TapDownEvent event) {
    final eventpos = event.canvasPosition;
    myline.xy1 = Offset(eventpos.x, eventpos.y);
    myline.xy2 = Offset(eventpos.x, eventpos.y);
    checkIfApointInsideAnyStartTextRendering(eventpos.x, eventpos.y);
  }

  @override
  void onTapUp(TapUpEvent event) {
    myline.dissappearLine();
  }

  @override
  void onDragEnd(DragEndEvent event) {
    checkIfApointInsideAnyEndTextRendering(
      myline.xy2.dx,
      myline.xy2.dy
    );
    myline.dissappearLine();
  }

  void _makeExitButton(
    double buttonX,
    double buttonY,
    double buttonWidth,
    double buttonHeight,
  ) {
    _exitButton = MyButton(
      "EXIT",
      darkBlue,
      Vector2(buttonX, buttonY),
      Vector2(buttonWidth, buttonHeight),
      () {
        game.remove(this);
        game.add(MainMenu());
      }
    );
  }

  // get x y x2 y2 of letter boxes
  // which will be checked.
  void assignPositions() {
    for(int i = 0; i < 4; i++) {
      final TextRendering letterboxStart = grid.letterCells[starts[i]];
      wordsStartPlaces[i] = [
        letterboxStart.position.x,
        letterboxStart.position.y,
        letterboxStart.position.x + letterboxStart.width,
        letterboxStart.position.y + letterboxStart.height,
      ];

      final TextRendering letterboxEnd = grid.letterCells[ends[i]];
      wordsEndPlaces[i] = [
        letterboxEnd.position.x,
        letterboxEnd.position.y,
        letterboxEnd.position.x + letterboxEnd.width,
        letterboxEnd.position.y + letterboxEnd.height,
      ];
    }
  }

  void checkIfApointInsideAnyStartTextRendering(double posX, double posY) {
    wordsStartPlaces.asMap().forEach(
      (index, place) {
        // if word start selected set index and return
        if(isPointInsideRec(posX, posY, place[0], place[1], place[2], place[3])) {
          selectedWord = index;
          return;
        }
      }
    );
  }

  void checkIfApointInsideAnyEndTextRendering(double posX, double posY) {
    if(selectedWord != -1 && grid.letterCells[wordsIndices[selectedWord][0]].backgroundColor == gray2) {
      final List<double> endplaces = wordsEndPlaces[selectedWord];
      // word found make its background color green
      if(isPointInsideRec(posX, posY, endplaces[0], endplaces[1], endplaces[2], endplaces[3])) {
        tryCompleteLevel();
      } else {
        selectedWord = -1;
      }
    }
  }

  void changeWordBackgroundToGreen() {
    for(int index in wordsIndices[selectedWord]) {
      grid.letterCells[index].backgroundColor = darkGreen;
    }

    wordlist.wordsRenders[selectedWord].backgroundColor = darkGreen;
  }

  // check found words and make things green
  void tryCompleteLevel() async {
    changeWordBackgroundToGreen();
    for(TextRendering wordRender in wordlist.wordsRenders) {
      // if one of words is not found return
      if(wordRender.backgroundColor == gray2) {
        return;
      }
    }
    await solveds.updateSolveds(selectedLevelIndex);
  }

  bool isPointInsideRec(
    double posX,
    double posY,
    double x1,
    double y1,
    double x2,
    double y2,
  ) {
    if((posX > x1 && posX < x2) && (posY > y1 && posY < y2)) {
      return true;
    } else {
      return false;
    }
  }
}

class MyLine extends PositionComponent with HasGameReference<WordFindGame>{
  late final Paint _paint;

  var xy1 = Offset(-100,-100);
  var xy2 = Offset(-100,-100);

  @override
  Future<void> onLoad() async {
    _paint = Paint()
    ..color = Colors.white
    ..strokeWidth = game.size.x / 40
    ..strokeCap = StrokeCap.round;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawLine(xy1, xy2, _paint);
  }

  void dissappearLine() {
    xy1 = Offset(-100, -100);
    xy2 = Offset(-100, -100);
  }
}

class WordList {
  WordList(this.y, this.wordWidth, this.wordHeight, this.words);

  final double wordHeight;
  final double wordWidth;

  final List<String> words;

  final List<TextRendering> wordsRenders = [];

  double x = 0;

  double y = 0;

  void completeWordsRenders() {
    for(int i = 0; i < 4; i++) {
      wordsRenders.add(
        TextRendering(
          words[i],
          Level.gray2,
          Vector2(x,y),
          Vector2(wordWidth, wordHeight),
        )
      );
      y += wordHeight;
    }
  }
}
