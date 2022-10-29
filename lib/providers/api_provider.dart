// import 'package:get/get.dart';
// import '../../common/custom_trace.dart';

// mixin ApiClient {
//   // final globalService = Get.find<GlobalService>();
//   // final authService = Get.find<AuthService>();
//   String? baseUrl;

//   final Rx<String> _progress = Rx("");

//   String getBaseUrl(String path) {
//     if (!path.endsWith('/')) {
//       path += '/';
//     }
//     if (path.startsWith('/')) {
//       path = path.substring(1);
//     }
//     if (!baseUrl!.endsWith('/')) {
//       return '${baseUrl!}/$path';
//     }
//     return baseUrl! + path;
//   }

//   String getApiBaseUrl(String path) {
//     String _apiPath = "https://newsapi.org/v2/";
//     if (path.startsWith('/')) {
//       return getBaseUrl(_apiPath) + path.substring(1);
//     }
//     return getBaseUrl(_apiPath) + path;
//   }

//   Uri getApiBaseUri(String path) {
//     return Uri.parse(getApiBaseUrl(path));
//   }

//   Uri getBaseUri(String path) {
//     return Uri.parse(getBaseUrl(path));
//   }

//   void printUri(StackTrace stackTrace, Uri uri) {
//     Get.log(CustomTrace(stackTrace, message: uri.toString()).toString());
//   }

//   String get progress {
//     return _progress.value;
//   }

//   void endProgress() {
//     _progress.value = "";
//   }

//   void startProgress(String progressTask) {
//     _progress.value = progressTask;
//   }
// }
