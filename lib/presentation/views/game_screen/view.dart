import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokerface/data/models/bulb.dart';
import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/data/models/grouped_hands.dart';
import 'package:pokerface/data/models/poker_hand.dart';
import 'package:pokerface/data/models/street_light.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/app/core_widgets/dashed_border.dart';
import 'package:pokerface/presentation/utils/bottom_sheet/modal_bottom_sheet.dart';
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
    final theme = ref.watch(MyAppX.theme.current);
    final params = _VSControllerParams(
      context: context,
      userSelectedCards: widget.userSelectedCards,
      numberOfPlayers: widget.numberOfPlayers,
      numberOfHouseCards: widget.numberOfHouseCards,
      theme: theme,
    );
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
              SizedBox.expand(
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MediaQuery.of(context).padding.top.toVerticalSizedBox,
                        // ListTile(
                        //   title: Text(
                        //     state.generateTime?.elapsed.inMilliseconds == 0
                        //         ? 'Generate Hands'
                        //         : 'Generated in ${(state.generateTime?.elapsed.inMilliseconds ?? 0) / 1000} seconds',
                        //     style: theme.themeText.headline6,
                        //   ),
                        // ),
                        10.toAutoScaledHeight.toVerticalSizedBox,
                        ExpansionPanelList(
                          expansionCallback: (int index, bool isExpanded) {
                            stateController.toggleExpand(index, isExpanded);
                          },
                          dividerColor: Colors.transparent,
                          elevation: 0,
                          expandedHeaderPadding: EdgeInsets.zero,
                          materialGapSize: 0,
                          expandIconColor: theme.colors.primary,
                          children: [
                            for (final groupedHands in state.generatedHands) ...[
                              ExpansionPanel(
                                headerBuilder: (context, isExpanded) => Column(
                                  children: [
                                    ListTile(
                                      leading: Padding(
                                        padding: EdgeInsets.only(left: 16.toAutoScaledWidth),
                                        child: Text(
                                          groupedHands.pokerHands[0].evaluateHand().emoji,
                                          textAlign: TextAlign.center,
                                          style: theme.themeText.headline6,
                                        ),
                                      ),
                                      title: Text(
                                        groupedHands.pokerHands[0].evaluateHand().name,
                                        textAlign: TextAlign.center,
                                        style: theme.themeText.headline6,
                                      ),
                                      trailing: Padding(
                                        padding: EdgeInsets.only(right: 8.toAutoScaledWidth),
                                        child: Text(
                                          (groupedHands.pokerHands[0].score).toString(),
                                          textAlign: TextAlign.center,
                                          style: theme.themeText.headline6,
                                        ),
                                      ),
                                    ),
                                    Wrap(
                                      alignment: WrapAlignment.center,
                                      crossAxisAlignment: WrapCrossAlignment.center,
                                      runSpacing: 8.toAutoScaledWidth,
                                      spacing: 8.toAutoScaledWidth,
                                      children: List.generate(
                                        groupedHands.pokerHands[0].cards.length,
                                        (index) => CardPreview(
                                          width: MediaQuery.of(context).size.width *
                                              0.6 /
                                              groupedHands.pokerHands[0].cards.length,
                                          card: groupedHands.pokerHands[0].sortedCards[index],
                                          userCards: params.userSelectedCards,
                                          theme: theme,
                                        ),
                                      ),
                                    ),
                                    24.toAutoScaledHeight.toVerticalSizedBox,
                                  ],
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
                                            userCards: params.userSelectedCards,
                                            theme: theme,
                                          ),
                                        ),
                                      ),
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
              ),
              Positioned(
                top: 0,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: ShapeDecoration(
                    color: theme.colors.background,
                    shape: DashedBorder(
                      color: theme.colors.secondary.withOpacity(0.1),
                      dashWidth: 12,
                      dashSpace: 4,
                      strokeWidth: 2,
                      bottom: true,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.toAutoScaledHeight),
                  child: SafeArea(
                    bottom: false,
                    child: Row(
                      children: [
                        32.toAutoScaledWidth.toHorizontalSizedBox,
                        Row(
                          children: params.userSelectedCards
                              .take(4)
                              .map(
                                (e) => Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: Colors.black.withOpacity(0.1),
                                          width: 2,
                                        ),
                                      ),
                                      child: Text(
                                        '${e.suit.emoji}${e.rank.emoji}',
                                        style: theme.themeText.headline6,
                                      ),
                                    ),
                                    8.toAutoScaledWidth.toHorizontalSizedBox,
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                        const Spacer(),
                        for (final bulb in state.streetLight.bulbs) ...[
                          4.toAutoScaledWidth.toHorizontalSizedBox,
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: bulb.isOn ? bulb.onColor : bulb.offColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: bulb.borderColor,
                                width: 2,
                              ),
                            ),
                          ),
                        ],
                        32.toAutoScaledWidth.toHorizontalSizedBox,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: ShapeDecoration(
                    color: theme.colors.background,
                    shape: DashedBorder(
                      color: theme.colors.secondary.withOpacity(0.1),
                      dashWidth: 12,
                      dashSpace: 4,
                      strokeWidth: 2,
                      top: true,
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
                          onPressed: () =>
                              stateController.reGenHands(context, params.userSelectedCards.sublist(0, index + 2)),
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
