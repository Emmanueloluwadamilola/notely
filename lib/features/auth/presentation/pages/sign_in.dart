import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notely/app/app.dart';
import 'package:notely/features/auth/presentation/manager/auth_provider.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (BuildContext context, provider, _) {
        final state = provider.state;
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const AppTitle(),
              const Gap(40),
              const BodyText(
                title: AppStrings.login,
                fontSize: 24,
                fontColor: AppColor.titleColor,
                fontFamily: Fonts.nunitoBlack,
              ),
              const BodyText(
                title: AppStrings.loginText,
                fontSize: 16,
                fontColor: AppColor.textColor,
                fontFamily: Fonts.nunitoBold,
              ),
              InputText(
                isPassword: false,
                controller: state.emailController,
                keyboard: TextInputType.emailAddress,
                focus: state.emailFocus,
                title: AppStrings.email,
              ),
              InputText(
                isPassword: true,
                controller: state.passwordController,
                keyboard: TextInputType.none,
                focus: state.passwordFocus,
                title: AppStrings.password,
              ),
              const Spacer(),
              MainButton(
                  buttonText: AppStrings.login,
                  disabled:
                      state.emailController.text.isEmpty ||
                      state.passwordController.text.isEmpty,
                  loading: state.isLoading,
                  callback: () {},),
                  const BodyText(
              title: AppStrings.dontHaveAccount,
              fontSize: 16,
              fontColor: AppColor.buttonColor,
              fontFamily: Fonts.nunitoExtraBold,),
                  
            ],
          ),
        );
      },
    );
  }
}
