import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/data/models/grouped_hands.dart';
import 'package:pokerface/data/models/poker_hand.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/utils/bottom_sheet/modal_bottom_sheet.dart';
import 'package:pokerface/presentation/utils/cards/all_cards.dart';
import 'package:pokerface/presentation/utils/cards/cards_png.dart';
import 'package:pokerface/presentation/utils/hands/testing.dart';
import 'package:pokerface/presentation/views/select_cards_bottom_sheet/view.dart';
import 'package:pokerface/presentation/views/start_game_bottom_sheet/view.dart';

part 'controller.dart';
part 'widgets/card_preview.dart';

@RoutePage(name: 'GameRoute')
class GameView extends ConsumerStatefulWidget {
  const GameView({
    super.key,
    required this.userSelectedCards,
    required this.numberOfPlayers,
    required this.numberOfHouseCards,
  });

  final List<Card> userSelectedCards;
  final double numberOfPlayers;
  final double numberOfHouseCards;

  @override
  ConsumerState<GameView> createState() => _GameViewState();
}

class _GameViewState extends ConsumerState<GameView> {
  @override
  Widget build(BuildContext context) {
    final params = _VSControllerParams(
      context: context,
      userSelectedCards: widget.userSelectedCards,
      numberOfPlayers: widget.numberOfPlayers,
      numberOfHouseCards: widget.numberOfHouseCards,
    );
    final theme = ref.watch(MyAppX.theme.current);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.watch(_vsProvider(params).notifier);

    return ProviderScope(
      overrides: [_paramsProvider.overrideWithValue(params)],
      child: Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.colors.background,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        title: Text(
                          state.generateTime?.elapsed.inMilliseconds == 0
                              ? 'Generate Hands'
                              : 'Generated in ${(state.generateTime?.elapsed.inMilliseconds ?? 0) / 1000} seconds',
                          style: theme.themeText.headline6,
                        ),
                      ),
                      24.toAutoScaledHeight.toVerticalSizedBox,
                      ExpansionPanelList(
                        expansionCallback: (int index, bool isExpanded) {
                          stateController.toggleExpand(index, isExpanded);
                        },
                        children: [
                          for (final groupedHands in state.generatedHands) ...[
                            ExpansionPanel(
                              headerBuilder: (context, isExpanded) => ListTile(
                                title: Text(
                                  groupedHands.pokerHands[0].evaluateHand().name,
                                  textAlign: TextAlign.center,
                                  style: theme.themeText.headline6,
                                ),
                                trailing: Text(
                                  (groupedHands.pokerHands[0].score).toString(),
                                  textAlign: TextAlign.center,
                                  style: theme.themeText.headline6,
                                ),
                              ),
                              body: Column(
                                children: [
                                  for (final hand in groupedHands.pokerHands) ...[
                                    24.toAutoScaledHeight.toVerticalSizedBox,
                                    Wrap(
                                      alignment: WrapAlignment.center,
                                      crossAxisAlignment: WrapCrossAlignment.center,
                                      runSpacing: 8.toAutoScaledWidth,
                                      spacing: 8.toAutoScaledWidth,
                                      children: List.generate(
                                        hand.cards.length,
                                        (index) => CardPreview(
                                          width: MediaQuery.of(context).size.width * 0.8 / hand.cards.length,
                                          card: hand.sortedCards[index],
                                        ),
                                      ),
                                    )
                                  ]
                                ],
                              ),
                              canTapOnHeader: true,
                              isExpanded: groupedHands.isExpaned,
                            )
                          ]
                        ],
                      ),
                      256.toAutoScaledHeight.toVerticalSizedBox,
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colors.background,
                    border: Border(
                      top: BorderSide(
                        color: theme.colors.secondary,
                        width: 2,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 24.toAutoScaledHeight),
                  child: SafeArea(
                    top: false,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 16.toAutoScaledWidth,
                      spacing: 16.toAutoScaledWidth,
                      children: List.generate(
                        params.numberOfHouseCards.toInt(),
                        (index) => DashedCardButton(
                          onPressed: () => stateController.reGenHands(
                              context,
                              [
                                Cards.clubs.eight,
                                Cards.hearts.ace,
                                Cards.spades.five,
                                Cards.hearts.nine,
                                Cards.diamonds.six,
                                Cards.clubs.three,
                                Cards.diamonds.two,
                              ].sublist(0, index + 2)),
                          // onPressed: () => stateController.showStartGameSheet(context, index),
                          width: MediaQuery.of(context).size.width * 0.7 / params.numberOfHouseCards,
                          card: state.houseCards.length > index ? state.houseCards[index] : null,
                        ),
                      ),
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
