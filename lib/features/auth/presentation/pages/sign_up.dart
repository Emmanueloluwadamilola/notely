import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notely/app/app.dart';
import 'package:notely/features/auth/presentation/manager/auth_provider.dart';
import 'package:notely/features/auth/presentation/pages/sign_in.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  static const String id = 'sign-up';
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  FocusNode nameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  AuthProvider? _provider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      emailController.addListener(() {
        _provider?.setEmail(emailController.text);
      });
      passwordController.addListener(
        () {
          _provider?.setPassword(passwordController.text);
        },
      );
      nameController.addListener(
        () {
          _provider?.setName(nameController.text);
        },
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
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
                          title: AppStrings.createAccount,
                          fontSize: 24,
                          fontColor: AppColor.titleColor,
                          fontFamily: Fonts.nunitoBlack, textAlign: TextAlign.center,
                        ),
                        const Gap(10),
                        const BodyText(
                          title: AppStrings.createAccountText,
                          fontSize: 16,
                          fontColor: AppColor.textColor,
                          fontFamily: Fonts.nunitoBold, textAlign: TextAlign.center,
                        ),
                        const Gap(30),
                        InputText(
                          controller: nameController,
                          isPassword: false,
                          keyboard: TextInputType.name,
                          focus: nameFocus,
                          title: AppStrings.name,
                        ),
                        InputText(
                          isPassword: false,
                          controller: emailController,
                          keyboard: TextInputType.emailAddress,
                          focus: emailFocus,
                          title: AppStrings.email,
                        ),
                        InputText(
                          isPassword: true,
                          showPassword: true,
                          controller: passwordController,
                          keyboard: TextInputType.text,
                          focus: passwordFocus,
                          title: AppStrings.password,
                        ),
                        const Gap(60),
                        MainButton(
                          buttonText: AppStrings.createAccountButton,
                          disabled: emailController.text.isEmpty ||
                              passwordController.text.isEmpty ||
                              nameController.text.isEmpty,
                          loading: state.isLoading,
                          callback: () {
                            Navigator.pushNamed(context, SignIn.id);
                          },
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, SignIn.id),
                          child: const BodyText(
                            title: AppStrings.alreadyAccount,
                            fontSize: 16,
                            fontColor: AppColor.buttonColor,
                            fontFamily: Fonts.nunitoExtraBold, textAlign: TextAlign.center,
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
