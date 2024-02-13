import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/app/app_extensions/routing/intrinsic_router/intrinsic_router.dart';
import 'package:pokerface/presentation/app/core_widgets/route_detector.dart';
import 'package:pokerface/presentation/app/core_widgets/shake_detector.dart';
import 'package:pokerface/presentation/app/core_widgets/squircle_button.dart';
import 'package:pokerface/presentation/utils/bottom_sheet/modal_bottom_sheet.dart';
import 'package:pokerface/presentation/utils/cards/all_cards.dart';
import 'package:pokerface/presentation/utils/cards/cards_png.dart';
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
    final state = ref.watch(_vsProvider(params));
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
                child: Container(color: theme.colors.background.withOpacity(0.5)),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.toAutoScaledWidth),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Spacer(),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            'Pokerface',
                            style: theme.themeText.headline2?.copyWith(
                              fontSize: (theme.themeText.headline2?.fontSize ?? 10) * 1.02,
                              fontWeight: FontWeight.bold,
                              color: theme.colors.background,
                            ),
                          ),
                          Text(
                            'Pokerface',
                            style: theme.themeText.headline2?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SquareButton(
                        onPressed: () {
                          stateController.navigateToNewGame(
                            userSelectedCards: [
                              Cards.clubs.ace,
                              Cards.diamonds.king,
                              Cards.spades.nine,
                              Cards.hearts.ten,
                              Cards.clubs.three,
                              Cards.diamonds.three,
                              Cards.spades.five,
                            ],
                            numberOfPlayers: 4,
                            numberOfHouseCards: 6,
                          );
                        },
                        text: 'Quick Game',
                        type: ButtonType.primary,
                      ),
                      SquareButton(
                        onPressed: () {
                          stateController.showStartGameBottomSheet(context);
                        },
                        text: 'New Game',
                        type: ButtonType.secondary,
                      ),
                      // SquareButton(
                      //   onPressed: () {
                      //     // context.router.push(const HomeRoute());
                      //   },
                      //   text: 'New Game',
                      //   type: ButtonType.tertiary,
                      // ),
                      // SquareButton(
                      //   onPressed: () {
                      //     // context.router.push(const HomeRoute());
                      //   },
                      //   text: 'New Game',
                      //   type: ButtonType.warning,
                      // ),
                      SquareButton(
                        onPressed: () {
                          MyAppX.theme.nextTo();

                          // context.router.push(const HomeRoute());
                        },
                        text: 'Next theme',
                        type: ButtonType.error,
                      ),
                      const Spacer(),
                    ],
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
