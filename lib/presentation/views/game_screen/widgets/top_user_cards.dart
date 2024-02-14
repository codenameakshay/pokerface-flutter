part of '../view.dart';

class _TopUserCards extends ConsumerWidget {
  const _TopUserCards({
    required this.params,
  });

  final _VSControllerParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);
    final state = ref.watch(_vsProvider(params));

    return Positioned(
      top: 0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: ShapeDecoration(
          color: theme.colors.background,
          shape: DashedBorder(
            color: theme.colors.secondary.withOpacity(0.1),
            dashWidth: 12,
            dashSpace: 4,
            strokeWidth: 2,
            bottom: true,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.toAutoScaledHeight),
        child: SafeArea(
          bottom: false,
          child: Row(
            children: [
              32.toAutoScaledWidth.toHorizontalSizedBox,
              Row(
                children: params.userSelectedCards
                    .take(4)
                    .map(
                      (e) => Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Colors.black.withOpacity(0.1),
                                width: 2,
                              ),
                            ),
                            child: Text(
                              ' ${e.suit.emoji} ${e.rank.emoji} ',
                              style: theme.themeText.headline6?.copyWith(fontSize: 16.toAutoScaledFont),
                            ),
                          ),
                          8.toAutoScaledWidth.toHorizontalSizedBox,
                        ],
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
              for (final bulb in state.streetLight.bulbs) ...[
                4.toAutoScaledWidth.toHorizontalSizedBox,
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: bulb.isOn ? bulb.onColor : bulb.offColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: bulb.borderColor,
                      width: 2,
                    ),
                  ),
                ),
              ],
              32.toAutoScaledWidth.toHorizontalSizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
