import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_management_ai_app/src/core/core.dart';
import 'package:product_management_ai_app/src/features/authentication/screens/logout.dart';
import 'package:product_management_ai_app/src/features/chat_screen/chat_screen.dart';
import 'package:product_management_ai_app/src/features/home/home_screen.dart';

class HiddenDrawer extends StatefulWidget {
  final String? userMessage;
  final int pageIndex;
  const HiddenDrawer({super.key, this.userMessage, required this.pageIndex});

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
          colorLineSelected: AppColors.primaryColor,
        ),
        const HomeScreen(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Chat with AI",
          baseStyle: textStyle,
          selectedStyle: textStyle,
          colorLineSelected: AppColors.primaryColor,
        ),
        ChatScreen(userMessage: widget.userMessage ?? ""),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "logout",
          baseStyle: textStyle,
          selectedStyle: textStyle,
          colorLineSelected: AppColors.primaryColor,
        ),
        const Logout(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: AppColors.defaultColor,
      backgroundColorContent: Colors.black,
      screens: _pages,
      initPositionSelected: widget.pageIndex,
      styleAutoTittleName: const TextStyle(color: Colors.white),
      leadingAppBar: const Icon(
        Iconsax.menu,
        color: Colors.white,
      ),
      // elevationAppBar: 3,
      isTitleCentered: true,
      slidePercent: 40,
      backgroundColorAppBar: AppColors.primaryColor,
    );
  }
}
