import 'package:flutter/cupertino.dart';

class AppCustomColors {
  static AppCustomColors? _instance;
  AppCustomColors._();

  static AppCustomColors get i => _instance ??= AppCustomColors._();

  Color get white => const Color(0xffffffff);
  Color get blue1 => const Color(0xff0035da);
  Color get blue2 => const Color(0xff00a5ff);
  Color get grey => const Color(0xfff1f1f1);
  Color get black => const Color(0xff000000);
}

extension AppCustomColorsExtensions on BuildContext {
  AppCustomColors get colors => AppCustomColors.i;
}
