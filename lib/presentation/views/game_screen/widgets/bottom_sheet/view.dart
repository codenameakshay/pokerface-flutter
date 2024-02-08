import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/app/core_widgets/clickable.dart';
import 'package:pokerface/presentation/app/core_widgets/dashed_rect_painter.dart';
import 'package:pokerface/presentation/utils/bottom_sheet/modal_bottom_sheet.dart';
import 'package:pokerface/presentation/utils/cards/cards_png.dart';
import 'package:pokerface/presentation/views/game_screen/widgets/bottom_sheet/widgets/bottom_sheet/view.dart';

part 'controller.dart';
part 'widgets/dashed_outline_button.dart';

@RoutePage(name: 'SelectCardsBottomSheetRoute')
class SelectCardsBottomSheet extends ConsumerStatefulWidget {
  const SelectCardsBottomSheet({super.key});

  @override
  ConsumerState<SelectCardsBottomSheet> createState() => _SelectCardsBottomSheetState();
}

class _SelectCardsBottomSheetState extends ConsumerState<SelectCardsBottomSheet> {
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
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 16.toAutoScaledWidth,
              spacing: 16.toAutoScaledWidth,
              children: [
                DashedCardButton(
                  onPressed: () => stateController.showCardsListBottomSheet(context),
                  width: 120.toAutoScaledWidth,
                  // card: CardsPNG.fronts.clubsKing,
                ),
                DashedCardButton(
                  onPressed: () => stateController.showCardsListBottomSheet(context),
                  width: 120.toAutoScaledWidth,
                  // card: CardsPNG.fronts.clubsKing,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
