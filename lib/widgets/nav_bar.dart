import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../generated/l10n.dart';
import '../screens/products_screen/products_screen.dart';
import '../screens/settings_screen/settings_screen.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
    required this.current,
  }) : super(key: key);

  final int current;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: current,
      unselectedItemColor: AppColors.primaryGrey,
      selectedFontSize: 16.0,
      unselectedFontSize: 14.0,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.shopping_bag),
          label: S.of(context).products,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: S.of(context).settings,
        ),
      ],
      onTap: (index) {
        if (index == current) return;
        switch (index) {
          case 0:
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => ProductsScreen()),
              (route) => false,
            );
            break;
          case 1:
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
              (route) => false,
            );
            break;
          default:
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
              (route) => false,
            );
            break;
        }
      },
    );
  }
}
