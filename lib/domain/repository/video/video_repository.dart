import 'package:task_app/domain/core/model/video/video_list.ui.dart';

import '../../repo_services/services/video/model/video_list_response.dart';
import '../../repo_services/services/video/video_service_network.dart';

class VideoRepository {
  final VideoNetworkService _orderNetworkService;

  VideoRepository({
    required VideoNetworkService videoNetworkService,
  }) : _orderNetworkService = videoNetworkService;

  Future<List<VideoListUIModel>> getAllVideos() async {
    try {
      List<VideoListUIModel> list = [];
      VideoListResponse response = await _orderNetworkService.getVideos();

      for (var val in response.data!) {
        VideoListUIModel video = VideoListUIModel(
          id: val.id!,
          caption: val.caption!,
          videoUrl: val.videoUrl!,
          createdAt: val.createdAt!,
        );

        list.add(video);
      }

      return list;
    } catch (e) {
      rethrow;
    }
  }
}
