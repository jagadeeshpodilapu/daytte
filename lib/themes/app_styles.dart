import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_styles.dart';

class AppStyles {
  AppStyles._();

  static const _kFontFamily = "Roboto";

  static const TextStyle heading1 =
      TextStyle(fontSize: 30, color: textColor, fontFamily: _kFontFamily);
  static const TextStyle heading2 =
      TextStyle(fontSize: 24, color: textColor, fontFamily: _kFontFamily);
  static const TextStyle heading3 =
      TextStyle(fontSize: 22, color: textColor, fontFamily: _kFontFamily);
  static const TextStyle heading4 =
      TextStyle(fontSize: 20, color: textColor, fontFamily: _kFontFamily);
  static const TextStyle heading5 =
      TextStyle(fontSize: 18, color: textColor, fontFamily: _kFontFamily);
  static const TextStyle title =
      TextStyle(fontSize: 16, color: textColor, fontFamily: _kFontFamily);
  static const TextStyle title2 =
      TextStyle(fontSize: 14, color: textColor, fontFamily: _kFontFamily);
  static const TextStyle title3 =
      TextStyle(fontSize: 12, color: textColor, fontFamily: _kFontFamily);
}
