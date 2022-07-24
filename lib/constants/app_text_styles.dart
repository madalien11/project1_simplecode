import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  static const s16w500 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const s12w400 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.neutral1,
  );

  static const s14w400 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const s14w500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const s16w400 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textField,
  );

  static const s20w500 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    // color: AppColors.darkText,
  );

  static const productDescription = TextStyle(
    fontSize: 15,
    wordSpacing: 1.5,
    height: 1.75,
    letterSpacing: 0.2,
  );
}
