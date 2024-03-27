import 'package:package_info_plus/package_info_plus.dart';

Future<(String, String, String, String)> checkDeviceInfo() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String appName = packageInfo.appName;
  String packageName = packageInfo.packageName;
  String version = packageInfo.version;
  String buildNumber = packageInfo.buildNumber;

  return (appName, packageName, version, buildNumber);
}
