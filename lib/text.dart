import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import '../word_find_game.dart';
import '../level.dart';

class TextRendering extends TextBoxComponent with HasGameReference<WordFindGame>{

  TextRendering(String text, this.backgroundColor, Vector2 position, Vector2 size) : super(
    text: text,
    align: Anchor.center,
    position: position,
    size: size,
  );

  // to make change background color dynamically
  Color backgroundColor;

  final TextPaint _redTextStyle = TextPaint(
    style: TextStyle(
      color: Level.red,
    ),
  );

  late final Paint bgPaint;
  late final Paint borderPaint;

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    textRenderer = _redTextStyle;
    bgPaint = Paint()..color = backgroundColor;
    borderPaint = Paint()
      ..color = Level.purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = game.size.x / 200;
  }

  @override
  void render(Canvas canvas) {
    Rect rect = Rect.fromLTWH(0,0, width, height);
    bgPaint.color = backgroundColor;
    canvas.drawRect(rect,bgPaint);
    canvas.drawRect(rect, borderPaint);
    super.render(canvas);
  }
}
