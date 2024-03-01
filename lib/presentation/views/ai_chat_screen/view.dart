import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/utils/state/state.dart';

part 'controller.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({
    super.key,
    required this.title,
    required this.onClose,
    required this.initialHistory,
    required this.inputPrompt,
  });

  final String title;
  final Function(List<Content> history) onClose;
  final List<Content> initialHistory;
  final String inputPrompt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(MyAppX.theme.current);
    final params = _VSControllerParams(
      title: title,
      onClose: onClose,
      initialHistory: initialHistory,
      inputPrompt: inputPrompt,
    );

    final state = ref.watch(_vsProvider(params));

    return ProviderScope(
      overrides: [
        _paramsProvider.overrideWithValue(params),
      ],
      child: Container(
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
                      params.title,
                      style: GoogleFonts.epilogue().copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: theme.colors.onSecondaryContainer,
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => params.onClose(state.history),
                    icon: const Icon(Icons.close),
                    color: theme.colors.onSecondaryContainer,
                  ),
                ],
              ),
            ),
            const Expanded(
              child: ChatWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatWidget extends ConsumerWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = ref.watch(_paramsProvider);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.watch(_vsProvider(params).notifier);

    var textFieldDecoration = InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      hintStyle: GoogleFonts.inter().copyWith(
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      hintText: 'Enter your doubt...',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.toAutoScaledWidth),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.toAutoScaledWidth),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: MyAppX.environment.googleGenerativeAIKey.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: stateController.hideKeyboard,
                    child: ListView.builder(
                      controller: stateController.scrollController,
                      itemBuilder: (context, idx) {
                        var content = state.history[idx];
                        var text = content.parts.whereType<TextPart>().map<String>((e) => e.text).join('');
                        return MessageWidget(
                          text: text,
                          isFromUser: content.role == 'user',
                        );
                      },
                      itemCount: state.history.length,
                    ),
                  ),
                )
              : ListView(
                  children: const [
                    Text('No API key found. Please provide an API Key.'),
                  ],
                ),
        ),
        Column(
          children: [
            SizedBox(
              height: 48.toAutoScaledHeight,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.toAutoScaledWidth,
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) => ActionChip(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.toAutoScaledWidth,
                  ),
                  color: MaterialStateColor.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5);
                    }
                    return Theme.of(context).colorScheme.secondaryContainer;
                  }),
                  label: Text(
                    userActions[index],
                    style: GoogleFonts.inter().copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                  onPressed: () {
                    stateController.sendChatMessage(userActions[index], context);
                  },
                ),
                scrollDirection: Axis.horizontal,
                itemCount: userActions.length,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16.toAutoScaledWidth,
                right: 16.toAutoScaledWidth,
                bottom: 16.toAutoScaledWidth,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      focusNode: stateController.textFieldFocus,
                      decoration: textFieldDecoration,
                      controller: stateController.textController,
                      style: GoogleFonts.inter().copyWith(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      onSubmitted: (String value) {
                        stateController.sendChatMessage(value, context);
                      },
                    ),
                  ),
                  const SizedBox.square(
                    dimension: 15,
                  ),
                  if (state.loading != LoadingState.loading)
                    IconButton(
                      onPressed: () async {
                        stateController.sendChatMessage(stateController.textController.text, context);
                      },
                      icon: Icon(
                        Icons.send,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    )
                  else
                    CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MessageWidget extends StatelessWidget {
  final String text;
  final bool isFromUser;

  const MessageWidget({
    super.key,
    required this.text,
    required this.isFromUser,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            decoration: BoxDecoration(
              color:
                  isFromUser ? Theme.of(context).colorScheme.tertiary : Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.toAutoScaledWidth),
                topRight: Radius.circular(8.toAutoScaledWidth),
                bottomLeft: isFromUser ? Radius.circular(8.toAutoScaledWidth) : const Radius.circular(0),
                bottomRight: isFromUser ? const Radius.circular(0) : Radius.circular(8.toAutoScaledWidth),
              ),
              border: Border.all(
                color: isFromUser
                    ? Theme.of(context).colorScheme.tertiaryContainer
                    : Theme.of(context).colorScheme.tertiary,
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 8.toAutoScaledWidth,
              horizontal: 16.toAutoScaledWidth,
            ),
            margin: const EdgeInsets.only(bottom: 8),
            child: MarkdownBody(
              selectable: true,
              data: text,
              styleSheet: MarkdownStyleSheet(
                p: TextStyle(
                  fontFamily: GoogleFonts.inter().fontFamily,
                  color: isFromUser
                      ? Theme.of(context).colorScheme.onTertiary
                      : Theme.of(context).colorScheme.onTertiaryContainer,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
