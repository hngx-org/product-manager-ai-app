import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:product_management_ai_app/src/core/core.dart';
import 'package:product_management_ai_app/src/features/onbaording/onboarding_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: DayPilot(),
    ),
  );
}

class DayPilot extends StatelessWidget {
  const DayPilot({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        // systemNavigationBarColor: Colors.blue,
        // navigation bar color
        statusBarColor:
            AppColors.greyTextColor.withOpacity(0.4), // status bar color
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Your PM Buddy',
          theme: AppTheme.light(material3: true),
          // onGenerateTitle: (BuildContext context) =>
          //     AppLocalizations.of(context)!.appTitle,
          home: const OnbaordingScreen(),
        );
      },
    );
  }
}
