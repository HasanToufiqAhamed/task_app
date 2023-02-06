import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'config.dart';

class Initializer {
  static void init() {
    _initGetConnect();
  }

  /// http client
  static Future<void> _initGetConnect() async {
    final connect = GetConnect();
    final fcm = GetConnect();
    Get.put(
      fcm,
      tag: 'fcm',
    );

    final url = ConfigEnvironments.getEnvironments()['url'];
    connect.baseUrl = url;
    connect.timeout = const Duration(seconds: 30);
    connect.httpClient.maxAuthRetries = 0;
    connect.httpClient.addRequestModifier<dynamic>(
      (request) {

        return request;
      },
    );

    connect.httpClient.addResponseModifier(
      (request, response) async {
        debugPrint('request to:=> ${request.url}');

        return response;
      },
    );
    Get.put(connect);
  }
}
