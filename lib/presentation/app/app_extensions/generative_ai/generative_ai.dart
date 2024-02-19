part of '../app_extension.dart';

class GenerativeAI {
  GenerativeAI._();

  static final GenerativeAI _instance = GenerativeAI._();
  static GenerativeAI get instance => _instance;

  GenerativeModel? model;

  void init() {
    model = GenerativeModel(model: 'gemini-pro', apiKey: MyAppX.environment.googleGenerativeAIKey);
  }

  Future<GenerateContentResponse?> generateText(String input) async {
    const prompt = 'Do these look store-bought or homemade?';
    final content = [
      Content.text(prompt),
      Content.text(input),
    ];

    final response = await model?.generateContent(content);
    print(response?.text);
    return response;
  }
}
