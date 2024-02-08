import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';

part 'controller.dart';

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
            color: theme.colors.onBackground,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 0,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    MyAppX.router.pop();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
