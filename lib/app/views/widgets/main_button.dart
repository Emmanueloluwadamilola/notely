import 'package:flutter/cupertino.dart';
import 'package:notely/app/style/style.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.buttonText,
    required this.disabled,
    required this.loading,
    required this.callback,
  });
  final String buttonText;
  final bool disabled;
  final bool loading;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: disabled || loading ? null : callback,
        child: Container(
          decoration: BoxDecoration(
            color: disabled ? AppColor.inactiveButton : AppColor.buttonColor,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 75,
          width: double.infinity,
          child: Center(
            child: loading
                ? const CupertinoActivityIndicator(
                    color: AppColor.buttonTextColor,
                  )
                : Text(
                    buttonText,
                    style: const TextStyle(
                        fontFamily: Fonts.nunitoBlack,
                        fontSize: 20,
                        color: AppColor.buttonTextColor),
                  ),
          ),
        ),
      ),
    );
  }
}
