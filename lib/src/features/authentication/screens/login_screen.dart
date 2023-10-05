import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:product_management_ai_app/src/core/core.dart';
import 'package:product_management_ai_app/src/features/authentication/controllers/auth_controller.dart';
import 'package:product_management_ai_app/src/features/authentication/screens/signup_screen.dart';
import 'package:product_management_ai_app/src/features/chat/drawer/hidden_draw.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class LoginScreen extends HookConsumerWidget {
  final String? email;
  const LoginScreen({
    Key? key,
    this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController(text: email);
    final passwordController = useTextEditingController();
    final authProv = ref.watch(authProvider);
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      40.hi,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            6.hi,
                            Text(
                              'Get right back into your account.',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      40.hi,
                      CustomTextField(
                          controller: emailController,
                          hintText: 'Email address',
                          validator: (value) {
                            final regex = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                            );
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!regex.hasMatch(value)) {
                              return 'Please enter a valid email';
                            } else {
                              return null;
                            }
                          }),
                      16.hi,
                      CustomTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        textObscured: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                      ),
                      48.hi,
                      CustomElevatedButton(
                          isLoading: authProv.isLoading,
                          text: 'Login',
                          onPressed: () {
                            if (!formKey.currentState!.validate()) {
                              return;
                            }
                            FocusManager.instance.primaryFocus?.unfocus();

                            ref
                                .read(authProvider.notifier)
                                .login(
                                  emailController.text,
                                  passwordController.text,
                                )
                                .then((value) {
                              if (value) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HiddenDrawer(
                                      pageIndex: 0,
                                    ),
                                  ),
                                );
                              }
                            });
                          }),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                );
              },
              overlayColor: MaterialStateProperty.all(
                Colors.transparent,
              ),
              child: RichText(
                text: TextSpan(
                  text: 'Don\'t have an account? ',
                  style: Theme.of(context).textTheme.bodySmall,
                  children: [
                    TextSpan(
                      text: 'Sign up',
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
