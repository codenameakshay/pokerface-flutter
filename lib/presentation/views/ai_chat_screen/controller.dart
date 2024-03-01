part of 'view.dart';

List<String> userActions = [
  'How can I win?',
  'What are my cards?',
  'What are the house cards?',
  'What are the hand ranks?'
];

class _VSControllerParams extends Equatable {
  const _VSControllerParams({
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
  List<Object> get props => [];
}

final _paramsProvider = Provider<_VSControllerParams>((ref) {
  // Throwing an error, as params are not yet instantiated. Overriding this in the view.
  throw UnimplementedError();
});

final _vsProvider =
    StateNotifierProvider.autoDispose.family<_VSController, _ViewState, _VSControllerParams>((ref, params) {
  final stateController = _VSController(
    params: params,
  )..initState();

  return stateController;
});

class _ViewState {
  _ViewState({
    required this.history,
    required this.model,
    required this.chat,
    required this.loading,
  });

  final List<Content> history;
  final GenerativeModel? model;
  final ChatSession? chat;
  final LoadingState loading;

  _ViewState.initial()
      : this(
          history: [],
          model: null,
          chat: null,
          loading: LoadingState.init,
        );

  _ViewState copyWith({
    List<Content>? history,
    GenerativeModel? model,
    ChatSession? chat,
    LoadingState? loading,
  }) {
    return _ViewState(
      history: history ?? this.history,
      model: model ?? this.model,
      chat: chat ?? this.chat,
      loading: loading ?? this.loading,
    );
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController({
    required this.params,
  }) : super(_ViewState.initial());
  _VSControllerParams params;

  ScrollController scrollController = ScrollController();
  TextEditingController textController = TextEditingController();
  FocusNode textFieldFocus = FocusNode();
  StreamSubscription<GenerateContentResponse>? responseStreamSubscription;

  void initState() {
    final model = GenerativeModel(
      model: 'gemini-pro',
      // apiKey: MyAppX.environment.googleGenerativeAIKey,
      apiKey: "AIzaSyASEfQyORNkLD3PZqvWLyaWhVs05Ov4wGs",
    );
    final chat = model.startChat();
    state = state.copyWith(
      model: model,
      chat: chat,
      loading: LoadingState.init,
      history: params.initialHistory,
    );
  }

  void hideKeyboard() {
    textFieldFocus.unfocus();
  }

  void scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  void sendChatMessage(String message, BuildContext context) {
    state = state.copyWith(loading: LoadingState.loading);

    try {
      var responseStream = state.chat?.sendMessageStream(Content(
        'user',
        [
          TextPart(params.inputPrompt),
          TextPart(message),
        ],
      ));
      var currentHistory = state.history;
      currentHistory.add(
        Content(
          'user',
          [
            TextPart(message),
          ],
        ),
      );
      state = state.copyWith(history: currentHistory);

      textController.clear();
      textFieldFocus.unfocus();
      scrollDown();

      responseStreamSubscription = responseStream?.listen((chunk) {
        // Process each chunk
        var text = chunk.text;
        if (text == null) {
          showError('No response from API.', context);
          return;
        } else {
          var currentHistory = state.history;
          var lastModelMessage = currentHistory.isNotEmpty
              ? currentHistory.last.role == 'model'
                  ? currentHistory.last
                  : null
              : null;
          if (lastModelMessage != null) {
            var newChatHistory = currentHistory.sublist(0, currentHistory.length - 1);
            final newModelMessage = Content(
              'model',
              [
                ...lastModelMessage.parts.whereType<TextPart>(),
                TextPart(text),
                // TextPart(lastModelMessage.parts.whereType<TextPart>().map<String>((e) => e.text).join('') + text),
              ],
            );
            newChatHistory.add(newModelMessage);
            state = state.copyWith(history: newChatHistory);
          } else {
            var currentHistory = state.history;
            currentHistory.add(
              Content(
                'model',
                [
                  TextPart(text),
                ],
              ),
            );
            state = state.copyWith(history: currentHistory);
          }
          scrollDown();
        }
      }, onDone: () {
        responseStreamSubscription?.cancel();
        state = state.copyWith(loading: LoadingState.success);
      }, onError: (error) {
        responseStreamSubscription?.cancel();
        showError(error.toString(), context);
        state = state.copyWith(loading: LoadingState.error);
      });
    } catch (e) {
      responseStreamSubscription?.cancel();
      showError(e.toString(), context);
      state = state.copyWith(loading: LoadingState.error);
    }
  }

  void showError(String message, BuildContext context) {
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
