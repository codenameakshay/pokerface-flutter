import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:pokerface/data/models/bulb.dart';
import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/data/models/grouped_hands.dart';
import 'package:pokerface/data/models/poker_hand.dart';
import 'package:pokerface/data/models/street_light.dart';
import 'package:pokerface/data/models/user_hand.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/app/core_widgets/clickable.dart';
import 'package:pokerface/presentation/app/core_widgets/dashed_border.dart';
import 'package:pokerface/presentation/utils/bottom_sheet/modal_bottom_sheet.dart';
import 'package:pokerface/presentation/utils/cards/cards_png.dart';
import 'package:pokerface/presentation/utils/state/state.dart';
import 'package:pokerface/presentation/views/ai_chat_screen/view.dart';
import 'package:pokerface/presentation/views/game_screen/widgets/dummy_chat.dart';
import 'package:pokerface/presentation/views/select_cards_bottom_sheet/view.dart';
import 'package:pokerface/presentation/views/start_game_bottom_sheet/view.dart';

part 'controller.dart';
part 'widgets/card_preview.dart';
part 'widgets/ai_chat_button.dart';
part 'widgets/ai_chat_popup.dart';
part 'widgets/top_user_cards.dart';
part 'widgets/bottom_house_cards.dart';
part 'widgets/body.dart';
part 'widgets/hand_preview.dart';
part 'widgets/hand_rank_header.dart';
part 'widgets/hand_ranks_list.dart';
part 'widgets/score.dart';

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
              _Body(params: params),
              _TopUserCards(params: params),
              _BottomHouseCards(params: params),
              _AIChatPopup(params: params),
            ],
          ),
        ),
      ),
    );
  }
}
