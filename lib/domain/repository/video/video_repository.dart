import 'package:task_app/domain/core/interface/repository/video_repository_interface.dart';
import 'package:task_app/domain/core/model/video/video_list.ui.dart';

import '../../core/interface/service/video_service_interface.dart';
import '../../repo_services/services/video/model/video_list_response.dart';

class VideoRepository extends IVideoRepository {
  final IVideoRepositoryService _service;

  VideoRepository({
    required IVideoRepositoryService service,
  }) : _service = service;

  @override
  Future<List<VideoListUIModel>> getAllVideos() async {
    try {
      List<VideoListUIModel> list = [];
      VideoListResponse response = await _service.getVideos();

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
