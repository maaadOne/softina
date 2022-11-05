import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';
import 'package:get/get.dart';

class SimCardService extends GetxService {
  bool _simCardStatus = true;

  Future<SimCardService> init() async {
    String? platformVersion = await FlutterSimCountryCode.simCountryCode;
    if (platformVersion!.length != 2) {
      _simCardStatus = false;
    }
    return this;
  }

  bool get isSimCardExist => _simCardStatus;
}
