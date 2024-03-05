import 'dart:io';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/gen/assets.gen.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/app/app_extensions/routing/intrinsic_router/intrinsic_router.dart';
import 'package:pokerface/presentation/app/core_widgets/default_sticker.dart';
import 'package:pokerface/presentation/app/core_widgets/route_detector.dart';
import 'package:pokerface/presentation/app/core_widgets/shake_detector.dart';
import 'package:pokerface/presentation/app/core_widgets/squircle_button.dart';
import 'package:pokerface/presentation/utils/bottom_sheet/modal_bottom_sheet.dart';
import 'package:pokerface/presentation/utils/cards/all_cards.dart';
import 'package:pokerface/presentation/utils/cards/cards_png.dart';
import 'package:pokerface/presentation/views/ai_chat_screen/view.dart';
import 'package:pokerface/presentation/views/home_screen/widgets/about_sheet.dart';
import 'package:pokerface/presentation/views/home_screen/widgets/change_app_theme_sheet.dart';
import 'package:pokerface/presentation/views/start_game_bottom_sheet/view.dart';

part 'controller.dart';
part 'widgets/diagonal_moving_card.dart';
part 'widgets/stack_cards.dart';

@RoutePage(name: 'HomeRoute')
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    const params = _VSControllerParams();
    final theme = ref.watch(MyAppX.theme.current);
    final stateController = ref.watch(_vsProvider(params).notifier);

    return ProviderScope(
      overrides: [_paramsProvider.overrideWithValue(params)],
      child: Scaffold(
        // overlayStyle: stateController.statusBarStyle(theme),
        body: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.colors.background,
          ),
          child: Stack(
            children: [
              const StackCards(),
              SizedBox.expand(
                child: Container(
                  color: theme.type.isDark ? const Color(0xFF020513).withOpacity(0.9) : Colors.white.withOpacity(0.9),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.toAutoScaledWidth),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      300.toAutoScaledWidth.toVerticalSizedBox,
                      Text(
                        'POKERFACE',
                        style: theme.themeText.headline1?.copyWith(
                          fontFamily: GoogleFonts.bigShouldersDisplay().fontFamily,
                          fontWeight: FontWeight.w900,
                          color: theme.type.isDark ? Colors.white : const Color(0xFF020513),
                        ),
                      )
                          .animate()
                          .animate(
                            onPlay: (controller) => controller.repeat(),
                          )
                          .then(
                            delay: const Duration(
                              seconds: 2,
                            ),
                          )
                          .shimmer(
                              duration: const Duration(seconds: 2),
                              color: theme.type.isDark
                                  ? const Color(0xFF020513).withOpacity(0.3)
                                  : Colors.white.withOpacity(0.3)),
                      const Spacer(),
                      // SquareButton(
                      //   onPressed: () {
                      //     stateController.navigateToNewGame(
                      //       userSelectedCards: generateDeck().take(2).toList(),
                      //       numberOfPlayers: 4,
                      //       numberOfHouseCards: 5,
                      //     );
                      //   },
                      //   text: 'Quick Game',
                      //   type: ButtonType.primary,
                      // ),
                      SquareButton(
                        onPressed: () {
                          stateController.showStartGameBottomSheet(context);
                        },
                        text: 'New Game',
                        type: ButtonType.primary,
                      ),
                      // SquareButton(
                      //   onPressed: () {
                      //     stateController.navigateToAIScreen();
                      //   },
                      //   text: 'Chat with AI',
                      //   type: ButtonType.tertiary,
                      // ),
                      SquareButton(
                        onPressed: stateController.navigateToPreviousGamesRoute,
                        text: 'Previous games',
                        type: ButtonType.secondary,
                      ),
                      SquareButton(
                        onPressed: () => stateController.showChangeThemeBottomSheet(context),
                        text: 'Change theme',
                        type: ButtonType.error,
                      ),
                      SquareButton(
                        onPressed: () => stateController.showAboutSheet(context),
                        text: 'About',
                        type: ButtonType.warning,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 100.toAutoScaledWidth,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Column(
                      children: [
                        DraggableSticker(
                          child: Image.asset(
                            Assets.images.stickers.values[Random().nextInt(Assets.images.stickers.values.length)].path,
                            height: 200.toAutoScaledWidth,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
