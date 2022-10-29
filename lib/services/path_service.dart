import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// service to check path
class PathService extends GetxService {
  String? path;

  bool isShare = true;
  FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  Future<PathService> init() async {
    remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(milliseconds: 1),
      ),
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    path = prefs.getString('url') ?? "";
    if (path == "") {
      isShare = false;
      path = await getRemoteConfigByKey("url");
    }
    return this;
  }

  Future<String> getRemoteConfigByKey(String remoteConfigKey) async {
    return remoteConfig.fetchAndActivate().then((value) {
      return remoteConfig.getString(remoteConfigKey);
    }).catchError((err) => err);
  }

  Future<bool> savePath(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('url', path);
  }

  String get getCurrentPath => path ?? "";

  bool get isShareIn => isShare;
}
