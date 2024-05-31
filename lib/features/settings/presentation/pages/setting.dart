import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notely/app/app.dart';
import 'package:notely/features/settings/presentation/manager/setting_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Consumer<SettingProvider>(
        builder: (context, provider, _) {
          final state = provider.state;
          return Column(
            children: [
              const AppTitle(),
              const Gap(20),
              CircleAvatar(
                radius: 20,
                child: Image.asset(ImageAsset.avatar),
              ),
              const Gap(10),
              BodyText(
                title: state.name,
                fontSize: 28,
                fontColor: AppColor.titleColor,
                fontFamily: Fonts.nunitoBlack, textAlign: TextAlign.center,
              ),
              BodyText(
                title: state.location,
                fontSize: 16,
                fontColor: AppColor.textColor,
                fontFamily: Fonts.nunitoBold, textAlign: TextAlign.center,
              ),
              ListView(
                children: [
                  ListTile(
                    leading: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        color: AppColor.cardColor,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColor.iconCardBorder),
                      ),
                     // child: Icon(),
                    ),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
