import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'word_find_game.dart';
import 'level.dart';

class TextRendering extends TextBoxComponent with HasGameReference<WordFindGame>{

  TextRendering(
    {
      super.text,
      super.position,
      super.size,
      required this.backgroundColor,
      required this.textColor,
    }
  ) : super(
    align: Anchor.center,
  );

  // to make change background color dynamically
  Color backgroundColor;
  final Color textColor;
  late final Paint bgPaint;
  late final Paint borderPaint;
  late final Rect rect;

  @override
  Future<void> onLoad() async{
    await super.onLoad();

    final TextPaint textStyle = TextPaint(
    style: TextStyle(
        color: textColor,
      ),
    );

    textRenderer = textStyle;
    bgPaint = Paint()..color = backgroundColor;
    borderPaint = Paint()
      ..color = Level.purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = game.size.x / 200;
    rect = Rect.fromLTWH(0,0, width, height);
  }

  @override
  void render(Canvas canvas) {
    bgPaint.color = backgroundColor;
    canvas.drawRect(rect,bgPaint);
    canvas.drawRect(rect, borderPaint);
    super.render(canvas);
  }
}
