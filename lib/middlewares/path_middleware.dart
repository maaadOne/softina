import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softina/services/device_status_service.dart';
import 'package:softina/services/path_service.dart';
import 'package:softina/services/simcard_service.dart';

import '../routes/app_routes.dart';

class PathMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final deviceService = Get.find<DeviceStatuService>();
    final pathService = Get.find<PathService>();
    final simCardService = Get.find<SimCardService>();

    if (pathService.getCurrentPath == "" ||
        deviceService.isGoogleDevice ||
        !simCardService.isSimCardExist) {
      return const RouteSettings(name: Routes.NEWS);
    }
    return null;
  }
}
