import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_management_ai_app/src/core/core.dart';
import 'package:product_management_ai_app/src/features/home/home_screen.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  final textStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.white,
  );

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Home",
          baseStyle: textStyle,
          selectedStyle: textStyle,
          colorLineSelected: Colors.deepPurple,
        ),
        const HomeScreen(),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: AppColors.scaffoldBackgroundColor,
      screens: _pages,
      initPositionSelected: 0,
      leadingAppBar: const Icon(Iconsax.menu),
      // elevationAppBar: 3,
      isTitleCentered: true,
      disableAppBarDefault: true,
      slidePercent: 40,
      backgroundColorAppBar: AppColors.scaffoldBackgroundColor,
      tittleAppBar: const Text("AI"),
    );
  }
}
