import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../domain/core/model/video/video_list.ui.dart';
import '../../../../domain/repository/video/video_repository.dart';

class HomeController extends GetxController {
  final VideoRepository _videoRepository;

  HomeController({
    required VideoRepository videoRepository,
  }) : _videoRepository = videoRepository;

  VideoPlayerController videoController = VideoPlayerController.network('');

  @override
  void onInit() {
    getAllVideos();
    super.onInit();
  }

  RxString playingVideoUrl = ''.obs;
  RxBool loadingMainVideo = false.obs;
  RxBool bufferMainVideo = false.obs;
  RxBool videoPlaying = false.obs;

  void videoInitial({required VideoListUIModel video}) {
    if(bufferMainVideo.value && playingVideoUrl.value == video.videoUrl){
      return;
    }
    if (playingVideoUrl.value == video.videoUrl) {
      if (videoController.value.isPlaying) {
        videoController.pause();
        videoPlaying.value = false;
      } else {
        videoController.play();
        videoPlaying.value = true;
      }
      return;
    }
    videoController.dispose();
    playingVideoUrl.value = video.videoUrl;
    loadingMainVideo.value = true;

    videoController = VideoPlayerController.network(
      video.videoUrl,
    )..initialize().then((v) {
        debugPrint('video initialize-----------> ${videoController.dataSource}');
        loadingMainVideo.value = false;
        videoController.play();
        videoPlaying.value = true;
      });

    videoController.addListener(() {
      if (videoController.value.isBuffering) {
        bufferMainVideo.value = true;
      } else {
        bufferMainVideo.value = false;
      }
    });
  }

  RxBool loading = false.obs;
  RxList<VideoListUIModel> videoList = <VideoListUIModel>[].obs;

  void getAllVideos() async {
    try {
      loading.value = true;
      videoList.value = await _videoRepository.getAllVideos();
    } catch (e, t) {
      debugPrint('get video error ---<>');
      debugPrint(e.toString());
      debugPrint(t.toString());
    } finally {
      loading.value = false;
    }
  }
}

enum VideoPlayStatus {
  playing,
  pause,
}
