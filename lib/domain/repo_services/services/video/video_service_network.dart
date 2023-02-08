import 'dart:convert';

import 'package:task_app/domain/core/interface/service/video_service_interface.dart';
import 'package:task_app/domain/repo_services/services/video/model/video_list_response.dart';

import '../../../core/abstractions/http_connect.interface.dart';
import '../../../core/exceptions/default.exception.dart';
import '../../../core/exceptions/invalid_token.exception.dart';

class VideoNetworkService extends IVideoRepositoryService{
  final IHttpConnect _connect;

  VideoNetworkService(IHttpConnect connect) : _connect = connect;

  @override
  Future<VideoListResponse> getVideos() async {
    try {
      final response = await _connect.get<VideoListResponse>(
        'api/external/atab/m360ict/get/video/app/test',
        headers: {
          'Accept': 'application/json',
        },
        decoder: (value) {
          return VideoListResponse.fromJson(
            value is String
                ? json.decode(value)
                : value as Map<String, dynamic>,
          );
        },
      );

      if (response.success) {
        return response.payload!;
      } else {
        switch (response.statusCode) {
          case 401:
            throw InvalidTokenException(
                message: 'unauthenticated');
          default:
            throw DefaultException(
              message: 'Error loading data, check your internet!',
            );
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
