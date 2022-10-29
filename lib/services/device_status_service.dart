import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceStatuService extends GetxService {
  bool _isGoogleDevice = false;

  Future<bool> getDeviceStatuStatus() async {
    var deviceInfoPlugin = DeviceInfoPlugin();
    var deviceInfo = await deviceInfoPlugin.androidInfo;
    if (deviceInfo.manufacturer!.contains("google")) {
      _isGoogleDevice = true;
      return _isGoogleDevice;
    }
    return _isGoogleDevice;
  }

  bool get isGoogleDevice => _isGoogleDevice;
}
