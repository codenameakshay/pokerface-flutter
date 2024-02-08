import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';

@RoutePage(name: 'BlankRoute')
class BlankView extends ConsumerStatefulWidget {
  const BlankView({super.key, this.onInit});

  final Future<dynamic> Function()? onInit;

  @override
  ConsumerState<BlankView> createState() => _BlankViewState();
}

class _BlankViewState extends ConsumerState<BlankView> {
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        widget.onInit?.call().then(
              (value) => MyAppX.router.pop(value),
            );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(MyAppX.theme.current);
    return Scaffold(
      body: ColoredBox(
        color: theme.colors.background,
      ),
    );
  }
}
