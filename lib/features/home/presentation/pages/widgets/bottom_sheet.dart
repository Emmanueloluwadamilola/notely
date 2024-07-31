import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notely/app/app.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key, required this.onTapCamera, required this.onTapGallery});
  final VoidCallback onTapCamera;
  final VoidCallback onTapGallery;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      child: Column(
        children: [
          const BodyText(
            title: AppStrings.selectImageSource,
            fontSize: 18,
            fontColor: AppColor.textColor,
            fontFamily: Fonts.nunitoBold,
            textAlign: TextAlign.justify,
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onTapCamera,
                child: const Column(
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 80,
                    ),
                    Text(
                      AppStrings.camera,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: Fonts.nunitoRegular,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: onTapGallery,
                child: const Column(
                  children: [
                    Icon(
                      Icons.image_outlined,
                      size: 80,
                    ),
                    Text(
                      AppStrings.gallery,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: Fonts.nunitoRegular,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
