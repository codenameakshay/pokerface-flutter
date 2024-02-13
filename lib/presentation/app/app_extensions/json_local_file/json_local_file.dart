part of '../app_extension.dart';

class JSONLocalFile {
  JSONLocalFile._();

  static final JSONLocalFile _instance = JSONLocalFile._();
  static JSONLocalFile get instance => _instance;

  Future<String> getLocalFile(BuildContext context, String filePath) async {
    final jsonString = await DefaultAssetBundle.of(context).loadString(filePath);

    return jsonString;
  }
}
