import '../../model/video/video_list.ui.dart';

abstract class IVideoRepository {
  Future<List<VideoListUIModel>> getAllVideos();
}