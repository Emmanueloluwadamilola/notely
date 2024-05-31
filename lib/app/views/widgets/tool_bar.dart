import 'package:flutter/material.dart';
import 'package:notely/app/app.dart';

class ToolBarWidget extends StatelessWidget {
  const ToolBarWidget(
      {super.key,
      required this.title,
      this.prefixImageIcon,
      required this.suffixIcon,
      required this.prefixOnPress,
      required this.suffixOnPress,
      required this.isIcon,
      this.prefixicon});
  final String title;
  final ImageProvider<Object>? prefixImageIcon;
  final IconData? prefixicon;
  final IconData suffixIcon;
  final VoidCallback prefixOnPress;
  final VoidCallback suffixOnPress;
  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: prefixOnPress,
          icon: isIcon
              ? Icon(
                  prefixicon,
                  color: AppColor.titleColor,
                )
              : ImageIcon(
                  prefixImageIcon,
                  color: AppColor.titleColor,
                ),
        ),
        Text(
          title,
          style: const TextStyle(
              fontFamily: Fonts.nunitoBlack,
              fontSize: 14,
              color: AppColor.titleColor),
        ),
        IconButton(
          onPressed: suffixOnPress,
          icon: Icon(
            suffixIcon,
            color: AppColor.titleColor,
          ),
        ),
      ],
    );
  }
}
