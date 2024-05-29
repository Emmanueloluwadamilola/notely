import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notely/app/style/style.dart';

// ignore: must_be_immutable
class InputText extends StatefulWidget {
  InputText(
      {super.key,
      required this.isPassword,
      required this.controller,
      required this.keyboard,
      required this.focus,
      required this.title});
  bool isPassword;
  final TextEditingController controller;
  final TextInputType keyboard;
  final FocusNode focus;
  final String title;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
                fontFamily: Fonts.nunitoBold,
                fontSize: 12,
                color: AppColor.titleColor),
          ),
          const Gap(5),
          Container(
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
          ),
        ],
      ),
    );
  }
}
