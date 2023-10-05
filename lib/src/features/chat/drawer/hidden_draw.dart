import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_management_ai_app/src/core/core.dart';
import 'package:product_management_ai_app/src/data/local_service/hive_service.dart';
import 'package:product_management_ai_app/src/features/authentication/controllers/auth_controller.dart';
import 'package:product_management_ai_app/src/features/authentication/screens/login_screen.dart';
import 'package:product_management_ai_app/src/features/chat/chat_screen.dart';
import 'package:product_management_ai_app/src/features/home/home_screen.dart';
import 'package:product_management_ai_app/src/features/payment_ui/payment_screen.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class HiddenDrawer extends HookConsumerWidget {
  final String? userMessage;
  final int pageIndex;
  const HiddenDrawer({
    super.key,
    this.userMessage,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProv = ref.watch(authProvider);

    const textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.white,
    );

    final pages = useState<List<ScreenHiddenDrawer>>([]);

    useEffect(() {
      pages.value = [
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
          ChatScreen(userMessage: userMessage ?? ""),
        ),
        ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Upgrade to Pro",
            baseStyle: textStyle,
            selectedStyle: textStyle,
            colorLineSelected: AppColors.primaryColor,
          ),
          PaymentScreen(),
        ),
        ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: authProv.isLoading ? '...' : "Logout",
            baseStyle: textStyle,
            selectedStyle: textStyle,
            colorLineSelected: AppColors.primaryColor,
            selected: false,
            onTap: () {
              ref.read(authProvider.notifier).logOut().then((value) {
                if (value) {
                  getIt<HiveService>().clearData();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                }
              });
            },
          ),
          const HomeScreen(),
        ),
      ];
      return null;
    }, []);

    return HiddenDrawerMenu(
      backgroundColorMenu: AppColors.defaultColor,
      backgroundColorContent: Colors.black,
      screens: pages.value,
      initPositionSelected: pageIndex,
      styleAutoTittleName: const TextStyle(color: Colors.white),
      leadingAppBar: const Icon(
        Iconsax.menu,
        color: Colors.white,
      ),
      // elevationAppBar: 3,
      isTitleCentered: true,
      slidePercent: 50,
      backgroundColorAppBar: AppColors.primaryColor,
    );
  }
}
