import 'package:flutter/material.dart';

import '../../../data/config/app_color.dart';

class MainLoader extends StatelessWidget {
  const MainLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 3,
        color: Colors.black,
      ),
    );
  }
}
