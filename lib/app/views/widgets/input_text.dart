import 'package:flutter/material.dart';
import 'package:notely/app/style/style.dart';

// ignore: must_be_immutable
class InputText extends StatefulWidget {
  InputText(
      {super.key,
      required this.isPassword,
      required this.controller,
      required this.keyboard,
      required this.focus});
  bool isPassword;
  final TextEditingController controller;
  final TextInputType keyboard;
  final FocusNode focus;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.textFieldBorder, width: 1),
        borderRadius: BorderRadius.circular(12),
        color: AppColor.textFieldColor,
      ),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboard,
        obscureText: widget.isPassword,
        cursorColor: AppColor.buttonColor,
        focusNode: widget.focus,
        style: const TextStyle(
            fontFamily: Fonts.nunitoBold,
            fontSize: 16,
            color: AppColor.textColor),
        decoration: InputDecoration(
          suffix: IconButton(
            onPressed: () {
              setState(() {
                widget.isPassword = !widget.isPassword;
              });
            },
            icon: Icon(
              widget.isPassword ? Icons.visibility : Icons.visibility_off,
              color: AppColor.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
