import 'package:pokerface/gen/assets.gen.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/app/core_widgets/clickable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokerface/presentation/utils/bottom_sheet/modal_bottom_sheet.dart';

final themes = ThemeType.values
    .map(
      (e) => {
        'name': e.name,
        'label': e.label,
        'type': e,
        'is_dark': e.isDark,
      },
    )
    .toList();

class ChangeAppThemeSheet extends ConsumerWidget {
  const ChangeAppThemeSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);
    final currentSelectedTheme = theme.type;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          16.toAutoScaledWidth,
          0,
          16.toAutoScaledWidth,
          0.toAutoScaledHeight,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            32.toAutoScaledHeight.toVerticalSizedBox,
            _buildSheetHeader(theme),
            16.toAutoScaledHeight.toVerticalSizedBox,
            _buildThemes(theme, context, currentSelectedTheme),
          ],
        ),
      ),
    );
  }

  Widget _buildSheetHeader(ThemeState theme) {
    return Text(
      'Change app theme',
      textAlign: TextAlign.center,
      style: theme.themeText.headline4,
    )
        .animate(
          delay: const Duration(
            milliseconds: 200,
          ),
        )
        .fadeIn();
  }

  Widget _buildThemes(ThemeState theme, BuildContext context, ThemeType currentSelectedTheme) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 234 / 333,
          crossAxisSpacing: 24.toAutoScaledWidth,
          mainAxisSpacing: 24.toAutoScaledHeight,
        ),
        controller: ModalScrollController.of(context),
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: 64.toAutoScaledHeight),
        itemBuilder: (context, index) {
          return Clickable(
            onPressed: () async {
              await MyAppX.router.pop(themes[index]['type']);
            },
            child: _buildIcon(theme, index, currentSelectedTheme),
          );
        },
        itemCount: themes.length,
      ),
    );
  }

  Widget _buildIconLabel(ThemeState theme, int index) {
    return Center(
      child: Text(
        themes[index]['label'] as String? ?? '',
        style: theme.themeText.bodyText1?.copyWith(
          color: MyAppX.theme.getThemeColors(themes[index]['type'] as ThemeType? ?? ThemeType.olive)?.onTertiary ??
              Colors.black,
        ),
        textAlign: TextAlign.center,
      )
          .animate(
            delay: Duration(
              milliseconds: 500 + (10 * index),
            ),
          )
          .fadeIn(),
    );
  }

  Widget _buildIcon(
    ThemeState theme,
    int index,
    ThemeType currentSelectedTheme,
  ) {
    final isSelected = ((themes[index]['type'] as ThemeType? ?? ThemeType.olive) == currentSelectedTheme);
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.toAutoScaledWidth),
          border: Border.all(
            color: isSelected ? theme.colors.primary.withOpacity(0.7) : theme.colors.secondaryContainer,
            width: 2.toAutoScaledWidth,
          ),
          color: isSelected ? theme.colors.primary.withOpacity(0.7) : theme.colors.secondaryContainer,
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.toAutoScaledWidth),
              ),
              child: ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      MyAppX.theme.getThemeColors(themes[index]['type'] as ThemeType? ?? ThemeType.olive)?.background ??
                          Colors.orange,
                      MyAppX.theme.getThemeColors(themes[index]['type'] as ThemeType? ?? ThemeType.olive)?.tertiary ??
                          Colors.blue,
                      MyAppX.theme.getThemeColors(themes[index]['type'] as ThemeType? ?? ThemeType.olive)?.secondary ??
                          Colors.green,
                      MyAppX.theme.getThemeColors(themes[index]['type'] as ThemeType? ?? ThemeType.olive)?.primary ??
                          Colors.red,
                    ],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.color,
                child: Image.asset(
                  Assets.images.other.whiteDeck2.path,
                  fit: BoxFit.contain,
                ),
              ),
            )
                .animate(
                  delay: Duration(
                    milliseconds: 300 + (10 * index),
                  ),
                )
                .fadeIn(),
            _buildIconLabel(theme, index)
          ],
        ),
      )
          .animate(
            delay: Duration(
              milliseconds: 400 + (10 * index),
            ),
          )
          .fadeIn(),
    );
  }
}
