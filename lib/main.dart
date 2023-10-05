// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:oktoast/oktoast.dart';
import 'package:product_management_ai_app/src/core/core.dart';
import 'package:product_management_ai_app/src/data/local_service/hive_service.dart';
import 'package:product_management_ai_app/src/features/authentication/models/user.dart';
import 'package:product_management_ai_app/src/features/chat/drawer/hidden_draw.dart';
import 'package:product_management_ai_app/src/features/onbaording/onboarding_screen.dart';
import 'package:product_management_ai_app/src/shared/utils/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox('userData');
  setup();

  final value = await getIt<HiveService>().getData('user');

  runApp(
    ProviderScope(
      child: ProdGenius(hasData: value == null ? false : true),
    ),
  );
}

class ProdGenius extends StatelessWidget {
  final bool hasData;
  const ProdGenius({
    Key? key,
    required this.hasData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.greyTextColor.withOpacity(
          0.4,
        ),
      ),
    );
    return OKToast(
      textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Colors.white,
          ),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ProdGenius',
            theme: AppTheme.light(material3: true),
            home: hasData
                ? const HiddenDrawer(
                    pageIndex: 0,
                  )
                : const OnbaordingScreen(),
          );
        },
      ),
    );
  }
}
