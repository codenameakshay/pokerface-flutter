import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/app/core_widgets/cta_clickable.dart';

class UrlBuilder extends ConsumerWidget {
  const UrlBuilder(this.placeholderText, {super.key, required this.url});

  final String url;
  final String? placeholderText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(MyAppX.theme.current);
    return CtaClickable(
      onPressed: () => MyAppX.url.launchURL(url),
      child: Column(
        children: [
          Transform.translate(
            offset: Offset(0, 1.toAutoScaledHeight),
            child: Text(
              placeholderText ?? url,
              style: currentTheme.themeText.caption?.copyWith(
                shadows: [
                  Shadow(
                    color: currentTheme.colors.onBackground,
                    offset: Offset(0, -1.toAutoScaledHeight),
                  ),
                ],
                fontSize: currentTheme.fontSizes.s12,
                color: Colors.transparent,
                height: currentTheme.fontLineHeights.lh16 / currentTheme.fontSizes.s12,
                decoration: TextDecoration.underline,
                decorationColor: currentTheme.colors.onBackground,
                decorationThickness: 1.toAutoScaledHeight,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
