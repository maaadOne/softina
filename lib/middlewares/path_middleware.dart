import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softina/services/device_status_service.dart';
import 'package:softina/services/path_service.dart';

import '../routes/app_routes.dart';

class PathMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final deviceService = Get.find<DeviceStatuService>();
    final pathService = Get.find<PathService>();

    if (pathService.getCurrentPath == "" || deviceService.isGoogleDevice) {
      return const RouteSettings(name: Routes.NEWS);
    }
    return null;
  }
}
