import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/utils/event_broker/event_broker.dart';

enum ToastType { success, failure, warning }

typedef ToastActionable = void Function();

typedef ToastDismissCallback = void Function();

class ToastAction {
  const ToastAction({
    this.text,
    this.child,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  }) : assert(text != null || child != null, 'Either text or child must be provided');

  final String? text;
  final Widget? child;
  final ToastActionable onPressed;
  final Color? textColor;
  final Color? backgroundColor;
}

class ToastDetails extends Equatable {
  const ToastDetails({
    required this.message,
    required this.type,
    this.messageStyle,
    this.spacingBetweenActions,
    this.leadingAction,
    this.trailingAction,
    this.duration,
    this.persistent = false,
    this.onDismissed,
    this.overrideDismiss = false,
  });
  final String message;
  final ToastType type;

  final TextStyle? messageStyle;
  final double? spacingBetweenActions;
  final ToastAction? leadingAction;
  final ToastAction? trailingAction;

  final ToastDismissCallback? onDismissed;

  final Duration? duration;

  final bool persistent;
  final bool overrideDismiss;

  @override
  List<Object?> get props => [message, type];

  bool get isDismissible {
    late bool isDismissible;

    if (leadingAction != null || trailingAction != null) {
      isDismissible = false;
    } else {
      if (persistent) {
        isDismissible = false;
      } else {
        isDismissible = true;
      }
    }

    if (overrideDismiss) {
      isDismissible = true;
    }

    return isDismissible;
  }
}

class ShowToast extends EventX {
  ShowToast({
    required this.details,
  });
  final ToastDetails details;
}

class HideToast extends EventX {
  HideToast({
    this.animated = true,
  });
  final bool animated;
}

class ShowBottomToast extends EventX {
  ShowBottomToast({
    required this.details,
  });
  final ToastDetails details;
}

class HideBottomToast extends EventX {
  HideBottomToast({
    this.animated = true,
  });
  final bool animated;
}

class ToastController {
  static final ToastController shared = ToastController();

  void showToast({
    required String message,
    bool persistent = false,
    ToastType type = ToastType.success,
    ToastAction? leadingAction,
    ToastAction? trailingAction,
    double? spacingBetweenActions,
    Duration? duration,
    ToastDismissCallback? onDismissed,
    bool overrideDismiss = false,
  }) {
    final notificationDetails = ToastDetails(
      message: message,
      type: type,
      leadingAction: leadingAction,
      trailingAction: trailingAction,
      spacingBetweenActions: spacingBetweenActions,
      duration: duration,
      persistent: persistent,
      onDismissed: onDismissed,
      overrideDismiss: overrideDismiss,
    );

    EventBrokerX.shared.emitEvent(
      ShowToast(
        details: notificationDetails,
      ),
    );
  }

  Future<void> hideToast() async {
    EventBrokerX.shared.emitEvent(
      HideToast(),
    );
  }

  void showBottomToast({
    required String message,
    bool persistent = false,
    ToastType type = ToastType.success,
    ToastAction? leadingAction,
    ToastAction? trailingAction,
    double? spacingBetweenActions,
    Duration? duration,
    ToastDismissCallback? onDismissed,
    bool overrideDismiss = false,
  }) {
    final notificationDetails = ToastDetails(
      message: message,
      type: type,
      leadingAction: leadingAction,
      trailingAction: trailingAction,
      spacingBetweenActions: spacingBetweenActions,
      duration: duration,
      persistent: persistent,
      onDismissed: onDismissed,
      overrideDismiss: overrideDismiss,
    );

    EventBrokerX.shared.emitEvent(
      ShowBottomToast(
        details: notificationDetails,
      ),
    );
  }

  Future<void> hideBottomToast() async {
    EventBrokerX.shared.emitEvent(
      HideBottomToast(),
    );
  }
}

class ToastProvider extends StatefulWidget {
  const ToastProvider({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  State<ToastProvider> createState() => _ToastProviderState();
}

class _ToastProviderState extends State<ToastProvider>
    with TickerProviderStateMixin, KeepAliveEventListenerMixin
    implements EventListener {
  ToastDetails? notificationDetails;
  ToastDetails? bottomNotificationDetails;

  Timer? timer;
  Timer? bottomTimer;

  late AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 120,
    ),
    reverseDuration: const Duration(
      milliseconds: 80,
    ),
  );

  late AnimationController bottomController = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 120,
    ),
    reverseDuration: const Duration(
      milliseconds: 80,
    ),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    EventBrokerX.shared.addListener(this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          if (widget.child != null) widget.child!,
          if (notificationDetails != null)
            AnimatedToast(
              controller: controller,
              notificationDetails: notificationDetails!,
            ),
          if (bottomNotificationDetails != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedBottomToast(
                bottomController: bottomController,
                notificationDetails: bottomNotificationDetails!,
              ),
            ),
        ],
      ),
    );
  }

  @override
  String get identifier => (ToastProvider).toString();

  @override
  void onEvent(EventX event) {
    log('[Toast.onEvent] event.runtimeType : ${event.runtimeType}');

    if (event is ShowToast) {
      _showToast(
        event.details,
      );
    }

    if (event is HideToast) {
      _hideToast(
        animated: event.animated,
      );
    }

    if (event is ShowBottomToast) {
      _showBottomToast(
        event.details,
      );
    }

    if (event is HideBottomToast) {
      _hideBottomToast(
        animated: event.animated,
      );
    }
  }

  Future<void> _showToast(ToastDetails details) async {
    // If a notification is already being presented, dismiss it first
    if (notificationDetails != null) {
      await _hideToast();
    }

    // Update notification details to latest value
    setState(() {
      notificationDetails = details;
    });

    // Show the notification animatedly
    await controller.forward();

    // Set up a dismiss timer if required (i.e. when is NOT an actionable notification)
    _setUpDismissTimerIfRequired(details);
  }

  Future<void> _hideToast({bool animated = true}) async {
    timer?.cancel(); // Very important. Without cancelling previous timer, a race condition may arise.

    if (animated) {
      // If animated, then dismiss the notification gracefully with animations
      await controller.reverse();

      notificationDetails?.onDismissed?.call();
    } else {
      // Abruptly dismiss the notification
      controller.reset();
    }

    // Clear the dismissed notification's details
    setState(
      () {
        notificationDetails = null;
      },
    );
  }

  Future<void> _showBottomToast(ToastDetails details) async {
    // If a notification is already being presented, dismiss it first
    if (bottomNotificationDetails != null) {
      await _hideBottomToast();
    }

    // Update notification details to latest value
    setState(() {
      bottomNotificationDetails = details;
    });

    // Show the notification animatedly
    await bottomController.forward();

    // Set up a dismiss timer if required (i.e. when is NOT an actionable notification)
    _setUpDismissTimerIfRequiredBottom(details);
  }

  Future<void> _hideBottomToast({bool animated = true}) async {
    bottomTimer?.cancel(); // Very important. Without cancelling previous timer, a race condition may arise.

    if (animated) {
      // If animated, then dismiss the notification gracefully with animations
      await bottomController.reverse();

      bottomNotificationDetails?.onDismissed?.call();
    } else {
      // Abruptly dismiss the notification
      bottomController.reset();
    }

    // Clear the dismissed notification's details
    setState(
      () {
        bottomNotificationDetails = null;
      },
    );
  }

  void _setUpDismissTimerIfRequired(ToastDetails details) {
    final dismissDuration = () {
      late final Duration duration;

      if (details.duration != null) {
        duration = details.duration!;
      } else {
        final isSmallNotificationText = details.message.length <= 40;

        if (isSmallNotificationText) {
          duration = const Duration(milliseconds: 3000);
        } else {
          duration = const Duration(milliseconds: 4500);
        }
      }

      return duration;
    }();

    if (details.isDismissible) {
      timer?.cancel();
      timer = Timer(
        dismissDuration,
        _hideToast,
      );
    } else {
      // No need to set timer as this is a non-dismissible notification
    }
  }

  void _setUpDismissTimerIfRequiredBottom(ToastDetails details) {
    final dismissDuration = () {
      late final Duration duration;

      if (details.duration != null) {
        duration = details.duration!;
      } else {
        final isSmallNotificationText = details.message.length <= 40;

        if (isSmallNotificationText) {
          duration = const Duration(milliseconds: 3000);
        } else {
          duration = const Duration(milliseconds: 4500);
        }
      }

      return duration;
    }();

    if (details.isDismissible) {
      bottomTimer?.cancel();
      bottomTimer = Timer(
        dismissDuration,
        _hideBottomToast,
      );
    } else {
      // No need to set timer as this is a non-dismissible notification
    }
  }
}

class AnimatedToast extends AnimatedWidget {
  const AnimatedToast({
    super.key,
    required AnimationController controller,
    required this.notificationDetails,
  }) : super(listenable: controller);
  final ToastDetails notificationDetails;

  Animation<Offset> get offset => Tween<Offset>(
        begin: const Offset(
          0,
          -1,
        ),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: listenable as Animation<double>,
          curve: const Cubic(0.21, 1.12, 1, 1),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final leadingAction = notificationDetails.leadingAction;
    final trailingAction = notificationDetails.trailingAction;
    final spacingBetweenActions = notificationDetails.spacingBetweenActions;

    return Consumer(
      builder: (context, ref, child) {
        final currentTheme = ref.watch(MyAppX.theme.current);

        return SlideTransition(
          position: offset,
          child: GestureDetector(
            onVerticalDragUpdate: (dragUpdate) {
              final dy = dragUpdate.delta.dy;
              final isVerticalUpSwipe = dy < 0.0;

              if (isVerticalUpSwipe) {
                if (dy < -5.0) {
                  if (notificationDetails.isDismissible) {
                    ToastController.shared.hideToast();
                  } else {
                    // Do nothing as this is a non dismissible notification
                  }
                }
              }
            },
            key: const Key('InAppNotifications'),
            child: Container(
              padding: EdgeInsets.all(
                20.toAutoScaledWidth,
              ),
              color: () {
                late final Color color;

                switch (notificationDetails.type) {
                  case ToastType.success:
                    color = currentTheme.colors.primary;
                    break;
                  case ToastType.failure:
                    color = currentTheme.colors.error;
                    break;
                  case ToastType.warning:
                    color = currentTheme.colors.warning;
                    break;
                }

                return color;
              }(),
              child: SafeArea(
                bottom: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildMessage(),
                    if (leadingAction != null || trailingAction != null)
                      const SizedBox(
                        height: 16,
                      ),
                    Row(
                      children: [
                        if (leadingAction != null)
                          Expanded(
                            child: _buildLeadingAction(leadingAction),
                          )
                        else
                          const Spacer(),
                        if (leadingAction != null && trailingAction != null)
                          SizedBox(
                            width: spacingBetweenActions ?? 20.toAutoScaledWidth,
                          ),
                        if (trailingAction != null)
                          Expanded(
                            child: _buildTrailingAction(trailingAction),
                          )
                        else
                          const Spacer(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMessage() => Consumer(
        builder: (context, ref, child) {
          final currentTheme = ref.watch(MyAppX.theme.current);

          return Text(
            notificationDetails.message,
            style: notificationDetails.messageStyle ??
                TextStyle(
                  color: currentTheme.colors.onPrimary,
                  fontSize: currentTheme.fontSizes.s13,
                  height: currentTheme.fontLineHeights.lh20 / currentTheme.fontSizes.s13,
                  fontWeight: currentTheme.fontWeights.wRegular,
                ),
            textAlign: TextAlign.start,
          );
        },
      );

  Widget _buildLeadingAction(ToastAction action) {
    final child = action.child;
    final text = action.text;
    final textColor = action.textColor;
    final bgColor = action.backgroundColor;

    return Consumer(
      builder: (context, ref, anotherChild) {
        final currentTheme = ref.watch(MyAppX.theme.current);

        return ElevatedButton(
          onPressed: action.onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: EdgeInsets.symmetric(
              horizontal: currentTheme.paddings.h10,
              vertical: currentTheme.paddings.v10,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                300,
              ),
            ),
            backgroundColor: bgColor ?? currentTheme.colors.secondaryContainer,
          ),
          child: child ??
              (text != null
                  ? Text(
                      text,
                      style: TextStyle(
                        color: textColor ?? currentTheme.colors.onSecondaryContainer,
                        fontSize: currentTheme.fontSizes.s13,
                        height: currentTheme.fontLineHeights.lh20 / currentTheme.fontSizes.s13,
                        fontWeight: currentTheme.fontWeights.wBold,
                      ),
                    )
                  : null),
        );
      },
    );
  }

  Widget _buildTrailingAction(ToastAction action) {
    final child = action.child;
    final text = action.text;
    final textColor = action.textColor;
    final bgColor = action.backgroundColor;

    return Consumer(
      builder: (context, ref, anotherChild) {
        final currentTheme = ref.watch(MyAppX.theme.current);

        return ElevatedButton(
          onPressed: action.onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: currentTheme.paddings.h10,
              vertical: currentTheme.paddings.v10,
            ),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                300.toAutoScaledWidth,
              ),
            ),
            backgroundColor: () {
              late final Color color;

              switch (notificationDetails.type) {
                case ToastType.success:
                  color = currentTheme.colors.primaryContainer;
                  break;
                case ToastType.failure:
                  color = currentTheme.colors.errorContainer;
                  break;
                case ToastType.warning:
                  color = currentTheme.colors.onWarning;
                  break;
              }

              return bgColor ?? color;
            }(),
          ),
          child: child ??
              (text != null
                  ? Text(
                      text,
                      style: TextStyle(
                        color: () {
                          late final Color color;

                          switch (notificationDetails.type) {
                            case ToastType.success:
                              color = currentTheme.colors.onPrimaryContainer;
                              break;
                            case ToastType.failure:
                              color = currentTheme.colors.onErrorContainer;
                              break;
                            case ToastType.warning:
                              color = currentTheme.colors.warning;
                              break;
                          }

                          return textColor ?? color;
                        }(),
                        fontSize: currentTheme.fontSizes.s13,
                        height: currentTheme.fontLineHeights.lh20 / currentTheme.fontSizes.s13,
                        fontWeight: currentTheme.fontWeights.wBold,
                      ),
                    )
                  : null),
        );
      },
    );
  }
}

class AnimatedBottomToast extends AnimatedWidget {
  const AnimatedBottomToast({
    super.key,
    required AnimationController bottomController,
    required this.notificationDetails,
  }) : super(listenable: bottomController);
  final ToastDetails notificationDetails;

  Animation<Offset> get offset => Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: listenable as Animation<double>,
          curve: const Cubic(0.21, 1.12, 1, 1),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final leadingAction = notificationDetails.leadingAction;
    final trailingAction = notificationDetails.trailingAction;
    final spacingBetweenActions = notificationDetails.spacingBetweenActions;

    return Consumer(
      builder: (context, ref, child) {
        final currentTheme = ref.watch(MyAppX.theme.current);

        return SlideTransition(
          position: offset,
          child: GestureDetector(
            onVerticalDragUpdate: (dragUpdate) {
              final dy = dragUpdate.delta.dy;
              final isVerticalDownSwipe = dy > 0.0;

              if (isVerticalDownSwipe) {
                if (dy > 5.0) {
                  if (notificationDetails.isDismissible) {
                    ToastController.shared.hideBottomToast();
                  } else {
                    // Do nothing as this is a non dismissible notification
                  }
                }
              }
            },
            key: const Key('InAppNotifications'),
            child: Container(
              padding: EdgeInsets.all(
                20.toAutoScaledWidth,
              ),
              color: () {
                late final Color color;

                switch (notificationDetails.type) {
                  case ToastType.success:
                    color = currentTheme.colors.primary;
                    break;
                  case ToastType.failure:
                    color = currentTheme.colors.error;
                    break;
                  case ToastType.warning:
                    color = currentTheme.colors.warning;
                    break;
                }

                return color;
              }(),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildMessage(),
                    if (leadingAction != null || trailingAction != null)
                      const SizedBox(
                        height: 16,
                      ),
                    Row(
                      children: [
                        if (leadingAction != null)
                          Expanded(
                            child: _buildLeadingAction(leadingAction),
                          )
                        else
                          const Spacer(),
                        if (leadingAction != null && trailingAction != null)
                          SizedBox(
                            width: spacingBetweenActions ?? 20.toAutoScaledWidth,
                          ),
                        if (trailingAction != null)
                          Expanded(
                            child: _buildTrailingAction(trailingAction),
                          )
                        else
                          const Spacer(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMessage() => Consumer(
        builder: (context, ref, child) {
          final currentTheme = ref.watch(MyAppX.theme.current);

          return Text(
            notificationDetails.message,
            style: notificationDetails.messageStyle ??
                TextStyle(
                  color: currentTheme.colors.onPrimary,
                  fontSize: currentTheme.fontSizes.s13,
                  height: currentTheme.fontLineHeights.lh20 / currentTheme.fontSizes.s13,
                  fontWeight: currentTheme.fontWeights.wRegular,
                ),
            textAlign: TextAlign.start,
          );
        },
      );

  Widget _buildLeadingAction(ToastAction action) {
    final child = action.child;
    final text = action.text;
    final textColor = action.textColor;
    final bgColor = action.backgroundColor;

    return Consumer(
      builder: (context, ref, anotherChild) {
        final currentTheme = ref.watch(MyAppX.theme.current);

        return ElevatedButton(
          onPressed: action.onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: EdgeInsets.symmetric(
              horizontal: currentTheme.paddings.h10,
              vertical: currentTheme.paddings.v10,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                300,
              ),
            ),
            backgroundColor: bgColor ?? currentTheme.colors.secondaryContainer,
          ),
          child: child ??
              (text != null
                  ? Text(
                      text,
                      style: TextStyle(
                        color: textColor ?? currentTheme.colors.onSecondaryContainer,
                        fontSize: currentTheme.fontSizes.s13,
                        height: currentTheme.fontLineHeights.lh20 / currentTheme.fontSizes.s13,
                        fontWeight: currentTheme.fontWeights.wBold,
                      ),
                    )
                  : null),
        );
      },
    );
  }

  Widget _buildTrailingAction(ToastAction action) {
    final child = action.child;
    final text = action.text;
    final textColor = action.textColor;
    final bgColor = action.backgroundColor;

    return Consumer(
      builder: (context, ref, anotherChild) {
        final currentTheme = ref.watch(MyAppX.theme.current);

        return ElevatedButton(
          onPressed: action.onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: currentTheme.paddings.h10,
              vertical: currentTheme.paddings.v10,
            ),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                300.toAutoScaledWidth,
              ),
            ),
            backgroundColor: () {
              late final Color color;

              switch (notificationDetails.type) {
                case ToastType.success:
                  color = currentTheme.colors.primaryContainer;
                  break;
                case ToastType.failure:
                  color = currentTheme.colors.errorContainer;
                  break;
                case ToastType.warning:
                  color = currentTheme.colors.onWarning;
                  break;
              }

              return bgColor ?? color;
            }(),
          ),
          child: child ??
              (text != null
                  ? Text(
                      text,
                      style: TextStyle(
                        color: () {
                          late final Color color;

                          switch (notificationDetails.type) {
                            case ToastType.success:
                              color = currentTheme.colors.onPrimaryContainer;
                              break;
                            case ToastType.failure:
                              color = currentTheme.colors.onErrorContainer;
                              break;
                            case ToastType.warning:
                              color = currentTheme.colors.warning;
                              break;
                          }

                          return textColor ?? color;
                        }(),
                        fontSize: currentTheme.fontSizes.s13,
                        height: currentTheme.fontLineHeights.lh20 / currentTheme.fontSizes.s13,
                        fontWeight: currentTheme.fontWeights.wBold,
                      ),
                    )
                  : null),
        );
      },
    );
  }
}
