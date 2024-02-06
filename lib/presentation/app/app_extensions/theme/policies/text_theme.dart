import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ThemeText {
  factory ThemeText() => _ThemeTextImpl();

  TextStyle? get headline1;
  TextStyle? get headline2;
  TextStyle? get headline3;
  TextStyle? get headline4;
  TextStyle? get headline5;
  TextStyle? get headline6;
  TextStyle? get subtitle1;
  TextStyle? get subtitle2;
  TextStyle? get bodyText1;
  TextStyle? get bodyText2;
  TextStyle? get button;
  TextStyle? get caption;
  TextStyle? get overline;

  TextTheme get textTheme => TextTheme(
        displayLarge: headline1,
        displayMedium: headline2,
        displaySmall: headline3,
        headlineMedium: headline4,
        headlineSmall: headline5,
        titleLarge: headline6,
        titleMedium: subtitle1,
        titleSmall: subtitle2,
        bodyLarge: bodyText1,
        bodyMedium: bodyText2,
        labelLarge: button,
        bodySmall: caption,
        labelSmall: overline,
      );
}

class _ThemeTextImpl implements ThemeText {
  @override
  TextStyle? get headline1 => GoogleFonts.epilogue(
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.4,
      );

  @override
  TextStyle? get headline2 => GoogleFonts.epilogue(
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.4,
      );

  @override
  TextStyle? get headline3 => GoogleFonts.epilogue(
        fontSize: 48,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.4,
      );

  @override
  TextStyle? get headline4 => GoogleFonts.epilogue(
        fontSize: 34,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.4,
      );

  @override
  TextStyle? get headline5 => GoogleFonts.epilogue(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.4,
      );

  @override
  TextStyle? get headline6 => GoogleFonts.epilogue(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.4,
      );

  @override
  TextStyle? get subtitle1 => GoogleFonts.epilogue(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.4,
      );

  @override
  TextStyle? get subtitle2 => GoogleFonts.epilogue(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.4,
      );

  @override
  TextStyle? get bodyText1 => GoogleFonts.epilogue(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.4,
      );

  @override
  TextStyle? get bodyText2 => GoogleFonts.epilogue(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.4,
      );

  @override
  TextStyle? get button => GoogleFonts.epilogue(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.4,
      );

  @override
  TextStyle? get caption => GoogleFonts.epilogue(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.4,
      );

  @override
  TextStyle? get overline => GoogleFonts.epilogue(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.4,
      );

  @override
  TextTheme get textTheme => TextTheme(
        displayLarge: headline1,
        displayMedium: headline2,
        displaySmall: headline3,
        headlineMedium: headline4,
        headlineSmall: headline5,
        titleLarge: headline6,
        titleMedium: subtitle1,
        titleSmall: subtitle2,
        bodyLarge: bodyText1,
        bodyMedium: bodyText2,
        labelLarge: button,
        bodySmall: caption,
        labelSmall: overline,
      );
}
