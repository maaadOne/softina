import 'package:get/get.dart';

class SimCardService extends GetxService {
  String allowsVOIP = "";
  // SimData? _simData;

  Future<String> getSimCardStatus() async {
    print("Sim card statys: $allowsVOIP");
    return allowsVOIP;
  }
}
