import 'package:get/get.dart';
// import 'package:sim_info/sim_info.dart';

class SimCardService extends GetxService {
  String allowsVOIP = "";
  // SimData? _simData;

  Future<String> getSimCardStatus() async {
    // var status = await Permission.phone.status;
    // allowsVOIP = await SimInfo.getAllowsVOIP;
    print("Sim card statys: $allowsVOIP");
    return allowsVOIP;
  }
}
