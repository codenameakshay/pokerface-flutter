import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/data/models/game_history.dart';
import 'package:pokerface/data/models/poker_hand.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/app/app_extensions/routing/intrinsic_router/intrinsic_router.dart';
import 'package:pokerface/presentation/app/core_widgets/clickable.dart';
import 'package:pokerface/presentation/app/core_widgets/hand_preview.dart';
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

    return ProviderScope(
      overrides: [_paramsProvider.overrideWithValue(params)],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Previous Games',
            style: GoogleFonts.inter(
              color: theme.colors.onSecondaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: theme.colors.secondaryContainer,
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => MyAppX.router.pop(),
            ),
          ],
        ),
        backgroundColor: theme.colors.secondary,
        body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 12.toAutoScaledWidth, vertical: 8.toAutoScaledWidth),
          itemCount: state.gameHistories.length,
          itemBuilder: (context, index) => _GameHistoryItem(
            gameHistory: state.gameHistories[index],
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

  String _formatElapsedTime(int totalSeconds) {
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  List<Widget> _buildCustomTableRow(String label, String value, ThemeState theme, {bool isHighlight = false}) {
    return [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 2.toAutoScaledWidth),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: theme.themeText.subtitle1?.copyWith(
                color: theme.colors.onSecondaryContainer,
                fontWeight: FontWeight.normal,
                fontSize: 12.toAutoScaledWidth,
              ),
            ),
            Flexible(
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: GoogleFonts.inter().copyWith(
                  color: isHighlight ? theme.colors.primary : theme.colors.onSecondaryContainer,
                  fontWeight: isHighlight ? FontWeight.bold : FontWeight.w100,
                  fontSize: 12.toAutoScaledWidth,
                  fontFamily: GoogleFonts.inter().fontFamily,
                ),
              ),
            ),
          ],
        ),
      ),
      Divider(
        color: theme.colors.onSecondaryContainer.withOpacity(0.05),
        thickness: 2,
      ),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);

    return Clickable(
      onPressed: () {
        // show a dialog with all the information in game history
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Game History',
              style: theme.themeText.headline6?.copyWith(
                color: theme.colors.onSecondaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'User Cards:',
                    style: theme.themeText.subtitle1?.copyWith(
                      color: theme.colors.onSecondaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 8.toAutoScaledWidth,
                    spacing: 8.toAutoScaledWidth,
                    children: List.generate(
                      gameHistory.userSelectedCards.length,
                      (index) => CardPreview(
                        width: 40.toAutoScaledWidth,
                        card: gameHistory.userSelectedCards[index],
                        userCards: gameHistory.userSelectedCards,
                        houseCards: gameHistory.openHouseCards,
                        theme: theme,
                      ),
                    ),
                  ),
                  8.toAutoScaledHeight.toVerticalSizedBox,
                  Text(
                    'House Cards:',
                    style: theme.themeText.subtitle1?.copyWith(
                      color: theme.colors.onSecondaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 8.toAutoScaledWidth,
                    spacing: 8.toAutoScaledWidth,
                    children: List.generate(
                      gameHistory.openHouseCards.length,
                      (index) => CardPreview(
                        width: 40.toAutoScaledWidth,
                        card: gameHistory.openHouseCards[index],
                        userCards: gameHistory.userSelectedCards,
                        houseCards: gameHistory.openHouseCards,
                        theme: theme,
                      ),
                    ),
                  ),
                  12.toAutoScaledHeight.toVerticalSizedBox,
                  ..._buildCustomTableRow(
                      'Game start at', DateFormat('hh:mm a - MMM dd, yy').format(gameHistory.gameStartAt), theme),
                  ..._buildCustomTableRow(
                      'Game end at', DateFormat('hh:mm a - MMM dd, yy').format(gameHistory.gameUpdatedAt), theme),
                  ..._buildCustomTableRow('Round time', _formatElapsedTime(gameHistory.elapsedSeconds), theme),
                  ..._buildCustomTableRow('Score', gameHistory.score.toString(), theme, isHighlight: true),
                  ..._buildCustomTableRow('Won?', gameHistory.isUserWinner ? 'Yes' : 'No', theme,
                      isHighlight: gameHistory.isUserWinner),
                  ..._buildCustomTableRow('Best hand', gameHistory.topPokerHand.evaluateHand().name, theme),
                  ..._buildCustomTableRow('Total Players', gameHistory.numberOfPlayers.toInt().toString(), theme),
                  ..._buildCustomTableRow(
                      'Number of house cards', gameHistory.numberOfHouseCards.toInt().toString(), theme),
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.toAutoScaledWidth),
          color: theme.colors.tertiaryContainer,
        ),
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('MMM dd, yyyy – hh:mm a').format(gameHistory.gameStartAt),
                    style: theme.themeText.subtitle1?.copyWith(
                      color: theme.colors.onTertiaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    color: theme.colors.onTertiaryContainer.withOpacity(0.1),
                    thickness: 2,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 8.toAutoScaledWidth,
                    spacing: 8.toAutoScaledWidth,
                    children: List.generate(
                      gameHistory.topPokerHand.cards.length,
                      (index) => CardPreview(
                        width: MediaQuery.of(context).size.width * 0.6 / gameHistory.topPokerHand.cards.length,
                        card: gameHistory.topPokerHand.sortedCards[index],
                        userCards: gameHistory.userSelectedCards,
                        houseCards: gameHistory.openHouseCards,
                        theme: theme,
                      ),
                    ),
                  ),
                  8.toAutoScaledHeight.toVerticalSizedBox,
                  Text(
                    'Best Rank: ${gameHistory.topPokerHand.evaluateHand().name}',
                    style: theme.themeText.subtitle1?.copyWith(
                      color: theme.colors.warning,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  2.toAutoScaledHeight.toVerticalSizedBox,
                  Text(
                    'Round time: ${_formatElapsedTime(gameHistory.elapsedSeconds)}',
                    style: theme.themeText.caption?.copyWith(
                      color: theme.colors.onTertiaryContainer,
                    ),
                  ),
                  2.toAutoScaledHeight.toVerticalSizedBox,
                  Text(
                    'Score: ${gameHistory.score}',
                    style: theme.themeText.caption?.copyWith(
                      color: theme.colors.onTertiaryContainer,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    gameHistory.isUserWinner ? 'Won' : 'Lost',
                    style: TextStyle(
                      color: gameHistory.isUserWinner ? theme.colors.primary : theme.colors.error,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  4.toAutoScaledWidth.toHorizontalSizedBox,
                  Icon(
                    gameHistory.isUserWinner ? Icons.thumb_up : Icons.thumb_down,
                    color: gameHistory.isUserWinner ? theme.colors.primary : theme.colors.error,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
