import 'package:flutter/material.dart';
import 'package:flame/components.dart';

import 'levels.dart';
import 'word_find_game.dart';
import 'solveds.dart';
import 'button.dart';
import 'level.dart';
import 'about_screen.dart';
import 'stages.dart';

int _selectedStage = 0;

class MainMenu extends PositionComponent with HasGameReference<WordFindGame>{

  // will be updated as new stages added
  final int _lastStage = 1;

  late final List<Stage> stages = [
    Stage1(this),
    Stage2(this),
  ];

  late final MyButton _aboutButton;
  late final MyButton _previousStageButton;
  late final MyButton _nextStageButton;


  double x = 0;
  double y = 0;
  double diffX = 0;
  double diffY = 0;

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    _makeAboutButton();
    _makeNextPreviousStageButtons();
    addAll(
      [
        stages[_selectedStage],
        _previousStageButton,
        _nextStageButton,
        _aboutButton,
      ]
    );
  }

  void _makeAboutButton() {
    _aboutButton = MyButton(
      text: "ABOUT",
      position: Vector2(
        0,
        game.size.y / 2 + game.size.y / 2 / 5,
      ),

      size: Vector2(
        game.size.x,
        game.size.y / 2 / 5,
      ),
      backgroundColor: Level.gray,
      textColor: Level.yellow,
      runFunction: () {
        game.world.remove(this);
        game.world.add(AboutScreen());
      },
    );
  }

  void _makeNextPreviousStageButtons() {
    _previousStageButton = MyButton(
      text: "⇐",
      position: Vector2(
        0,
        game.size.y / 2,
      ),
      size: Vector2(
        game.size.x / 4,
        game.size.y / 2 / 5,
      ),
      backgroundColor: (_selectedStage == 0 ) ? Level.gray3 : Level.darkBlue3,
      textColor: Level.yellow,
      runFunction: () {

        // switch to previous stage if current stage is not 0
        if(_selectedStage != 0) {

          if(_nextStageButton.backgroundColor != Level.darkBlue3) {
            // indicate next stage button clickable
            _nextStageButton.backgroundColor = Level.darkBlue3;
          }
          // add level buttons of previous stage
          remove(stages[_selectedStage]);
          _selectedStage--;
          add(stages[_selectedStage]);

          if (_selectedStage == 0) {
            _previousStageButton.backgroundColor = Level.gray3;
          }
        }
      }
    );

    _nextStageButton = MyButton(
      text: "⇒",
      position: Vector2(
        game.size.x - game.size.x / 4,
        game.size.y / 2,
      ),
      size: Vector2(
        game.size.x / 4,
        game.size.y / 2 / 5,
      ),
      backgroundColor: (_selectedStage == _lastStage) ? Level.gray3 : Level.darkBlue3,
      textColor: Level.yellow,
      runFunction: () {

        // switch to next stage if current stage is not last stage
        if(_selectedStage != _lastStage) {
          if(_previousStageButton.backgroundColor != Level.darkBlue3) {
            // indicate previous stage button clickable
            _previousStageButton.backgroundColor = Level.darkBlue3;
          }
          // remove previous stage levels and add level buttons of next stage
          remove(stages[_selectedStage]);
          _selectedStage++;
          add(stages[_selectedStage]);

          if(_selectedStage == _lastStage) {
            _nextStageButton.backgroundColor = Level.gray3;
          }

        }
      }
    );
  }
}
