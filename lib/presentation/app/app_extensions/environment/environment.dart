part of '../app_extension.dart';

class Environment {
  Environment._();

  static final Environment _instance = Environment._();
  static Environment get instance => _instance;

  String get googleGenerativeAIKey => dotenv.env['GOOGLE_GENERATIVE_AI_KEY']!;
}
