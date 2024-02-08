import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

class ShakeDetectorWidget extends StatefulWidget {
  const ShakeDetectorWidget({super.key, required this.child, required this.onShake});

  final Widget child;
  final VoidCallback onShake;

  @override
  ShakeDetectorWidgetState createState() => ShakeDetectorWidgetState();
}

class ShakeDetectorWidgetState extends State<ShakeDetectorWidget> {
  // Threshold for considering an event as a shake. Adjust as needed.
  final double shakeThresholdGravity = 25;
  StreamSubscription<AccelerometerEvent>? _streamSubscription;
  DateTime? lastShakeTime;

  @override
  void initState() {
    super.initState();
    startListening();
  }

  void startListening() {
    _streamSubscription = accelerometerEvents.listen((AccelerometerEvent event) {
      double x = event.x;
      double y = event.y;
      double z = event.z;

      // Calculate total acceleration vector
      double gForce = sqrt(x * x + y * y + z * z);

      if (gForce > shakeThresholdGravity) {
        var now = DateTime.now();
        // Ignore shakes too close to each other (500ms)
        if (lastShakeTime == null || now.difference(lastShakeTime!) > const Duration(milliseconds: 500)) {
          lastShakeTime = now;
          onShake();
        }
      }
    });
  }

  void onShake() {
    // Implement your shake action here.
    widget.onShake();
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
