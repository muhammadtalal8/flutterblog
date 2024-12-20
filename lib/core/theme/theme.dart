import 'package:flutter/material.dart';
import 'package:flutter_blog/core/theme/app_pallete.dart';

class AppTheme {
  static final _border=  OutlineInputBorder(
        borderSide: BorderSide(
          color: AppPallete.borderColor,
          width: 3,
        ),
borderRadius: BorderRadius.circular(10),
  );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(27),
      enabledBorder: _border,
      focusedBorder: _border
      
    )
  );
}
