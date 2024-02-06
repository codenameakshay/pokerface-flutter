import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';

class Clickable extends StatefulWidget {
  const Clickable({
    super.key,
    required this.child,
    this.onPressed,
    this.onLongPress,
    this.enabled = true,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final bool enabled;

  @override
  State<Clickable> createState() => _ClickableState();
}

class _ClickableState extends State<Clickable> with TickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      reverseDuration: const Duration(milliseconds: 90),
    );

    opacityAnimation = Tween<double>(
      begin: 1,
      end: 0.5,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linearToEaseOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.enabled
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () async {
              if (MyAppX.device.isAndroid) {
                await Feedback.forTap(context);
              } else if (MyAppX.device.isIOS) {
                await HapticFeedback.lightImpact();
              }
              await animationController.forward();
              widget.onPressed?.call();
              await animationController.reverse();
            },
            onTapCancel: animationController.reverse,
            onTapDown: (tapDownDetails) {
              if (MyAppX.device.isAndroid) {
                Feedback.forTap(context);
              } else if (MyAppX.device.isIOS) {
                HapticFeedback.selectionClick();
              }
              animationController.forward();
            },
            onTapUp: (tapUpDetails) {
              animationController.reverse();
            },
            onLongPressStart: (longPressStartDetails) {
              animationController.forward();
            },
            onLongPress: () {
              if (MyAppX.device.isAndroid) {
                Feedback.forLongPress(context);
              } else if (MyAppX.device.isIOS) {
                HapticFeedback.mediumImpact();
              }
              widget.onLongPress?.call();
              animationController.reverse();
            },
            child: FadeTransition(
              opacity: opacityAnimation,
              child: widget.child,
            ),
          )
        : widget.child;
  }

  @override
  void dispose() {
    if (mounted) {
      animationController.dispose();
    }
    super.dispose();
  }
}
