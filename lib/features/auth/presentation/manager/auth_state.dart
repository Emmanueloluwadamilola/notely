import 'package:flutter/material.dart';

class AuthState {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode emailFocus = FocusNode();

  bool isLoading = false;
}
