import 'package:material_ui/material_ui.dart';

import '../color/colors_app.dart';

class BrightTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorSchemeSeed: ColorsApp.primary,
      scaffoldBackgroundColor: ColorsApp.backgroundColor,
      brightness: Brightness.light,
      // fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
      appBarTheme: _appBarTheme,
      useMaterial3: true,
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      backgroundColor: ColorsApp.primary.withAlpha(200),
      foregroundColor: ColorsApp.white,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: ColorsApp.white,
      ),
      centerTitle: true,
    );
  }
}
