import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key, required this.title, required this.onClose});

  final String title;
  final VoidCallback onClose;

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
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
          const Expanded(
            child: ChatWidget(),
          ),
        ],
      ),
    );
  }
}

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late final GenerativeModel _model;
  late final ChatSession _chat;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: MyAppX.environment.googleGenerativeAIKey,
    );
    _chat = _model.startChat();
  }

  void _hideKeyboard() {
    _textFieldFocus.unfocus();
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textFieldDecoration = InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      hintText: 'Enter a prompt...',
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: MyAppX.environment.googleGenerativeAIKey.isNotEmpty
                ? GestureDetector(
                    onTap: _hideKeyboard,
                    child: ListView.builder(
                      controller: _scrollController,
                      itemBuilder: (context, idx) {
                        var content = _chat.history.toList()[idx];
                        var text = content.parts.whereType<TextPart>().map<String>((e) => e.text).join('');
                        return MessageWidget(
                          text: text,
                          isFromUser: content.role == 'user',
                        );
                      },
                      itemCount: _chat.history.length,
                    ),
                  )
                : ListView(
                    children: const [
                      Text('No API key found. Please provide an API Key.'),
                    ],
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 15,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    autofocus: true,
                    focusNode: _textFieldFocus,
                    decoration: textFieldDecoration,
                    controller: _textController,
                    onSubmitted: (String value) {
                      _sendChatMessage(value);
                    },
                  ),
                ),
                const SizedBox.square(
                  dimension: 15,
                ),
                if (!_loading)
                  IconButton(
                    onPressed: () async {
                      _sendChatMessage(_textController.text);
                    },
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                else
                  const CircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _sendChatMessage(String message) async {
    setState(() {
      _loading = true;
    });

    try {
      var response = await _chat.sendMessage(
        Content.text(message),
      );
      var text = response.text;

      if (text == null) {
        _showError('No response from API.');
        return;
      } else {
        setState(() {
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      _textController.clear();
      setState(() {
        _loading = false;
      });
      _textFieldFocus.requestFocus();
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Something went wrong'),
          content: SingleChildScrollView(
            child: SelectableText(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )
          ],
        );
      },
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
              color: isFromUser
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            margin: const EdgeInsets.only(bottom: 8),
            child: MarkdownBody(
              selectable: true,
              data: text,
              styleSheet: MarkdownStyleSheet(
                p: TextStyle(
                  fontFamily: GoogleFonts.sourceCodePro().fontFamily,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
