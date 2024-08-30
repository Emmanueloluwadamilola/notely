import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notely/app/app.dart';
import 'package:notely/config/di/injector_container.dart';
import 'package:notely/features/settings/presentation/manager/setting_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  static const id = 'setting';

  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(
      builder: (context, provider, _) {
        final state = provider.state;
        return Scaffold(
          backgroundColor: AppColor.cardColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(40),
                const Center(
                  child: AppTitle(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Gap(20),
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: AppColor.background,
                          child: Image.asset(ImageAsset.avatar),
                        ),
                        const Gap(10),
                        // BodyText(
                        //   title: state.name,
                        //   fontSize: 28,
                        //   fontColor: AppColor.titleColor,
                        //   fontFamily: Fonts.nunitoBlack,
                        //   textAlign: TextAlign.center,
                        // ),
                        // BodyText(
                        //   title: state.location,
                        //   fontSize: 16,
                        //   fontColor: AppColor.textColor,
                        //   fontFamily: Fonts.nunitoExtraBold,
                        //   textAlign: TextAlign.center,
                        // ),
                        const Gap(30),
                        ProfileCard(
                          onTap: () {},
                          iconData: Icons.person,
                          title: 'Buy Premium',
                        ),
                        ProfileCard(
                          onTap: () {},
                          iconData: Icons.edit,
                          title: 'Edit Profile',
                        ),
                        ProfileCard(
                          onTap: () {},
                          iconData: Icons.notifications,
                          title: 'Notification',
                        ),
                        ProfileCard(
                          onTap: () {},
                          iconData: Icons.security,
                          title: 'Security',
                        ),
                        ProfileCard(
                          onTap: () {
                            
                          },
                          iconData: Icons.info,
                          title: 'About App',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.onTap,
    required this.iconData,
    required this.title,
  });
  final VoidCallback onTap;
  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: AppColor.cardColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColor.iconCardBorder,
                ),
              ),
              child: Icon(
                iconData,
                color: AppColor.buttonColor,
              ),
            ),
            const Gap(20),
            Text(
              title,
              style: const TextStyle(
                  fontFamily: Fonts.nunitoExtraBold,
                  fontSize: 20,
                  color: AppColor.textColor),
            ),
            // const Spacer(),
            // const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
