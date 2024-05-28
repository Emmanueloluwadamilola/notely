import 'package:flutter/material.dart';
import 'package:notely/app/app.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 5,
      width:  8,
      decoration: BoxDecoration(
        color: isActive ? AppColor.buttonColor : AppColor.inactiveButton,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }
}
