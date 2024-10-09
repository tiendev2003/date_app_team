import 'package:date_app_team/core/theme/ui.dart';
import 'package:flutter/material.dart';
 
class ThemeState {
  final ThemeData themeData;

  ThemeState(this.themeData);

  static ThemeState get lightTheme => ThemeState(Themes.defaultTheme);
  static ThemeState get darkTheme => ThemeState(Themes.darkTheme);


}
