import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:project1_simplecode/screens/auth/login_screen.dart';
import 'package:provider/provider.dart';

import '../../constants/app_button_styles.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../generated/l10n.dart';
import '../../repo/repo_settings.dart';
import '../../widgets/nav_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late RepoSettings repoSettings;
  late bool isDarkMode;

  @override
  void initState() {
    super.initState();
    repoSettings = Provider.of<RepoSettings>(context, listen: false);
    isDarkMode = repoSettings.readTheme() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            S.of(context).settings,
            style: AppTextStyles.s20w500.copyWith(color: AppColors.lightText),
          ),
        ),
      ),
      bottomNavigationBar: const NavBar(current: 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${S.of(context).language}: ',
                style: AppTextStyles.s14w400,
              ),
              DropdownButton(
                value: Intl.getCurrentLocale(),
                focusColor: AppColors.primaryLightblue,
                iconEnabledColor: AppColors.primaryBlue,
                items: [
                  DropdownMenuItem(
                    value: 'en',
                    child: Text(
                      S.of(context).english,
                      style: AppTextStyles.s14w400,
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'ru_RU',
                    child: Text(
                      S.of(context).russian,
                      style: AppTextStyles.s14w400,
                    ),
                  ),
                ],
                onChanged: (val) async {
                  if (val == null) return;
                  if (val == 'ru_RU') {
                    await S.load(const Locale('ru', 'RU'));
                    setState(() {});
                  } else if (val == 'en') {
                    await S.load(const Locale('en'));
                    setState(() {});
                  }
                  if (!mounted) return;
                  repoSettings.saveLocale(val.toString());
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${S.of(context).darkMode}: ',
                style: AppTextStyles.s14w400,
              ),
              Switch(
                  value: isDarkMode,
                  onChanged: (val) async {
                    if (!mounted) return;
                    isDarkMode = val;
                    repoSettings.saveTheme(isDarkMode);
                    setState(() {});
                  }),
            ],
          ),
          ElevatedButton(
            style: AppButtonStyles.elevated,
            onPressed: () {
              Hive.box('token').delete('token');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: ((context) => const LoginScreen()),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                S.of(context).signOut,
                style: AppTextStyles.s16w400.copyWith(
                  color: AppColors.lightText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
