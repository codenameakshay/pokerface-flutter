import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokerface/gen/assets.gen.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/app/core_widgets/clickable.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSheet extends ConsumerWidget {
  const AboutSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);
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
            // App Icon
            _buildAppIcon(),
            8.toAutoScaledHeight.toVerticalSizedBox,
            // App Name
            _buildAppNameAndVersion(theme),
            // App Description
            _buildDescription(theme),
            // Divider
            _buildDivider(),
            // About Section
            8.toAutoScaledHeight.toVerticalSizedBox,
            _buildAboutText(
              theme,
              heading: 'New game',
              body:
                  'You can start a new game by clicking on the "New Game" button. Select your hand, the number of players, and the number of house cards to start the game.',
            ),
            8.toAutoScaledHeight.toVerticalSizedBox,
            _buildAboutText(
              theme,
              heading: 'Integrated with Gemini',
              body:
                  'This app is integrated with Gemini, a powerful AI that can help you calculate winning moves, and also help you understand the strength of your hand. Use bolt button to chat with Gemini.',
            ),
            // Made By Section
            16.toAutoScaledHeight.toVerticalSizedBox,
            _buildMadeByText(theme),
            16.toAutoScaledHeight.toVerticalSizedBox,
            // Made By Icons
            _buildMadeByIcons(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider()
        .animate(
          delay: const Duration(
            milliseconds: 350,
          ),
        )
        .fadeIn();
  }

  Widget _buildMadeByIcons(ThemeState theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Codenameakshay Icon
        Column(
          children: [
            // Team Icon
            _buildCodenameAKIcon(),
            8.toAutoScaledHeight.toVerticalSizedBox,
            // Team Name
            _buildCodenameAKText(theme),
          ],
        ),
        _buildXIcon(theme),
        // Hash Studios Icon
        Column(
          children: [
            // Team Icon
            _buildHashStudiosIcon(theme),
            8.toAutoScaledHeight.toVerticalSizedBox,
            // Team Name
            _buildHashStudiosText(theme),
          ],
        ),
      ],
    );
  }

  Widget _buildXIcon(ThemeState theme) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.toAutoScaledHeight),
      child: Text(
        'X',
        style: theme.themeText.bodyText2?.copyWith(
          fontFamily: GoogleFonts.inter().fontFamily,
          fontWeight: FontWeight.w600,
          fontSize: theme.fontSizes.s12,
          color: theme.colors.onBackground,
        ),
        textAlign: TextAlign.center,
      )
          .animate(
            delay: const Duration(
              milliseconds: 600,
            ),
          )
          .fadeIn(),
    );
  }

  Widget _buildAboutText(
    ThemeState theme, {
    required String heading,
    required String body,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.toAutoScaledWidth, vertical: 8.toAutoScaledHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            textAlign: TextAlign.center,
            style: theme.themeText.bodyText2?.copyWith(
              fontFamily: GoogleFonts.inter().fontFamily,
              fontWeight: FontWeight.w700,
              fontSize: theme.fontSizes.s12,
              color: theme.colors.onBackground,
            ),
          ),
          Text(
            body,
            textAlign: TextAlign.left,
            style: theme.themeText.bodyText2?.copyWith(
              fontFamily: GoogleFonts.inter().fontFamily,
              fontWeight: FontWeight.w400,
              fontSize: theme.fontSizes.s9,
              color: theme.colors.onBackground.withOpacity(0.8),
            ),
          )
        ],
      ),
    )
        .animate(
          delay: const Duration(
            milliseconds: 300,
          ),
        )
        .fadeIn();
  }

  Widget _buildCodenameAKText(ThemeState theme) {
    return Text(
      '@codenameakshay',
      style: theme.themeText.bodyText2?.copyWith(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: theme.fontSizes.s12,
        color: theme.colors.onBackground,
      ),
      textAlign: TextAlign.center,
    )
        .animate(
          delay: const Duration(
            milliseconds: 650,
          ),
        )
        .fadeIn();
  }

  Widget _buildCodenameAKIcon() {
    return Stack(
      children: [
        Opacity(
          opacity: 0.5,
          child: Image.asset(
            Assets.images.codenameakshay.path,
            width: 32.toAutoScaledWidth,
            height: 32.toAutoScaledWidth,
          )
              .animate()
              .then(
                delay: const Duration(
                  milliseconds: 1000,
                ),
              )
              .fadeIn()
              .blur(
                end: const Offset(14, 14),
              ),
        ),
        Clickable(
          onPressed: () => launchUrl(
            Uri.parse('https://twitter.com/codenameakshay'),
            mode: LaunchMode.externalNonBrowserApplication,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.toAutoScaledWidth),
            child: Image.asset(
              Assets.images.codenameakshay.path,
              width: 32.toAutoScaledWidth,
              height: 32.toAutoScaledWidth,
              fit: BoxFit.cover,
            )
                .animate(
                  delay: const Duration(
                    milliseconds: 600,
                  ),
                )
                .fadeIn()
                .animate(
                  onPlay: (controller) => controller.repeat(),
                )
                .then(
                  delay: const Duration(
                    milliseconds: 200,
                  ),
                )
                .shimmer(
                  duration: const Duration(seconds: 1),
                  color: Colors.white30,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildHashStudiosText(ThemeState theme) {
    return Text(
      'Hash Studios',
      style: theme.themeText.bodyText2?.copyWith(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: theme.fontSizes.s12,
        color: theme.colors.onBackground,
      ),
      textAlign: TextAlign.center,
    )
        .animate(
          delay: const Duration(
            milliseconds: 550,
          ),
        )
        .fadeIn();
  }

  Widget _buildHashStudiosIcon(ThemeState theme) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.5,
          child: Image.asset(
            Assets.images.hashStudios.path,
            width: 32.toAutoScaledWidth,
            height: 32.toAutoScaledWidth,
          )
              .animate()
              .then(
                delay: const Duration(
                  milliseconds: 900,
                ),
              )
              .fadeIn()
              .blur(
                end: const Offset(14, 14),
              ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: theme.colors.onBackground.withOpacity(0.1),
                blurRadius: 10.toAutoScaledWidth,
                spreadRadius: -4.toAutoScaledWidth,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Clickable(
            onPressed: () => launchUrl(
              Uri.parse('https://twitter.com/HashStudiosIN'),
              mode: LaunchMode.externalNonBrowserApplication,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.toAutoScaledWidth),
              child: Image.asset(
                Assets.images.hashStudios.path,
                width: 31.toAutoScaledWidth,
                height: 31.toAutoScaledWidth,
                fit: BoxFit.cover,
              )
                  .animate(
                    delay: const Duration(
                      milliseconds: 500,
                    ),
                  )
                  .fadeIn()
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .then(
                    delay: const Duration(
                      milliseconds: 200,
                    ),
                  )
                  .shimmer(
                    duration: const Duration(seconds: 1),
                    color: Colors.white30,
                  ),
            ),
          ),
        )
            .animate(
              delay: const Duration(
                milliseconds: 500,
              ),
            )
            .fadeIn(),
      ],
    );
  }

  Widget _buildMadeByText(ThemeState theme) {
    return Text(
      'Made by',
      style: theme.themeText.bodyText2?.copyWith(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: theme.fontSizes.s12,
        color: theme.colors.onBackground,
      ),
      textAlign: TextAlign.center,
    )
        .animate(
          delay: const Duration(
            milliseconds: 400,
          ),
        )
        .fadeIn();
  }

  Widget _buildDescription(ThemeState theme) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.toAutoScaledWidth, vertical: 16.toAutoScaledHeight),
      child: Text(
        'Assistant for playing poker. It helps to calculate the probability of winning, the probability of getting a certain combination, and also helps to understand the strength of the hand.',
        textAlign: TextAlign.center,
        style: theme.themeText.bodyText2?.copyWith(
          fontFamily: GoogleFonts.inter().fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: theme.fontSizes.s9,
          color: theme.colors.onBackground.withOpacity(0.8),
        ),
      ),
    )
        .animate(
          delay: const Duration(
            milliseconds: 300,
          ),
        )
        .fadeIn();
  }

  Widget _buildAppNameAndVersion(ThemeState theme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // App Name
        Text(
          'Pokerface',
          style: theme.themeText.bodyText2?.copyWith(
            fontFamily: GoogleFonts.inter().fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: theme.fontSizes.s16,
            color: theme.colors.onBackground,
          ),
          textAlign: TextAlign.center,
        ),
        // App Version
        Transform.scale(
          scale: 0.8,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 4.toAutoScaledWidth,
              vertical: 2.toAutoScaledHeight,
            ),
            decoration: BoxDecoration(
              color: theme.colors.onBackground.withOpacity(0.2),
              borderRadius: BorderRadius.circular(400.toAutoScaledWidth),
            ),
            child: Text(
              'v1.0.1+9',
              style: theme.themeText.bodyText2?.copyWith(
                fontFamily: GoogleFonts.inter().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: theme.fontSizes.s9,
                color: theme.colors.onBackground.withOpacity(0.6),
              ),
            ),
          ),
        ),
      ],
    )
        .animate(
          delay: const Duration(
            milliseconds: 200,
          ),
        )
        .fadeIn();
  }

  Widget _buildAppIcon() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: 0.5,
          child: Image.asset(
            Assets.images.appIconPng.path,
            width: 48.toAutoScaledWidth,
            height: 48.toAutoScaledHeight,
          )
              .animate()
              .then(
                delay: const Duration(
                  milliseconds: 500,
                ),
              )
              .fadeIn()
              .blur(
                end: const Offset(14, 14),
              ),
        ),
        Row(
          children: [
            const Spacer(),
            Clickable(
              onPressed: MyAppX.showSnow,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.toAutoScaledWidth),
                child: Image.asset(
                  Assets.images.appIconPng.path,
                  width: 48.toAutoScaledWidth,
                )
                    .animate()
                    .fadeIn()
                    .animate(
                      onPlay: (controller) => controller.repeat(),
                    )
                    .then(
                      delay: const Duration(
                        milliseconds: 200,
                      ),
                    )
                    .shimmer(
                      duration: const Duration(seconds: 1),
                      color: Colors.white30,
                    ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
