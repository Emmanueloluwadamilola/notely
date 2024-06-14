import 'package:country_picker/country_picker.dart';
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
  TextEditingController cityController = TextEditingController();
  FocusNode cityFocus = FocusNode();
  FocusNode nameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  AuthenticationProvider? _provider;

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
                          title: AppStrings.createAccount,
                          fontSize: 24,
                          fontColor: AppColor.titleColor,
                          fontFamily: Fonts.nunitoBlack,
                          textAlign: TextAlign.center,
                        ),
                        const Gap(10),
                        const BodyText(
                          title: AppStrings.createAccountText,
                          fontSize: 16,
                          fontColor: AppColor.textColor,
                          fontFamily: Fonts.nunitoBold,
                          textAlign: TextAlign.center,
                        ),
                        const Gap(30),
                        InputText(
                          controller: nameController,
                          isPassword: false,
                          keyboard: TextInputType.name,
                          focus: nameFocus,
                          title: AppStrings.name,
                          hint: 'John Bull',
                        ),
                        InputText(
                          isPassword: false,
                          controller: emailController,
                          keyboard: TextInputType.emailAddress,
                          focus: emailFocus,
                          title: AppStrings.email,
                          hint: '@mail.com',
                        ),
                        InputText(
                          isPassword: true,
                          showPassword: true,
                          controller: passwordController,
                          keyboard: TextInputType.text,
                          focus: passwordFocus,
                          title: AppStrings.password,
                          hint: '**********',
                        ),
                        GestureDetector(
                          onTap: () => showCountryPicker(
                              context: context,
                              onSelect: (Country country) {
                                setState(() {
                                  state.countryName = country.name;
                                });
                              }),
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 15, left: 15, right: 8, bottom: 12),
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColor.textFieldBorder, width: 1),
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor.cardColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.countryName ?? AppStrings.selectCountry,
                                  style: const TextStyle(
                                      fontFamily: Fonts.nunitoBold,
                                      fontSize: 18,
                                      color: AppColor.textColor),
                                ),
                                const Icon(Icons.keyboard_arrow_down_outlined)
                              ],
                            ),
                          ),
                        ),
                        const Gap(20),
                        InputText(
                          isPassword: false,
                          controller: cityController,
                          keyboard: TextInputType.name,
                          focus: cityFocus,
                          title: AppStrings.city,
                          hint: 'Califonia',
                        ),
                        const Gap(40),
                        MainButton(
                          buttonText: AppStrings.createAccountButton,
                          disabled: emailController.text.isEmpty ||
                              passwordController.text.isEmpty ||
                              state.countryName == null ||
                              cityController.text.isEmpty ||
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
