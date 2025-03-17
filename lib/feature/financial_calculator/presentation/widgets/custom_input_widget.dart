import 'package:financial_wellness_app/core/theme/colors.dart';
import 'package:financial_wellness_app/core/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.hintText,
    required this.inputFieldTitle,
    this.isPassword,
    this.onChanged,
    this.controller,
    this.icon,
    this.keyboardType,
    this.initialValue,
    this.textInputAction,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNode,
    this.inputFormatters,
    this.validator,
  });

  final String hintText;
  final String inputFieldTitle;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final Widget? icon;
  final bool? isPassword;
  final TextInputType? keyboardType;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _inputTitle(context, inputFieldTitle),
          const SizedBox(
            height: 4,
          ),
          _textFormField(context),
        ],
      ),
    );
  }

  TextFormField _textFormField(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      autofocus: false,
      controller: controller,
      focusNode: focusNode,
      initialValue: initialValue,
      onChanged: onChanged,
      validator: validator,
      obscureText: isPassword ?? false,
      enableSuggestions: false,
      autocorrect: false,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      decoration: _inputDecoration(context),
      keyboardType: keyboardType,
      style: inputText,
    );
  }

  InputDecoration _inputDecoration(BuildContext context) {
    return InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.fontColorText2,
            width: 0.2,
          ),
        ),
        suffixIcon: suffixIcon,
        hintStyle: inputHint);
  }

  RichText _inputTitle(BuildContext context, String text) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
