import 'package:get/get.dart';
import 'package:task_app/domain/repo_bindings/video_repository_bindings.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(
        videoRepository: VideoRepositoryBindings().repository,
      ),
    );
  }
}
