import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../app.dart';

class LoadingWidget {
  static loadingDiad(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: LoadingAnimationWidget.threeRotatingDots(
            color: AppColor.buttonColor,
            size: 60,
          ),
        )
      ],
    );
  }
}
