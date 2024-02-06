import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';

class CtaClickable extends StatefulWidget {
  const CtaClickable({
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
  State<CtaClickable> createState() => _CtaClickableState();
}

class _CtaClickableState extends State<CtaClickable> with TickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> opacityAnimation;
  late final Animation<double> scaleAnimation;
  late final Animation<Offset> offsetAnimation;

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

    scaleAnimation = Tween<double>(
      begin: 1,
      end: 0.95,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linearToEaseOut,
      ),
    );

    offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 0.2),
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
            child: SlideTransition(
              position: offsetAnimation,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: FadeTransition(
                  opacity: opacityAnimation,
                  child: widget.child,
                ),
              ),
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
