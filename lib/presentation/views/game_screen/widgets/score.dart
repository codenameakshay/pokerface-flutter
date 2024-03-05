part of '../view.dart';

class _Score extends ConsumerWidget {
  const _Score({
    required this.params,
  });

  final _VSControllerParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);
    final stateController = ref.watch(_vsProvider(params).notifier);

    return Clickable(
      onPressed: () {
        // show alert dialog mentioning what is score? and the exact distribution of score
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('How is score calculated?'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Score is calculated based on the strength of the hand. The higher the score, the stronger the hand. Below is the distribution and the score for each hand type:',
                  style: GoogleFonts.inter().copyWith(
                    color: theme.colors.onBackground.withOpacity(0.5),
                    fontSize: 12.toAutoScaledFont,
                  ),
                ),
                8.toAutoScaledHeight.toVerticalSizedBox,
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: stateController.scoreDistribution.keys
                      .map(
                        (e) => TableRow(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: theme.colors.secondary.withOpacity(0.05),
                                width: 2,
                              ),
                            ),
                          ),
                          children: [
                            TableCell(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    e.toString(),
                                    style: GoogleFonts.inter().copyWith(
                                      color: theme.colors.onBackground.withOpacity(0.5),
                                      fontSize: 16.toAutoScaledFont,
                                    ),
                                  ),
                                  Text(
                                    stateController.scoreDistribution[e].toString(),
                                    style: GoogleFonts.inter().copyWith(
                                      color: theme.colors.onBackground.withOpacity(0.5),
                                      fontSize: 16.toAutoScaledFont,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
                8.toAutoScaledHeight.toVerticalSizedBox,
                Text(
                  'Total: ${stateController.score}',
                  style: GoogleFonts.inter().copyWith(
                    color: theme.colors.onBackground.withOpacity(0.7),
                    fontSize: 16.toAutoScaledFont,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.toAutoScaledWidth),
        child: Row(
          children: [
            Text(
              'Score:',
              style: GoogleFonts.inter().copyWith(
                color: theme.colors.onBackground.withOpacity(0.5),
                fontSize: 16.toAutoScaledFont,
              ),
            ),
            const Spacer(),
            Text(
              stateController.score.toString(),
              style: GoogleFonts.inter().copyWith(
                color: theme.colors.onBackground.withOpacity(0.5),
                fontSize: 16.toAutoScaledFont,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
