import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/app/app_extensions/routing/intrinsic_router/intrinsic_router.dart';
import 'package:pokerface/presentation/app/core_widgets/clickable.dart';
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
  const SelectCardsBottomSheet({super.key, this.initialSelectedCard});
  final Card? initialSelectedCard;

  @override
  ConsumerState<SelectCardsBottomSheet> createState() => _SelectCardsBottomSheetState();
}

class _SelectCardsBottomSheetState extends ConsumerState<SelectCardsBottomSheet> {
  final offsetStep = 36.0;
  final width = 100.0;

  @override
  Widget build(BuildContext context) {
    final params = _VSControllerParams(initialSelectedCard: widget.initialSelectedCard);
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
                      selectedCard: state.selectedCard,
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
        ),
      ),
    );
  }
}
