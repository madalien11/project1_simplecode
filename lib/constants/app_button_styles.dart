import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppButtonStyles {
  static final elevated = ElevatedButton.styleFrom(
    primary: AppColors.primaryLightblue,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    padding: const EdgeInsets.symmetric(vertical: 12),
  );

  static final textButton = TextButton.styleFrom(
    primary: AppColors.primaryBlue,
    textStyle: AppTextStyles.s14w400.copyWith(fontWeight: FontWeight.w600),
  );

  static final outline = OutlinedButton.styleFrom(
    elevation: 0,
    textStyle: AppTextStyles.s16w400.copyWith(
      color: AppColors.primaryBlue,
    ),
    side: const BorderSide(
      color: AppColors.primaryBlue,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    padding: const EdgeInsets.symmetric(vertical: 10),
  );
}
