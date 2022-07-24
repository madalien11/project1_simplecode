import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project1_simplecode/constants/app_colors.dart';
import 'package:provider/provider.dart';

import '../../constants/app_assets.dart';
import '../../generated/l10n.dart';
import '../../repo/repo_settings.dart';
import '../auth/login_screen.dart';
import '../products_screen/products_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    final repoSettings = Provider.of<RepoSettings>(context, listen: false);
    repoSettings.init().whenComplete(() async {
      var defaultLocale = const Locale('ru', 'RU');
      final locale = repoSettings.readLocale();
      if (locale == 'en') {
        defaultLocale = const Locale('en');
      }
      S.load(defaultLocale).whenComplete(() {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Hive.box('token').get('token') != null
                ? ProductsScreen()
                : const LoginScreen(),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SizedBox.expand(
          child: Image.asset(
            AppAssets.images.splashBackground,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
