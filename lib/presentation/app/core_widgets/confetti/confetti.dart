import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokerface/gen/assets.gen.dart';

// Confetti widget

enum ConfettiType { celebrate, snow }

typedef ConfettiDismissCallback = void Function();

class ConfettiAction {
  const ConfettiAction({
    required this.child,
  });
  final Widget child;
}

class ConfettiDetails {
  const ConfettiDetails({
    required this.type,
    this.duration,
    this.onDismissed,
  });
  final ConfettiType type;
  final ConfettiDismissCallback? onDismissed;

  final Duration? duration;
}

abstract class ConfettiStateListener {
  Future<void> showConfetti(ConfettiDetails details);

  Future<void> hideConfetti();

  bool get isVisible;
}

class ConfettiController {
  static final ConfettiController shared = ConfettiController();

  ConfettiStateListener? listener;

  void addListener(ConfettiStateListener listener) {
    this.listener = listener;
  }

  bool get isVisible => listener?.isVisible ?? false;

  void showConfettiView({
    ConfettiType type = ConfettiType.celebrate,
    bool dismissible = true,
    Duration? duration = const Duration(seconds: 5),
    ConfettiDismissCallback? onDismissed,
  }) {
    final confettiDetails = ConfettiDetails(
      type: type,
      duration: duration,
      onDismissed: onDismissed,
    );
    listener?.hideConfetti();
    listener?.showConfetti(confettiDetails);
  }

  Future<void> hideConfettiView() async {
    await listener?.hideConfetti();
  }

  void showSnowView({
    ConfettiType type = ConfettiType.snow,
    bool dismissible = true,
    Duration? duration = const Duration(seconds: 5),
    ConfettiDismissCallback? onDismissed,
  }) {
    final confettiDetails = ConfettiDetails(
      type: type,
      duration: duration,
      onDismissed: onDismissed,
    );
    listener?.hideConfetti();
    listener?.showConfetti(confettiDetails);
    Future.delayed(const Duration(seconds: 5), () {
      listener?.hideConfetti();
    });
  }

  Future<void> hideSnowView() async {
    await listener?.hideConfetti();
  }
}

class ConfettiProvider extends StatefulWidget {
  const ConfettiProvider({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  State<ConfettiProvider> createState() => _ConfettiProviderState();
}

class _ConfettiProviderState extends State<ConfettiProvider>
    with TickerProviderStateMixin
    implements ConfettiStateListener {
  ConfettiDetails? confettiDetails;
  Timer? timer;

  bool isDisposed = false;

  late AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(
      seconds: 5,
    ),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    isDisposed = true;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ConfettiController.shared.listener = this;

    return Material(
      child: Stack(
        children: [
          if (widget.child != null) widget.child!,
          if (confettiDetails != null)
            IgnorePointer(
              child: AnimatedConfetti(
                confettiDetails: confettiDetails!,
                controller: controller,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Future<void> showConfetti(ConfettiDetails details) async {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        setState(() {
          confettiDetails = details;
        });

        await controller.forward();

        final duration = confettiDetails?.duration;

        if (duration != null) {
          timer?.cancel();
          timer = Timer.periodic(
            duration,
            (timer) {
              hideConfetti();
            },
          );
        }
      },
    );
  }

  @override
  Future<void> hideConfetti({bool animated = true}) async {
    if (!isDisposed) {
      timer?.cancel();
      controller.reset();
      setState(() {
        confettiDetails = null;
      });
    }
  }

  @override
  bool get isVisible => throw UnimplementedError();
}

class AnimatedConfetti extends StatelessWidget {
  const AnimatedConfetti({
    super.key,
    required this.confettiDetails,
    required this.controller,
  });
  final ConfettiDetails confettiDetails;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover,
          child: Lottie.asset(
            getConfettiByType(),
            repeat: false,
            controller: controller,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  String getConfettiByType() {
    /// it is a default value
    String? confettiFilePath = Assets.lotties.confetti;

    if (confettiDetails.type == ConfettiType.celebrate) {
      confettiFilePath = Assets.lotties.confetti;
    } else if (confettiDetails.type == ConfettiType.snow) {
      confettiFilePath = Assets.lotties.snow;
    }

    return confettiFilePath;
  }
}
