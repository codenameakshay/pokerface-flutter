import 'package:flutter/material.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';

class RouteDetectorWidget extends StatefulWidget {
  const RouteDetectorWidget({
    super.key,
    required this.child,
    required this.onHidden,
    required this.onShown,
  });

  final Widget child;
  final VoidCallback onHidden;
  final VoidCallback onShown;

  @override
  RouteDetectorWidgetState createState() => RouteDetectorWidgetState();
}

class RouteDetectorWidgetState extends State<RouteDetectorWidget> with RouteAware {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    MyAppX.pageRouteObserver.subscribe(this, ModalRoute.of(context) as PageRoute<dynamic>);
  }

  @override
  void didPushNext() {
    // Called when a new route is pushed, and this route is no longer visible
    widget.onHidden();
  }

  @override
  void didPopNext() {
    // Called when the top route is popped and this route is visible again
    widget.onShown();
  }

  @override
  void dispose() {
    MyAppX.pageRouteObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
