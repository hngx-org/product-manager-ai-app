import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:product_management_ai_app/src/core/core.dart';
import 'package:product_management_ai_app/src/features/authentication/controllers/auth_controller.dart';
import 'package:product_management_ai_app/src/features/chat/components/card_widget.dart';
import 'package:product_management_ai_app/src/features/chat/components/chat_tile.dart';
import 'package:product_management_ai_app/src/features/chat/controller/chat_controller.dart';
import 'package:product_management_ai_app/src/features/chat/drawer/hidden_draw.dart';
import 'package:product_management_ai_app/src/features/chat/models/chat_model.dart';
import 'package:product_management_ai_app/src/features/home/widgets/prompt.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';
import 'package:product_management_ai_app/src/shared/utils/format_name.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProv = ref.watch(authProvider);
    final selectedIndex = useState(0);
    final name = useState('');

    useEffect(() {
      authProv.getUserName().then((value) {
        name.value = value;
      });
      return null;
    }, []);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HiddenDrawer(
                userMessage: "",
                pageIndex: 1,
              ),
            ),
          );
        },
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        label: Text(
          'Start a new chat',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        indicatorColor: AppColors.primaryColor,
        selectedIndex: selectedIndex.value,
        onDestinationSelected: (int index) {
          selectedIndex.value = index;
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(
              'home'.svg,
              height: 24.0,
              width: 24.0,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'log'.svg,
              height: 24.0,
              width: 24.0,
            ),
            label: 'History',
          ),
        ],
      ),
      body: [
        authProv.isLoading
            ? Center(
                child: Lottie.asset(
                  'loading'.json,
                  height: 100.h,
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 16.h, bottom: 4.h),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.greyTextColor.withOpacity(0.2),
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hi ',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(),
                          ),
                          TextSpan(
                            text: formatName(name.value),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          TextSpan(
                            text:
                                ', get started with ProdWhiz by using some of our product management prompts.',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: productManagementPrompts.length,
                      padding: const EdgeInsets.only(top: 10),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (_, index) {
                        return CardWidget(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HiddenDrawer(
                                userMessage: productManagementPrompts[index],
                                pageIndex: 1,
                              ),
                            ),
                          ),
                          text: productManagementPrompts[index],
                          isLast: index == productManagementPrompts.length - 1,
                        );
                      },
                    ),
                  ),
                ],
              ),
        authProv.isLoading
            ? Center(
                child: Lottie.asset(
                  'loading'.json,
                  height: 100.h,
                ),
              )
            : const History(),
      ][selectedIndex.value],
    );
  }
}

class History extends HookConsumerWidget {
  const History({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final authProv = ref.watch(authProvider);
    useEffect(() {
      // authProv.getChats();
      return null;
    }, []);
    return FutureBuilder(
        future: ChatController().retrieveLogs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SizedBox(
                height: 300.h,
                width: 300.w,
                child: Lottie.asset(
                  'loader'.json,
                ),
              ),
            );
          }
          return snapshot.data != null && snapshot.data!.isNotEmpty
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ChatTile(
                      message: ChatMessage(
                        text: snapshot.data![index].text,
                        type: MessageType.ai,
                        timestamp: snapshot.data![index].time,
                        isHistory: true,
                      ),
                      sender: true,
                      isLast: index == snapshot.data.length - 1,
                    );
                  })
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'in-progress'.json,
                        height: .3.sh,
                      ),
                      SizedBox(height: 10.h),
                      Text('No history yet.',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith()),
                    ],
                  ),
                );
        });
  }
}
