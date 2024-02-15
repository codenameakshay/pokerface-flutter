import 'package:flutter/material.dart';

class DefaultBoxShadow extends StatelessWidget {
  const DefaultBoxShadow({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 96,
            offset: const Offset(13.41, 45.05),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.0945),
            blurRadius: 60.96,
            offset: const Offset(9.29, 31.2),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.0773),
            blurRadius: 36.66,
            offset: const Offset(6.06, 20.36),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.0652),
            blurRadius: 20.94,
            offset: const Offset(3.63, 12.19),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.0548),
            blurRadius: 11.59,
            offset: const Offset(1.9, 6.38),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.0427),
            blurRadius: 6.44,
            offset: const Offset(0.78, 2.63),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.0255),
            blurRadius: 3.3,
            offset: const Offset(0.18, 0.6),
          ),
        ],
      ),
      child: child,
    );
  }
}
