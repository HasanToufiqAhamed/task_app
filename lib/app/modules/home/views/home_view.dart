import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_app/app/data/config/app_dimens.dart';
import 'package:task_app/app/data/icons/app_icons_icons.dart';
import 'package:task_app/app/modules/home/views/widged/app_bar_button.dart';
import 'package:task_app/app/modules/home/views/widged/video_list_tile.dart';

import '../../../data/config/app_color.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(
                AppDimens.mainPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBarButton(
                    icon: Image.asset(
                      'assets/icons/Camera.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  const AppBarButton(
                    icon: SizedBox(
                      height: 24,
                      width: 24,
                      child: Icon(
                        AppIcons.combo_shape,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  if (controller.loading.value) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColor.primaryColor,
                      ),
                    );
                  }
                  if (!controller.loading.value && controller.videoList.isEmpty) {
                    return const Center(
                      child: Text('No available video'),
                    );
                  }
                  return ListView.builder(
                    itemCount: controller.videoList.length,
                    // itemCount: 1,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(AppDimens.mainPadding),
                    itemBuilder: (context, index) {
                      var data = controller.videoList[index];
                      return VideoListTile(
                        video: data,
                        onTap: () {
                          controller.videoInitial(
                            video: data,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
