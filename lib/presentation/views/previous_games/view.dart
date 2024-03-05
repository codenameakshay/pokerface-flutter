import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/data/models/game_history.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/app/app_extensions/routing/intrinsic_router/intrinsic_router.dart';
import 'package:pokerface/presentation/utils/bottom_sheet/modal_bottom_sheet.dart';
import 'package:pokerface/presentation/views/ai_chat_screen/view.dart';
import 'package:pokerface/presentation/views/home_screen/widgets/about_sheet.dart';
import 'package:pokerface/presentation/views/home_screen/widgets/change_app_theme_sheet.dart';
import 'package:pokerface/presentation/views/start_game_bottom_sheet/view.dart';

part 'controller.dart';

@RoutePage()
class PreviousGamesView extends ConsumerStatefulWidget {
  const PreviousGamesView({super.key});

  @override
  ConsumerState<PreviousGamesView> createState() => _PreviousGamesViewState();
}

class _PreviousGamesViewState extends ConsumerState<PreviousGamesView> {
  @override
  Widget build(BuildContext context) {
    const params = _VSControllerParams();
    final theme = ref.watch(MyAppX.theme.current);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.watch(_vsProvider(params).notifier);

    return ProviderScope(
      overrides: [_paramsProvider.overrideWithValue(params)],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Previous Games',
            style: GoogleFonts.inter(
              color: theme.colors.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: theme.colors.background,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.toAutoScaledWidth),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: state.gameHistories.length,
              itemBuilder: (context, index) => _GameHistoryItem(
                gameHistory: state.gameHistories[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GameHistoryItem extends ConsumerWidget {
  const _GameHistoryItem({
    required this.gameHistory,
  });

  final GameHistory gameHistory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);
    final stateController = ref.watch(_vsProvider(const _VSControllerParams()).notifier);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('dd LLLL yyyy').format(gameHistory.gameStartAt),
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Icon(
                  gameHistory.isUserWinner ? Icons.emoji_events : Icons.sentiment_dissatisfied,
                  color: gameHistory.isUserWinner ? Colors.green : Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: gameHistory.userSelectedCards
                  .map(
                    (card) => Chip(
                      label: Text(card.suit.emoji + card.rank.emoji),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 8),
            Text(
              'Score: ${gameHistory.score}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Duration: ${gameHistory.elapsedSeconds} seconds',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('House Cards: '),
                ...gameHistory.openHouseCards.map(
                  (card) => Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Chip(
                      label: Text(card.suit.emoji + card.rank.emoji),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
