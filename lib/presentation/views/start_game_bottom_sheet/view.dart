import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/app/core_widgets/clickable.dart';
import 'package:pokerface/presentation/app/core_widgets/dashed_rect_painter.dart';
import 'package:pokerface/presentation/app/core_widgets/squircle_button.dart';
import 'package:pokerface/presentation/utils/bottom_sheet/modal_bottom_sheet.dart';
import 'package:pokerface/presentation/utils/cards/cards_png.dart';
import 'package:pokerface/presentation/views/select_cards_bottom_sheet/view.dart';

part 'controller.dart';
part 'widgets/dashed_outline_button.dart';

@RoutePage(name: 'StartGameBottomSheetRoute')
class StartGameBottomSheet extends ConsumerStatefulWidget {
  const StartGameBottomSheet({super.key});

  @override
  ConsumerState<StartGameBottomSheet> createState() => _StartGameBottomSheetState();
}

class _StartGameBottomSheetState extends ConsumerState<StartGameBottomSheet> {
  @override
  Widget build(BuildContext context) {
    const params = _VSControllerParams();
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
          child: SingleChildScrollView(
            controller: ModalScrollController.of(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                32.toAutoScaledHeight.toVerticalSizedBox,
                Text(
                  'Select your hand',
                  textAlign: TextAlign.center,
                  style: theme.themeText.headline4,
                ),
                16.toAutoScaledHeight.toVerticalSizedBox,
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: 16.toAutoScaledWidth,
                  spacing: 16.toAutoScaledWidth,
                  children: [
                    DashedCardButton(
                      onPressed: () => stateController.openCardsList(context),
                      width: 120.toAutoScaledWidth,
                      card: state.selectedCards.isNotEmpty ? state.selectedCards.first : null,
                    ),
                    DashedCardButton(
                      onPressed: () => stateController.openCardsList(context),
                      width: 120.toAutoScaledWidth,
                      card: state.selectedCards.length > 1 ? state.selectedCards[1] : null,
                    ),
                  ],
                ),
                32.toAutoScaledHeight.toVerticalSizedBox,
                Text(
                  'Number of players (${state.numberOfPlayers.round()})',
                  textAlign: TextAlign.center,
                  style: theme.themeText.headline4,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.toAutoScaledWidth),
                  child: Slider(
                    value: state.numberOfPlayers,
                    divisions: 9,
                    onChanged: stateController.changeNumberOfPlayers,
                    max: 10,
                    min: 1,
                    label: state.numberOfPlayers.round().toString(),
                  ),
                ),
                32.toAutoScaledHeight.toVerticalSizedBox,
                Text(
                  'Open cards (${state.openCards.round()})',
                  textAlign: TextAlign.center,
                  style: theme.themeText.headline4,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.toAutoScaledWidth),
                  child: Slider(
                    value: state.openCards,
                    divisions: 4,
                    onChanged: stateController.changeOpenCards,
                    max: 5,
                    min: 1,
                    label: state.openCards.round().toString(),
                  ),
                ),
                32.toAutoScaledHeight.toVerticalSizedBox,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.toAutoScaledWidth),
                  child: SquareButton(
                    onPressed: () => MyAppX.router.pop({
                      'userSelectedCards': state.selectedCards,
                      'numberOfPlayers': state.numberOfPlayers,
                      'numberOfHouseCards': state.openCards,
                    }),
                    text: 'Start game',
                    enabled: state.selectedCards.length >= 2,
                  ),
                ),
                16.toAutoScaledHeight.toVerticalSizedBox,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.toAutoScaledWidth),
                  child: Text(
                    'Texas Hold\'em, a poker variation, involves players receiving two private cards and using five community cards, dealt in stages, to form the best five-card hand. Betting occurs pre-flop and post each deal, with the best hand winning the pot.',
                    textAlign: TextAlign.center,
                    style: theme.themeText.caption?.copyWith(
                      fontSize: 8.toAutoScaledWidth,
                      color: theme.colors.onBackground.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
