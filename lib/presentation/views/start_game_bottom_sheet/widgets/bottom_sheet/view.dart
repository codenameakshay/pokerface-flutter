import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/app/app_extensions/routing/intrinsic_router/intrinsic_router.dart';
import 'package:pokerface/presentation/app/core_widgets/clickable.dart';
import 'package:pokerface/presentation/utils/bottom_sheet/modal_bottom_sheet.dart';
import 'package:pokerface/presentation/utils/cards/cards_png.dart';

part 'controller.dart';

final cardsMap = {
  'Clubs': CardsPNG.fronts.allClubs,
  'Diamonds': CardsPNG.fronts.allDiamonds,
  'Hearts': CardsPNG.fronts.allHearts,
  'Spades': CardsPNG.fronts.allSpades,
};

@RoutePage(name: 'CardsListBottomSheetRoute')
class CardsListBottomSheet extends ConsumerStatefulWidget {
  const CardsListBottomSheet({super.key, this.initialSelectedCard});
  final String? initialSelectedCard;

  @override
  ConsumerState<CardsListBottomSheet> createState() => _CardsListBottomSheetState();
}

class _CardsListBottomSheetState extends ConsumerState<CardsListBottomSheet> {
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

class CardFan extends StatelessWidget {
  final double width;
  final double offsetStep;
  final List<String> cards;
  final Function(String) onPressed;
  final String? selectedCard;

  const CardFan({
    super.key,
    required this.width,
    required this.offsetStep,
    required this.cards,
    required this.onPressed,
    this.selectedCard,
  });
  @override
  Widget build(BuildContext context) {
    // Use Stack to overlay cards
    return Padding(
      padding: EdgeInsets.only(
        left: 16.toAutoScaledWidth,
        right: 16.toAutoScaledWidth,
        top: 16.toAutoScaledHeight,
      ),
      child: SizedBox(
        width: // calculate total width based on number of cards
            width + (cards.length - 1) * offsetStep,
        height: width * (333 / 234), // Ensure this matches your card height
        child: Stack(
          children: List.generate(cards.length, (index) {
            // Calculate the offset for each card based on its index
            double offset = index * offsetStep;

            return Positioned(
              left: offset,
              child: Transform.translate(
                offset: selectedCard == cards[index] ? Offset(0, -16.toAutoScaledHeight) : const Offset(0, 0),
                child: Material(
                  color: Colors.transparent,
                  child: Clickable(
                    onPressed: () => onPressed(cards[index]),
                    child: Hero(
                      tag: cards[index],
                      child: Container(
                        width: width,
                        height: width * (333 / 234),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                          cards[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
