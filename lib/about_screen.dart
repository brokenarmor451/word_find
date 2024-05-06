import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'word_find_game.dart';
import 'button.dart';
import 'level.dart';
import 'main_menu.dart';
import 'text.dart';

class AboutScreen extends PositionComponent with HasGameReference<WordFindGame>{
  late final MyButton _licensesButton;
  late final MyButton _backButton;
  late final TextRendering _version;

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    _makeLicensesButton();
    _makeBackButton();
    _makeVersion();

    add(_backButton);
    add(_version);
    add(_licensesButton);
  }

  void _makeLicensesButton() {
    _licensesButton = MyButton(
      text: "LICENSES",
      position: Vector2(
        0,
        game.size.y / 2,
      ),
      size: Vector2(
        game.size.x,
        game.size.y / 5,
      ),
      backgroundColor: Level.gray,
      textColor: Level.yellow,
      runFunction: () {
        game.world.remove(this);
        game.world.add(Licenses());

      },
    );
  }

  void _makeBackButton() {
    _backButton = MyButton(
      text: "BACK",
      position: Vector2(
        0,
        game.size.y - game.size.y / 8,
      ),

      size: Vector2(
        game.size.x / 2,
        game.size.y / 8,
      ),
      backgroundColor: Level.gray,
      textColor: Level.yellow,
      runFunction: () {
        game.world.remove(this);
        game.world.add(MainMenu());
      }
    );
  }

  void _makeVersion() {
    _version = TextRendering(
      text: "VERSION\n" + _versionNumber,
      position: Vector2(
        game.size.x - game.size.x / 5,
        game.size.y - game.size.y / 5,
      ),
      size: Vector2(
        game.size.x / 5,
        game.size.y / 5,
      ),
      backgroundColor: Level.gray,
      textColor: Level.purple3,
    );
  }

  final String _versionNumber = "0.0.1";
}

class Licenses extends PositionComponent with HasGameReference<WordFindGame>{
  int selectedItem = -1;

  late final MyButton _license1;
  late final MyButton _license2;
  late final MyButton _license3;

  late final MyButton _backButton;

  @override
  Future<void> onLoad() async {
    _makeLicensesButtons();
    _makeBackButton();
    add(_license1);
    add(_license2);
    add(_license3);
    add(_backButton);
  }

  void _makeLicensesButtons() {
    _license1 = MyButton(
      text: 'Dart BSD 3-Clause "New" or "Revised" License',
      position: Vector2(
        0,
        0,
      ),

      size: Vector2(
        game.size.x,
        game.size.y / 5,
      ),
      backgroundColor: Level.gray,
      textColor: Level.yellow,
      runFunction:() {
        game.world.remove(this);
        game.world.add(LicenseTextShowingScreen(_licenseText1));
      }
    );

    _license2 = MyButton(
      text: 'Flutter BSD-3-Clause license',
      position: Vector2(
        0,
        game.size.y / 5,
      ),
      size: Vector2(
        game.size.x,
        game.size.y / 5,
      ),
      backgroundColor: Level.gray,
      textColor: Level.yellow,
      runFunction: () {
        game.world.remove(this);
        game.world.add(LicenseTextShowingScreen(_licenseText2));
      }
    );

    _license3 = MyButton(
      text: 'Flame MIT License',
      position: Vector2(
        0,
        game.size.y / 5 * 2,
      ),

      size: Vector2(
        game.size.x,
        game.size.y / 5,
      ),
      backgroundColor: Level.gray,
      textColor: Level.yellow,
      runFunction:() {
        game.world.remove(this);
        game.world.add(LicenseTextShowingScreen(_licenseText3));
      }
    );
  }

  void _makeBackButton() {
    _backButton = MyButton(
      text: "BACK",
      position: Vector2(
        0,
        game.size.y - game.size.y / 8,
      ),

      size: Vector2(
        game.size.x / 2,
        game.size.y / 8,
      ),
      backgroundColor: Level.gray,
      textColor: Level.yellow,
      runFunction:() {
        game.world.remove(this);
        game.world.add(AboutScreen());
      }
    );
  }

  String _licenseText1 = """Copyright 2012, the Dart project authors.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of Google LLC nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.""";

  String _licenseText2 = """Copyright 2014 The Flutter Authors. All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of Google Inc. nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.""";

  String _licenseText3 = """MIT License

Copyright (c) 2021 Blue Fire

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.""";
}

class LicenseTextShowingScreen extends PositionComponent with HasGameReference<WordFindGame>{
  LicenseTextShowingScreen(this.licenseToShow);

  late final MyScrollableText _licenseTextRendering;

  final String licenseToShow;
  late final _backButton;
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    _makeBackButton();
    _makeLicenseTextRendering();

    add(_licenseTextRendering);
    add(_backButton);

  }

  void _makeBackButton() {
    _backButton = MyButton(
      text: "BACK",
      position: Vector2(
        0,
        game.size.y - game.size.y / 8,
      ),

      size:Vector2(
        game.size.x / 2,
        game.size.y / 8,
      ),
      backgroundColor: Level.gray,
      textColor: Level.yellow,
      runFunction: (){
        game.world.remove(this);
        game.world.add(Licenses());
      }
    );
  }

  void _makeLicenseTextRendering() {
    _licenseTextRendering = MyScrollableText(
      Vector2(
        game.size.x,
        game.size.y / 1.5,
      ),
      licenseToShow,
    );
  }
}

class MyScrollableText extends ScrollTextBoxComponent {
  MyScrollableText(Vector2 frameSize, String text) : super(
    size: frameSize,
    text: text,
    textRenderer: TextPaint(
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      )
    )
  );

  late final Paint _boxPaint;
  late final Rect _boxRect;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    _boxPaint = Paint()
      ..color = Level.darkBlue2;
    _boxRect = Rect.fromLTWH(0,0, width, height);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(_boxRect, _boxPaint);
  }
}
