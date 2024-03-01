import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';

class DummyChatScreen extends ConsumerStatefulWidget {
  const DummyChatScreen({super.key, required this.title, required this.onClose});

  final String title;
  final VoidCallback onClose;

  @override
  ConsumerState<DummyChatScreen> createState() => _DummyChatScreenState();
}

class _DummyChatScreenState extends ConsumerState<DummyChatScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(MyAppX.theme.current);
    return Container(
      color: theme.colors.secondary,
      child: Column(
        children: [
          Container(
            color: theme.colors.secondaryContainer,
            padding: EdgeInsets.symmetric(vertical: 8.toAutoScaledWidth),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.toAutoScaledWidth),
                  child: Text(
                    'Pokerface AI',
                    style: GoogleFonts.epilogue().copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: theme.colors.onSecondaryContainer,
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: widget.onClose,
                  icon: const Icon(Icons.close),
                  color: theme.colors.onSecondaryContainer,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
