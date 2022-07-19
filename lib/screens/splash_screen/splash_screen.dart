import 'package:flutter/material.dart';
import 'package:project1_simplecode/constants/app_colors.dart';

import '../../constants/app_assets.dart';
import '../../generated/l10n.dart';
import '../auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    var defaultLocale = const Locale('ru', 'RU');
    S.load(defaultLocale).whenComplete(() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
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
