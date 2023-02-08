import 'package:get/get.dart';

import '../repo_services/connect.dart';
import '../repo_services/services/video/video_service_network.dart';
import '../repository/video/video_repository.dart';

class VideoRepositoryBindings {
  late VideoRepository _videoRepository;

  VideoRepository get repository => _videoRepository;

  VideoRepositoryBindings() {
    final GetConnect getConnect = Get.find<GetConnect>();
    final Connect connect = Connect(connect: getConnect);
    final videoNetworkService = VideoNetworkService(connect);
    _videoRepository = VideoRepository(
      service: videoNetworkService,
    );
  }
}
