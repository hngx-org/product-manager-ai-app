import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_management_ai_app/src/features/chat_screen/chat_screen.dart';

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
          name: "Chat with AI",
          baseStyle: textStyle,
          selectedStyle: textStyle,
          colorLineSelected: Colors.deepPurple,
        ),
        const ChatPage(),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: const Color.fromRGBO(95, 119, 238, 0.83),
      screens: _pages,
      initPositionSelected: 0,
      leadingAppBar: const Icon(Iconsax.menu),
      elevationAppBar: 1,
      isTitleCentered: true,
      slidePercent: 40,
      tittleAppBar: const Text("AI"),
    );
  }
}
