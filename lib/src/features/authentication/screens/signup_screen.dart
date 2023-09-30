import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:product_management_ai_app/src/core/core.dart';
import 'package:product_management_ai_app/src/features/authentication/screens/login_screen.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    40.hi,
                    Text(
                      'Create Account',
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
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
                    16.hi,
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      textObscured: true,
                    ),
                    16.hi,
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Confirm Password',
                      textObscured: true,
                    ),
                    32.hi,
                    CustomElevatedButton(
                      text: 'Sign Up',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              ),
              child: RichText(
                text: TextSpan(
                  text: 'Have an account? ',
                  style: Theme.of(context).textTheme.bodySmall,
                  children: [
                    TextSpan(
                      text: 'Login',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                    ),
                  ],
                ),
              ).padAll(16),
            ),
          ],
        ),
      ),
    );
  }
}
