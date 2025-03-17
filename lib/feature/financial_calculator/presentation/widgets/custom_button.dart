import 'package:financial_wellness_app/core/common/enums.dart';
import 'package:financial_wellness_app/core/theme/colors.dart';
import 'package:financial_wellness_app/core/theme/fonts.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.style = CustomButtonStyle.enabled,
    required this.text,
    required this.onPressed,
    this.fontSize,
    this.height,
    this.leadingIcon,
  });

  final CustomButtonStyle style;
  final String text;
  final VoidCallback onPressed;
  final double? fontSize;
  final double? height;
  final Widget? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 56,
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: _textColor(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
                color: style == CustomButtonStyle.outline
                    ? AppColors.blue
                    : Colors.transparent,
                width: 2),
          ),
          backgroundColor: _backgroundColor(context),
        ),
        child: _body(context),
      ),
    );
  }

  Color _backgroundColor(BuildContext context) {
    switch (style) {
      case CustomButtonStyle.enabled:
        return AppColors.blue;
      case CustomButtonStyle.outline:
        return Colors.white;
      case CustomButtonStyle.disabled:
        return AppColors.disabled;
      default:
        return AppColors.blue;
    }
  }

  Color _textColor(BuildContext context) {
    switch (style) {
      case CustomButtonStyle.enabled:
        return AppColors.white;
      default:
        return AppColors.blue;
    }
  }

  Widget _body(BuildContext context) {
    if (leadingIcon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [leadingIcon!, const SizedBox(width: 10), _textBtn(context)],
      );
    } else {
      return _textBtn(context);
    }
  }

  Widget _textBtn(BuildContext context) {
    switch (style) {
      case CustomButtonStyle.enabled:
        return Text(text, style: btnTextWhite);
      default:
        return Text(text, style: btnTextBlue);
    }
  }
}
