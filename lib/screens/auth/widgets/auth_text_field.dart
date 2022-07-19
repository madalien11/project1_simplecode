import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    Key? key,
    required this.controller,
    required this.maxLength,
    required this.hintText,
    required this.icon,
    required this.obscureText,
    this.isPassword = false,
    required this.validator,
    this.showPassword,
  }) : super(key: key);

  final TextEditingController controller;
  final int maxLength;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final bool isPassword;
  final Function(String?) validator;
  final Function()? showPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: maxLength,
      style: AppTextStyles.s16w400.copyWith(
        color: AppColors.mainText,
      ),
      obscureText: obscureText,
      obscuringCharacter: '・',
      validator: (val) => validator(val),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textFieldBackground,
        counterText: '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.s16w400.copyWith(
          color: AppColors.primaryGrey,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 21, right: 25),
          child: Icon(
            icon,
            color: AppColors.primaryGrey,
            size: 20,
          ),
        ),
        suffixIcon: isPassword
            ? Padding(
                padding: const EdgeInsets.only(left: 21, right: 25),
                child: GestureDetector(
                  onTap: showPassword,
                  child: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.primaryGrey,
                    size: 20,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
