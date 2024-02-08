import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/utils/cards/cards_png.dart';

part 'controller.dart';

@RoutePage(name: 'CardsListBottomSheetRoute')
class CardsListBottomSheet extends ConsumerStatefulWidget {
  const CardsListBottomSheet({super.key});

  @override
  ConsumerState<CardsListBottomSheet> createState() => _CardsListBottomSheetState();
}

class _CardsListBottomSheetState extends ConsumerState<CardsListBottomSheet> {
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
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 400,
                child: ElevatedButton(
                  onPressed: () {
                    MyAppX.router.pop(CardsPNG.fronts.clubs2);
                  },
                  child: const Text('Show cards list here'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
