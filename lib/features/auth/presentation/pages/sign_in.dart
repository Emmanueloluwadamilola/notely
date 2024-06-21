import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notely/app/app.dart';
import 'package:notely/features/auth/presentation/manager/auth_provider.dart';
import 'package:notely/features/auth/presentation/pages/sign_up.dart';
import 'package:notely/features/home/presentation/pages/all_note.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  static const String id = 'sign-In';
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  
  AuthenticationProvider? _provider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      emailController.addListener(
        () {
          _provider?.setEmail(emailController.text);
        },
      );
      passwordController.addListener(
        () {
          _provider?.setPassword(passwordController.text);
        },
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
      builder: (BuildContext context, provider, _) {
        _provider ??= provider;
        final state = provider.state;
        return Scaffold(
          backgroundColor: AppColor.background,
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const Gap(20),
                const AppTitle(),
                const Gap(60),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const BodyText(
                          title: AppStrings.login,
                          fontSize: 24,
                          fontColor: AppColor.titleColor,
                          fontFamily: Fonts.nunitoBlack,
                          textAlign: TextAlign.center,
                        ),
                        const Gap(10),
                        const BodyText(
                          title: AppStrings.loginText,
                          fontSize: 16,
                          fontColor: AppColor.textColor,
                          fontFamily: Fonts.nunitoBold,
                          textAlign: TextAlign.center,
                        ),
                        const Gap(30),
                        InputText(
                          isPassword: false,
                          controller: emailController,
                          keyboard: TextInputType.emailAddress,
                          focus: state.emailFocus,
                          title: AppStrings.email,
                          showPassword: false,
                          hint: '@mail.com', validationText: state.emailError,
                        ),
                        InputText(
                          isPassword: true,
                          showPassword: true,
                          controller: passwordController,
                          keyboard: TextInputType.text,
                          focus: state.passwordFocus,
                          title: AppStrings.password,
                          hint: 'password', validationText: state.passwordError,
                        ),
                        const Gap(80),
                        MainButton(
                          buttonText: AppStrings.login,
                          disabled: emailController.text.isEmpty || state.emailError.isNotEmpty || state.passwordError.isNotEmpty||
                              passwordController.text.isEmpty,
                          loading: state.isLoading,
                          callback: () {
                            Navigator.pushNamed(context, AllNoteScreen.id);
                          },
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, SignUp.id),
                          child: const BodyText(
                            title: AppStrings.dontHaveAccount,
                            fontSize: 16,
                            fontColor: AppColor.buttonColor,
                            fontFamily: Fonts.nunitoExtraBold,
                            textAlign: TextAlign.center,
                          ),
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
