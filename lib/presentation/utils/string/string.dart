import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';

extension StringExtension on String {
  String capitalize() {
    if (length > 1) return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
    return toUpperCase();
  }

  // TODO(codenameakshay): this has been removed due to it breaking on emoji and hindi , kannad names

  String get useCorrectEllipsis {
    final str = this;

    late String correctedStr;

    if (str.isNotEmpty) {
      /// \u200B means Zero width space characters, it's a special space you can't see but would act as normal space
      correctedStr = str.replaceAll('', '\u200B');
    } else {
      correctedStr = str;
    }

    return correctedStr;
  }

  ThemeType get toThemeType {
    switch (this) {
      case 'dark':
        return ThemeType.dark;
      case 'darkRed':
        return ThemeType.darkRed;
      case 'darkYellow':
        return ThemeType.darkYellow;
      case 'darkPurple':
        return ThemeType.darkPurple;
      case 'darkBlue':
        return ThemeType.darkBlue;
      case 'darkAmoled':
        return ThemeType.darkAmoled;
      case 'darkMaterial':
        return ThemeType.darkMaterial;
      case 'redTornado':
        return ThemeType.redTornado;
      case 'olive':
        return ThemeType.olive;
      case 'lightPurple':
        return ThemeType.lightPurple;
      case 'lightTeal':
        return ThemeType.lightTeal;
      case 'lightRed':
        return ThemeType.lightRed;
      case 'lightYellow':
        return ThemeType.lightYellow;
      case 'lightMaterial':
        return ThemeType.lightMaterial;
      case 'light':
        return ThemeType.light;
      case 'darkGreen':
        return ThemeType.darkGreen;
      case 'lightGreen':
        return ThemeType.lightGreen;
      case 'systemTheme':
        return ThemeType.systemTheme;
      default:
        return ThemeType.light;
    }
  }
}
