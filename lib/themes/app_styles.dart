import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_styles.dart';

class AppStyles {
  AppStyles._();

  static const _kFontFamily = "Roboto";

  static TextStyle heading1 =
      TextStyle(fontSize: 30, color: textColor, fontFamily: _kFontFamily);
  static TextStyle heading2 =
      TextStyle(fontSize: 24, color: textColor, fontFamily: _kFontFamily);
  static TextStyle heading3 =
      TextStyle(fontSize: 22, color: textColor, fontFamily: _kFontFamily);
  static TextStyle heading4 =
      TextStyle(fontSize: 20, color: textColor, fontFamily: _kFontFamily);
  static TextStyle title =
      TextStyle(fontSize: 16, color: textColor, fontFamily: _kFontFamily);
  static TextStyle title2 =
      TextStyle(fontSize: 14, color: textColor, fontFamily: _kFontFamily);
  static TextStyle title3 =
      TextStyle(fontSize: 12, color: textColor, fontFamily: _kFontFamily);
}
