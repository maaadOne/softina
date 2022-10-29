import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';

// service to check device manufacturer
class DeviceStatuService extends GetxService {
  bool _isGoogleDevice = false;

  Future<DeviceStatuService> init() async {
    var deviceInfoPlugin = DeviceInfoPlugin();
    var deviceInfo = await deviceInfoPlugin.androidInfo;
    if (deviceInfo.manufacturer!.contains("google")) {
      _isGoogleDevice = true;
    }
    return this;
  }

  bool get isGoogleDevice => _isGoogleDevice;
}
