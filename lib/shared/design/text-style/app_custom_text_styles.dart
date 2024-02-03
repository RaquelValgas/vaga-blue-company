import 'package:flutter/cupertino.dart';

class TextStyles {
  static TextStyles? _instance;
  TextStyles._();

  static TextStyles get i => _instance ??= TextStyles._();

  TextStyle get textBold => const TextStyle(fontWeight: FontWeight.bold);
  TextStyle get textRegular => const TextStyle(fontWeight: FontWeight.normal);
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
