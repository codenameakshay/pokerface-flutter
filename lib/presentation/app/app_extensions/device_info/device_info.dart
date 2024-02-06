part of '../app_extension.dart';

class DeviceDetails {
  DeviceDetails._();

  static final DeviceDetails _instance = DeviceDetails._();
  static DeviceDetails get instance => _instance;

  bool get isAndroid => Platform.isAndroid;
  bool get isIOS => Platform.isIOS;

  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  AndroidDeviceInfo? _androidDeviceInfo;
  AndroidDeviceInfo? get androidDeviceInfo => _androidDeviceInfo;

  IosDeviceInfo? _iosDeviceInfo;
  IosDeviceInfo? get iosDeviceInfo => _iosDeviceInfo;

  Future<AndroidDeviceInfo?> getAndroidDeviceInfo() async {
    if (isAndroid) {
      _androidDeviceInfo = await _deviceInfoPlugin.androidInfo;
      log('Manufacturer: ${_androidDeviceInfo?.manufacturer}', name: 'Android Device Info');
      log('Model: ${_androidDeviceInfo?.model}', name: 'Android Device Info');
      log('Version: ${_androidDeviceInfo?.version.release}', name: 'Android Device Info');
      log('SDK: ${_androidDeviceInfo?.version.sdkInt}', name: 'Android Device Info');
      log('Brand: ${_androidDeviceInfo?.brand}', name: 'Android Device Info');
      log('Device: ${_androidDeviceInfo?.device}', name: 'Android Device Info');
      // log('Board: ${_androidDeviceInfo?.board}', name: 'Android Device Info');
      // log('Security Patch: ${_androidDeviceInfo?.version.securityPatch}', name: 'Android Device Info');
      // log('Bootloader: ${_androidDeviceInfo?.bootloader}', name: 'Android Device Info');
      // log('Display: ${_androidDeviceInfo?.display}', name: 'Android Device Info');
      // log('Fingerprint: ${_androidDeviceInfo?.fingerprint}', name: 'Android Device Info');
      // log('Hardware: ${_androidDeviceInfo?.hardware}', name: 'Android Device Info');
      // log('Host: ${_androidDeviceInfo?.host}', name: 'Android Device Info');
      // log('ID: ${_androidDeviceInfo?.id}', name: 'Android Device Info');
      // log('Product: ${_androidDeviceInfo?.product}', name: 'Android Device Info');
      // log('Supported ABIs: ${_androidDeviceInfo?.supportedAbis}', name: 'Android Device Info');
      // log('Supported 32 bit ABIs: ${_androidDeviceInfo?.supported32BitAbis}', name: 'Android Device Info');
      // log('Supported 64 bit ABIs: ${_androidDeviceInfo?.supported64BitAbis}', name: 'Android Device Info');
      return _androidDeviceInfo;
    } else {
      return null;
    }
  }

  Future<IosDeviceInfo?> getIOSDeviceInfo() async {
    if (isIOS) {
      return _iosDeviceInfo = await _deviceInfoPlugin.iosInfo;
    } else {
      return null;
    }
  }
}
