import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:product_management_ai_app/src/core/core.dart';
import 'package:product_management_ai_app/src/features/authentication/screens/forgot_password.dart';
import 'package:product_management_ai_app/src/features/authentication/screens/signup_screen.dart';
import 'package:product_management_ai_app/src/features/authentication/widgets/finger_print_body.dart';
import 'package:product_management_ai_app/src/features/chat/drawer/hidden_draw.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    useEffect(() {
      Future.delayed(const Duration(seconds: 2), () {
        if (true) {
          bottomSheet(context, child: const FingerPrintBody());
        }
      });
      return null;
    }, const []);
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
                      Text(
                        'Login',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      16.hi,
                      Text(
                        'Get right back into your account.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w400,
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
                            }
                            return null;
                          }),
                      8.hi,
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgotPassword(),
                              ),
                            );
                          },
                          overlayColor: MaterialStateProperty.all(
                            Colors.transparent,
                          ),
                          child: Text(
                            'Forgot password?',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ).padOnly(
                            top: 8.h,
                            bottom: 8.h,
                            left: 8.w,
                          ),
                        ),
                      ),
                      32.hi,
                      CustomElevatedButton(
                          text: 'Login',
                          onPressed: () {
                            if (!formKey.currentState!.validate()) {
                              return;
                            }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HiddenDrawer(
                                  pageIndex: 0,
                                ),
                              ),
                            );
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
