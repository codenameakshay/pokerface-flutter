import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/utils/bottom_sheet/modal_bottom_sheet.dart';
import 'package:pokerface/presentation/utils/cards/cards_png.dart';
import 'package:pokerface/presentation/views/game_screen/widgets/bottom_sheet/view.dart';
import 'package:pokerface/presentation/views/game_screen/widgets/bottom_sheet/widgets/bottom_sheet/view.dart';

part 'controller.dart';
part 'widgets/card_preview.dart';

final pncs = [
  [
    CardsPNG.fronts.heartsJack,
    CardsPNG.fronts.heartsQueen,
    CardsPNG.fronts.heartsKing,
    CardsPNG.fronts.heartsAce,
    CardsPNG.fronts.hearts2,
  ],
  [
    CardsPNG.fronts.diamondsJack,
    CardsPNG.fronts.diamondsQueen,
    CardsPNG.fronts.diamondsKing,
    CardsPNG.fronts.diamondsAce,
    CardsPNG.fronts.diamonds2,
  ],
  [
    CardsPNG.fronts.clubsJack,
    CardsPNG.fronts.clubsQueen,
    CardsPNG.fronts.clubsKing,
    CardsPNG.fronts.clubsAce,
    CardsPNG.fronts.clubs2,
  ],
  [
    CardsPNG.fronts.spadesJack,
    CardsPNG.fronts.spadesQueen,
    CardsPNG.fronts.spadesKing,
    CardsPNG.fronts.spadesAce,
    CardsPNG.fronts.spades2,
  ],
  [
    CardsPNG.fronts.heartsJack,
    CardsPNG.fronts.heartsQueen,
    CardsPNG.fronts.heartsKing,
    CardsPNG.fronts.heartsAce,
    CardsPNG.fronts.hearts2,
  ],
  [
    CardsPNG.fronts.heartsJack,
    CardsPNG.fronts.heartsQueen,
    CardsPNG.fronts.heartsKing,
    CardsPNG.fronts.heartsAce,
    CardsPNG.fronts.hearts2,
  ],
  [
    CardsPNG.fronts.heartsJack,
    CardsPNG.fronts.heartsQueen,
    CardsPNG.fronts.heartsKing,
    CardsPNG.fronts.heartsAce,
    CardsPNG.fronts.hearts2,
  ],
  [
    CardsPNG.fronts.heartsJack,
    CardsPNG.fronts.heartsQueen,
    CardsPNG.fronts.heartsKing,
    CardsPNG.fronts.heartsAce,
    CardsPNG.fronts.hearts2,
  ],
  [
    CardsPNG.fronts.heartsJack,
    CardsPNG.fronts.heartsQueen,
    CardsPNG.fronts.heartsKing,
    CardsPNG.fronts.heartsAce,
    CardsPNG.fronts.hearts2,
  ],
];

@RoutePage(name: 'GameRoute')
class GameView extends ConsumerStatefulWidget {
  const GameView({
    super.key,
    required this.userSelectedCards,
    required this.numberOfPlayers,
    required this.numberOfHouseCards,
  });

  final List<String> userSelectedCards;
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
                      for (final pnc in pncs) ...[
                        24.toAutoScaledHeight.toVerticalSizedBox,
                        Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runSpacing: 8.toAutoScaledWidth,
                          spacing: 8.toAutoScaledWidth,
                          children: List.generate(
                            pnc.length,
                            (index) => CardPreview(
                              width: MediaQuery.of(context).size.width * 0.8 / pnc.length,
                              card: pnc[index],
                            ),
                          ),
                        ),
                      ],
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
                          onPressed: () => stateController.showSelectCardSheet(context, index),
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
