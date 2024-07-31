import 'package:flutter/material.dart';

import '../../../../../app/app.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog(
      {super.key,
      required this.delete,
      required this.title,
      required this.actionText});
  final VoidCallback delete;
  final String title;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.background,
      content: BodyText(
          title: title,
          fontSize: 20,
          fontColor: AppColor.textColor,
          fontFamily: Fonts.nunitoBold,
          textAlign: TextAlign.start),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              AppStrings.cancel,
              style: TextStyle(
                  fontSize: 18, fontFamily: Fonts.titan, color: Colors.black),
            )),
        TextButton(
          onPressed: delete,
          child: Text(
            actionText,
            style: TextStyle(
                fontSize: 18, fontFamily: Fonts.titan, color: AppColor.red),
          ),
        ),
      ],
    );
  }
}
