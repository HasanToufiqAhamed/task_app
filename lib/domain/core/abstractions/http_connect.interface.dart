import './response.model.dart';

abstract class IHttpConnect {
  Future<Response<T>> get<T>(
    String url, {
    required T Function(dynamic)? decoder,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });
}
