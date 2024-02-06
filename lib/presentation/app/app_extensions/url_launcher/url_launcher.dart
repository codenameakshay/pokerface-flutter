// File for abstraction of all URL related methods, to make them easy to use
part of '../app_extension.dart';

class URLLauncher {
  URLLauncher._();

  static final URLLauncher _instance = URLLauncher._();
  static URLLauncher get instance => _instance;

  Future<void> launchURL(String url) async {
    try {
      final urlUri = Uri.parse(url);
      // if (await canLaunchUrl(urlUri)) {
      await launchUrl(
        urlUri,
        mode: LaunchMode.externalApplication,
      );
      // } else {
      //   MyAppX.showBottomToast(type: ToastType.failure, message: 'Could not launch $url');
      // }
    } catch (e, s) {
      MyAppX.showBottomToast(type: ToastType.failure, message: 'Could not launch $url');
      log(e.toString(), stackTrace: s);
    }
  }
}
