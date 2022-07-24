import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project1_simplecode/constants/app_colors.dart';
import 'package:project1_simplecode/screens/splash_screen/splash_screen.dart';
import 'package:project1_simplecode/widgets/init_widget.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settings');
  await Hive.openBox('token');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: ValueListenableBuilder(
        builder: (context, box, widget) {
          Box hiveBox = box as Box;
          var darkMode = hiveBox.get('isDarkMode', defaultValue: false);
          return MaterialApp(
            title: 'Project1 SimpleCode',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorSchemeSeed: AppColors.primaryBlue,
              scaffoldBackgroundColor: AppColors.background,
              brightness: Brightness.light,
              textTheme: const TextTheme(
                subtitle1: TextStyle(color: AppColors.darkText),
                bodyText2: TextStyle(color: AppColors.darkText),
              ),
              appBarTheme: const AppBarTheme(
                color: AppColors.primaryLightblue,
                foregroundColor: AppColors.lightText,
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              colorSchemeSeed: AppColors.primaryLightblue,
            ),
            themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            builder: (context, child) {
              return ScrollConfiguration(
                behavior: MyBehavior(),
                child: child!,
              );
            },
            home: const SplashScreen(),
          );
        },
        valueListenable: Hive.box('settings').listenable(),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
