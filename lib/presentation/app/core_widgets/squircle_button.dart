import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/app/core_widgets/clickable.dart';
import 'package:pokerface/presentation/app/core_widgets/cta_clickable.dart';
import 'package:pokerface/presentation/app/core_widgets/squircle_border.dart';

class SquircleButton extends ConsumerWidget {
  const SquircleButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
    this.loading,
  });
  final String text;
  final VoidCallback? onPressed;
  final bool enabled;
  final int? loading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);
    return Clickable(
      onPressed: onPressed,
      enabled: enabled,
      child: Material(
        shape: SquircleBorder(
          radius: BorderRadius.circular(
            30.toAutoScaledWidth,
          ),
        ),
        color: theme.colors.primary,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 12.toAutoScaledHeight),
          child: loading == null
              ? Text(
                  text,
                  style: theme.themeText.bodyText2?.copyWith(
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: theme.fontSizes.s18,
                    color: theme.colors.onPrimary,
                  ),
                  textAlign: TextAlign.center,
                )
              : Center(
                  child: SizedBox(
                    height: 22.toAutoScaledHeight,
                    width: 22.toAutoScaledHeight,
                    child: CircularProgressIndicator(
                      value: loading! / 100,
                      color: theme.colors.onPrimary,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class RoundedButton extends ConsumerWidget {
  const RoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
    this.loading,
  });
  final String text;
  final VoidCallback? onPressed;
  final bool enabled;
  final int? loading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);
    return CtaClickable(
      onPressed: onPressed,
      enabled: enabled,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            500.toAutoScaledWidth,
          ),
        ),
        color: theme.colors.primary,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 12.toAutoScaledHeight),
          child: loading == null
              ? Text(
                  text,
                  style: theme.themeText.bodyText2?.copyWith(
                    fontFamily: GoogleFonts.epilogue().fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: theme.fontSizes.s18,
                    color: theme.colors.onPrimary,
                  ),
                  textAlign: TextAlign.center,
                )
              : Center(
                  child: SizedBox(
                    height: 22.toAutoScaledHeight,
                    width: 22.toAutoScaledHeight,
                    child: CircularProgressIndicator(
                      value: loading! / 100,
                      color: theme.colors.onPrimary,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

enum ButtonType {
  primary,
  secondary,
  tertiary,
  warning,
  error,
}

class SquareButton extends ConsumerWidget {
  const SquareButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.enabled = true,
    this.loading,
  });
  final String text;
  final VoidCallback? onPressed;
  final bool enabled;
  final int? loading;
  final ButtonType type;

  Color mainColor(ThemeState theme) {
    switch (type) {
      case ButtonType.primary:
        return theme.colors.primary;
      case ButtonType.secondary:
        return theme.colors.secondary;
      case ButtonType.tertiary:
        return theme.colors.tertiary;
      case ButtonType.warning:
        return theme.colors.warning;
      case ButtonType.error:
        return theme.colors.error;
    }
  }

  Color mainContainerColor(ThemeState theme) {
    switch (type) {
      case ButtonType.primary:
        return theme.colors.primaryContainer;
      case ButtonType.secondary:
        return theme.colors.secondaryContainer;
      case ButtonType.tertiary:
        return theme.colors.tertiaryContainer;
      case ButtonType.warning:
        return theme.colors.warning;
      case ButtonType.error:
        return theme.colors.errorContainer;
    }
  }

  Color textColor(ThemeState theme) {
    switch (type) {
      case ButtonType.primary:
        return theme.colors.onPrimary;
      case ButtonType.secondary:
        return theme.colors.onSecondary;
      case ButtonType.tertiary:
        return theme.colors.onTertiary;
      case ButtonType.warning:
        return theme.colors.onWarning;
      case ButtonType.error:
        return theme.colors.onError;
    }
  }

  Color textContainerColor(ThemeState theme) {
    switch (type) {
      case ButtonType.primary:
        return theme.colors.onPrimaryContainer;
      case ButtonType.secondary:
        return theme.colors.onSecondaryContainer;
      case ButtonType.tertiary:
        return theme.colors.onTertiaryContainer;
      case ButtonType.warning:
        return theme.colors.onWarning;
      case ButtonType.error:
        return theme.colors.onErrorContainer;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.toAutoScaledWidth, vertical: 12.toAutoScaledHeight),
      child: CtaClickable(
        onPressed: onPressed,
        enabled: enabled,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: textColor(theme),
                width: 2,
              ),
              color: mainColor(theme),
              boxShadow: [
                BoxShadow(
                  color: mainContainerColor(theme),
                  offset: const Offset(4, 4),
                ),
              ]),
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 12.toAutoScaledHeight),
          child: loading == null
              ? Text(
                  text,
                  style: theme.themeText.bodyText2?.copyWith(
                    fontFamily: GoogleFonts.epilogue().fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: theme.fontSizes.s18,
                    color: textColor(theme),
                  ),
                  textAlign: TextAlign.center,
                )
              : Center(
                  child: SizedBox(
                    height: 22.toAutoScaledHeight,
                    width: 22.toAutoScaledHeight,
                    child: CircularProgressIndicator(
                      value: loading! / 100,
                      color: textColor(theme),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
