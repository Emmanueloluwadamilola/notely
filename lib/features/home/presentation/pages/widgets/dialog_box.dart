import 'package:flutter/material.dart';

import '../../../../../app/app.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key, required this.delete});
  final VoidCallback delete;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.background,
      content: const BodyText(
          title: AppStrings.deleteDialog,
          fontSize: 20,
          fontColor: AppColor.textColor,
          fontFamily: Fonts.nunitoBold,
          textAlign: TextAlign.center),
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
          child: const Text(
            AppStrings.delete,
            style: TextStyle(
                fontSize: 18, fontFamily: Fonts.titan, color: AppColor.red),
          ),
        ),
      ],
    );
  }
}
