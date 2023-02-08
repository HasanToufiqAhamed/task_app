import '../../../repo_services/services/video/model/video_list_response.dart';

abstract class IVideoRepositoryService {
  Future<VideoListResponse> getVideos();
}
