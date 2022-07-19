import 'package:flutter/material.dart';

import '../../../constants/app_button_styles.dart';
import '../../../constants/app_text_styles.dart';
import '../../../generated/l10n.dart';

class AuthAlertDialog extends StatelessWidget {
  const AuthAlertDialog({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
      titlePadding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
      contentPadding: const EdgeInsets.fromLTRB(30, 20, 30, 24),
      title: Text(
        title,
        style: AppTextStyles.s20w500,
      ),
      content: Text(
        content,
        style: AppTextStyles.s14w400,
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: AppButtonStyles.outline,
                child: Text(S.of(context).ok),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
