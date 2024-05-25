import 'package:flutter/material.dart';

enum Palette {
  white(Color(0xffFFFFFF)),
  black(Color(0xff080808)),
  transparent(Color(0x00000000)),
  primary(Color(0xff3F8E00)),
  appBar(Color(0xff1B1B1B)),
  bodyText(Color(0xff9C9C9C));

  final Color color;

  const Palette(this.color);
}
