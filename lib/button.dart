import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'text.dart';

class MyButton extends TextRendering with TapCallbacks {
  MyButton(
    {
      super.text,
      super.position,
      super.size,
      required super.textColor,
      required super.backgroundColor,
      required this.runFunction,
    }
  );

  final Function runFunction;

  @override
  void onTapUp(TapUpEvent event) {
    runFunction();
  }
}
