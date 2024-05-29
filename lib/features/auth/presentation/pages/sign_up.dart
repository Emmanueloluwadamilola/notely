import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notely/app/app.dart';
import 'package:notely/features/auth/presentation/manager/auth_provider.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                title: AppStrings.createAccount,
                fontSize: 24,
                fontColor: AppColor.titleColor,
                fontFamily: Fonts.nunitoBlack,
              ),
              const BodyText(
                title: AppStrings.createAccountText,
                fontSize: 16,
                fontColor: AppColor.textColor,
                fontFamily: Fonts.nunitoBold,
              ),
              InputText(
                controller: state.nameController,
                isPassword: false,
                keyboard: TextInputType.name,
                focus: state.nameFocus,
                title: AppStrings.name,
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
                  buttonText: AppStrings.createAccountButton,
                  disabled: state.nameController.text.isEmpty ||
                      state.emailController.text.isEmpty ||
                      state.passwordController.text.isEmpty,
                  loading: state.isLoading,
                  callback: () {},),
                  const BodyText(
              title: AppStrings.alreadyAccount,
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
