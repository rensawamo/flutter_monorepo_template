import 'package:core_foundation/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:melos_template/core/designsystem/color/color_type.dart';

class ColorSet {
  static Color exampleColor(BuildContext context) {
    return context.isDark ? ColorType.color1 : ColorType.color2;
  }
}
