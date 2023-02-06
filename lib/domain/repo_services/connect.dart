import 'package:flutter/material.dart';

import 'package:get/get.dart' hide Response;

import '../../domain/core/abstractions/http_connect.interface.dart';
import '../../domain/core/abstractions/response.model.dart';

class Connect implements IHttpConnect {
  final GetConnect _connect;

  const Connect({required GetConnect connect}) : _connect = connect;

  @override
  Future<Response<T>> get<T>(
    String url, {
    required T Function(dynamic)? decoder,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _connect.get(
        url,
        decoder: decoder,
        headers: headers,
        query: query,
      );
      isConnected(response.status.code);

      final obj = Response(
        statusCode: response.statusCode!,
        payload: response.body,
      );
      return obj;
    } catch (e) {
      rethrow;
    }
  }

  void isConnected(int? code) {
    if (code == null) {
      debugPrint('no connection available');
    }
  }
}
