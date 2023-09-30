import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class ForgotPassword extends HookConsumerWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'Login',
        isBackButton: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  40.hi,
                  Text(
                    'Reset Password',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  16.hi,
                  Text(
                    'Nulla consequat nunc augue blandit nunc, eu sollicitudin urna dolor sagittis lacus. Aenean ut eros et nisl sagittis vestibulum.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  40.hi,
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email address',
                  ),
                  .2.sh.hi,
                  CustomElevatedButton(
                    text: 'Reset',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
