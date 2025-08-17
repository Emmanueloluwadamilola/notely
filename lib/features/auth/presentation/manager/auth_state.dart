import 'package:flutter/material.dart';

class AuthState {
  String name = '';
  String email = '';
  String password = '';
  bool isLoading = false;
  String? countryName;
  String city = '';
  String emailError = '';
  String passwordError = '';
  String nameError = '';
  String cityError = '';
  final canSubmit = ValueNotifier(false);

  FocusNode passwordFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode cityFocus = FocusNode();
  FocusNode nameFocus = FocusNode();
}
