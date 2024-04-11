import '../text.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MyButton extends TextRendering with TapCallbacks {
  MyButton(
    String text,
    Color backgroundColor ,
    Vector2 position,
    Vector2 size,
    this.runFunction,
  ): super(text, backgroundColor, position, size);

  final Function runFunction;

  @override
  void onTapUp(TapUpEvent event) {
    runFunction();
  }
}
