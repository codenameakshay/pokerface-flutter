part of '../../app_extension.dart';

class MyAppTransitionBuilders {
  static const RouteTransitionsBuilder none = _none;

  static Widget _none(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }

  static const RouteTransitionsBuilder slideBottom = _slideBottom;

  static Widget _slideBottom(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          curve: const Cubic(0.06, 1.05, 1, 1),
          parent: animation,
        ),
      ),
      child: child,
    );
  }

  static const RouteTransitionsBuilder iOSDialog = _iOSDialog;

  static Widget _iOSDialog(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return CupertinoFullscreenDialogTransition(
      primaryRouteAnimation: animation,
      secondaryRouteAnimation: secondaryAnimation,
      linearTransition: false,
      child: child,
    );
  }

  static const RouteTransitionsBuilder zoomIn = _zoomIn;

  static Widget _zoomIn(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final curve = CurvedAnimation(
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeOutCubic,
      parent: animation,
    );
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(curve),
      child: FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(curve),
        child: ScaleTransition(
          scale: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(curve),
          child: child,
        ),
      ),
    );
  }
}
