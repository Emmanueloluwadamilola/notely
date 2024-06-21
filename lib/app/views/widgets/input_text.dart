import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notely/app/app.dart';

// ignore: must_be_immutable
class InputText extends StatefulWidget {
  InputText(
      {super.key,
      this.showPassword = false,
      required this.isPassword,
      required this.controller,
      required this.keyboard,
      required this.focus,
      required this.title,
      required this.hint,
      required this.validationText});
  bool isPassword;
  TextEditingController controller;
  final TextInputType keyboard;
  final FocusNode focus;
  final String title;
  bool showPassword;
  final String hint;
  final String validationText;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Text(
              widget.title,
              style: const TextStyle(
                  fontFamily: Fonts.nunitoBold,
                  fontSize: 12,
                  color: AppColor.titleColor),
            ),
          ),
          Container(
            // padding: const EdgeInsets.only(top: 5),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.textFieldBorder, width: 1),
              borderRadius: BorderRadius.circular(12),
              color: AppColor.cardColor,
            ),
            child: TextField(
              controller: widget.controller,
              keyboardType: widget.keyboard,
              obscureText: widget.isPassword && widget.showPassword,
              cursorColor: AppColor.buttonColor,
              focusNode: widget.focus,
              onChanged: (value) {
                setState(() {
                  widget.controller.text = value;
                });
              },
              style: const TextStyle(
                  fontFamily: Fonts.nunitoBold,
                  fontSize: 16,
                  color: AppColor.textColor),
              decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: const TextStyle(color: AppColor.hintTextColor),
                  contentPadding: widget.isPassword
                      ? const EdgeInsets.only(
                          left: 15,
                          right: 5,
                        )
                      : const EdgeInsets.only(left: 15, right: 5, top: 8),
                  border: InputBorder.none,
                  suffix: widget.isPassword && widget.focus.hasFocus
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              widget.showPassword = !widget.showPassword;
                            });
                          },
                          icon: Icon(
                            widget.showPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColor.textColor,
                          ),
                        )
                      : null),
            ),
          ),
          ValidationText(text: widget.validationText),
        ],
      ),
    );
  }
}
