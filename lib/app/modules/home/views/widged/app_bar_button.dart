import 'package:flutter/material.dart';
import 'package:task_app/app/data/config/app_color.dart';
import 'package:task_app/app/data/config/app_dimens.dart';
import 'package:task_app/app/utilities/extensions/widget.extensions.dart';

class AppBarButton extends StatelessWidget {
  final Widget icon;

  const AppBarButton({
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: 100.circularRadius,
        color: AppColor.primaryColor,
      ),
      padding: const EdgeInsets.all(
        AppDimens.appBarIconPadding,
      ),
      child: icon,
    );
  }
}
