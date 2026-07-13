import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The optional "Should I call?" values (pot size and amount to call).
class CallInputs {
  const CallInputs({required this.pot, required this.toCall});

  final double pot;
  final double toCall;
}

/// Hands the optional pot/to-call values entered in the start sheet to the
/// freshly-opened game screen. The start sheet writes it; the game screen reads
/// it once when it builds. Overwritten on every new game.
final pendingCallInputsProvider = StateProvider<CallInputs?>((ref) => null);
