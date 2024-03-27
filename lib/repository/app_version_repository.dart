import 'dart:convert';

import 'package:flutter_messenger_app/models/app_version_res.dart';

import '../shared/http_client.dart';

const baseUrl = 'http://localhost:3000';

Future<AppVersionResponse> checkAppVersion(
    String version, String platform) async {
  try {
    final response =
        await get('$baseUrl/app-versions/latest/$platform/$version');
    if (response.statusCode == 200) {
      final jsonObject = json.decode(response.body) as Map<String, dynamic>;
      if (jsonObject['info'] != null) {
        final newMap = Map<String, dynamic>.from(jsonObject['info']);
        newMap['upToDate'] = jsonObject['upToDate'];
        return AppVersionResponse.fromJson(newMap);
      } else {
        throw Exception('Failed to load app version');
      }
    } else {
      throw Exception('Failed to load app version');
    }
  } catch (e) {
    print(e);
    throw Exception('Failed to load app version');
  }
}
