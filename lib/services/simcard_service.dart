import 'package:get/get.dart';
import 'package:sim_data/sim_data.dart';

class SimCardService extends GetxService {
  bool _simCardStatus = false;

  Future<SimCardService> init() async {
    SimData simData = await SimDataPlugin.getSimData();
    if (simData.cards.isNotEmpty) {
      print("NOT EMPTY");
      _simCardStatus = true;
    }
    return this;
  }

  bool get isSimCardExist => _simCardStatus;
}
