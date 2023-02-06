import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/app/data/config/app_color.dart';
import 'package:task_app/app/data/config/app_dimens.dart';
import 'package:task_app/app/modules/home/views/widged/app_bar_button.dart';
import 'package:task_app/app/modules/utilities/c_widgets/main_loader.dart';
import 'package:task_app/app/modules/utilities/extensions/date.extensions.dart';
import 'package:task_app/app/modules/utilities/extensions/widget.extensions.dart';
import 'package:task_app/domain/core/model/video/video_list.ui.dart';
import 'package:video_player/video_player.dart';

import '../../controllers/home_controller.dart';

class VideoListTile extends StatefulWidget {
  final VideoListUIModel video;
  final Function() onTap;

  VideoListTile({
    Key? key,
    required this.video,
    required this.onTap,
  }) : super(key: key);

  @override
  State<VideoListTile> createState() => _VideoListTileState();
}

class _VideoListTileState extends State<VideoListTile> {
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: 40.circularRadius,
        color: AppColor.videoListTileColor,
      ),
      padding: const EdgeInsets.all(
        AppDimens.mainPadding,
      ),
      margin: const EdgeInsets.only(
        bottom: AppDimens.mainPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: AppDimens.mainPadding,
              left: AppDimens.mainPadding,
              right: AppDimens.mainPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.video.caption.capitalizeFirst ?? '',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                4.verticalSpacing,
                Text(
                  widget.video.createdAt.hh_mm_a,
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColor.videoListTitleColor,
                  ),
                ),
              ],
            ),
          ),
          AppDimens.mainPadding.verticalSpacing,
          ClipRRect(
            borderRadius: 30.circularRadius,
            child: InkWell(
              onTap: (){
                if(controller.bufferMainVideo.value){
                  return;
                }
                widget.onTap.call();
              },
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: Get.width / 2,
                  minWidth: Get.width - (AppDimens.mainPadding * 2),
                  // maxHeight: Get.height,
                  maxWidth: Get.width - (AppDimens.mainPadding * 2),
                ),
                child: Obx(
                  () {
                    if (controller.playingVideo.value ==
                            widget.video.videoUrl &&
                        controller.loadingMainVideo.value) {
                      return const MainLoader();
                    }
                    if (controller.videoController.dataSource ==
                        widget.video.videoUrl) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          AspectRatio(
                            aspectRatio:
                                controller.videoController.value.aspectRatio,
                            child: VideoPlayer(
                              controller.videoController,
                            ),
                          ),
                          if (controller.bufferMainVideo.value)
                            const MainLoader(),
                          if (!controller.videoPlaying.value)
                            const AppBarButton(
                              icon: Icon(
                                Icons.play_arrow_rounded,
                                size: 50,
                              ),
                            ),
                        ],
                      );
                    }
                    return SizedBox(
                      child: Container(
                        color: AppColor.primaryColor,
                        alignment: Alignment.center,
                        child: const AppBarButton(
                          icon: Icon(
                            Icons.play_arrow_rounded,
                            size: 50,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
