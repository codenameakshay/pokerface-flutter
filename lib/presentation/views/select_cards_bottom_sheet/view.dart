import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/app/app_extensions/routing/intrinsic_router/intrinsic_router.dart';
import 'package:pokerface/presentation/app/core_widgets/clickable.dart';
import 'package:pokerface/presentation/app/core_widgets/in_app_notification/in_app_notification.dart';
import 'package:pokerface/presentation/app/core_widgets/squircle_button.dart';
import 'package:pokerface/presentation/utils/bottom_sheet/modal_bottom_sheet.dart';
import 'package:pokerface/presentation/utils/cards/all_cards.dart';

part 'controller.dart';
part 'widgets/card_fan.dart';

final cardsMap = {
  'Clubs': Cards.clubs.all,
  'Diamonds': Cards.diamonds.all,
  'Hearts': Cards.hearts.all,
  'Spades': Cards.spades.all,
};

@RoutePage(name: 'SelectCardsBottomSheetRoute')
class SelectCardsBottomSheet extends ConsumerStatefulWidget {
  const SelectCardsBottomSheet({super.key, this.initialSelectedCards, required this.maxCards});
  final List<Card>? initialSelectedCards;
  final int maxCards;

  @override
  ConsumerState<SelectCardsBottomSheet> createState() => _SelectCardsBottomSheetState();
}

class _SelectCardsBottomSheetState extends ConsumerState<SelectCardsBottomSheet> {
  final offsetStep = 36.0;
  final width = 100.0;

  @override
  Widget build(BuildContext context) {
    final params = _VSControllerParams(
      initialSelectedCards: widget.initialSelectedCards,
      maxSelectedCards: widget.maxCards,
    );
    final theme = ref.watch(MyAppX.theme.current);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.watch(_vsProvider(params).notifier);

    return PopScope(
      onPopInvoked: (didPop) {
        if (state.selectedCards.isNotEmpty) {
          MyAppX.showToast(
              message:
                  'Selected cards: ${state.selectedCards.map((e) => '${e.suit.emoji}${e.rank.emoji}').join(', ')}');
        }
      },
      child: ProviderScope(
        overrides: [_paramsProvider.overrideWithValue(params)],
        child: Scaffold(
          body: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.colors.background,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SingleChildScrollView(
                  controller: ModalScrollController.of(context),
                  child: Column(
                    children: [
                      32.toAutoScaledHeight.toVerticalSizedBox,
                      Text(
                        'Select your card',
                        style: theme.themeText.headline4,
                      ),
                      16.toAutoScaledHeight.toVerticalSizedBox,
                      for (final entry in cardsMap.entries) ...[
                        16.toAutoScaledHeight.toVerticalSizedBox,
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 2.toAutoScaledHeight,
                                horizontal: 16.toAutoScaledWidth,
                              ),
                              child: Text(
                                entry.key,
                                textAlign: TextAlign.left,
                                style: theme.themeText.caption,
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: CardFan(
                            width: width,
                            offsetStep: offsetStep,
                            cards: entry.value,
                            selectedCards: state.selectedCards,
                            onPressed: (card) {
                              stateController.showCardPreview(card);
                            },
                          ),
                        ),
                      ],
                      128.toAutoScaledHeight.toVerticalSizedBox,
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  width: MediaQuery.of(context).size.width - 64.toAutoScaledWidth,
                  child: SafeArea(
                    top: false,
                    child: SquareButton(
                      enabled: state.selectedCards.isNotEmpty,
                      type: ButtonType.primary,
                      text: 'Done',
                      onPressed: () => MyAppX.router.pop(state.selectedCards),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
