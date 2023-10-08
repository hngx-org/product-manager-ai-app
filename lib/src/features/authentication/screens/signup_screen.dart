import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:product_management_ai_app/src/core/core.dart';
import 'package:product_management_ai_app/src/features/authentication/controllers/auth_controller.dart';
import 'package:product_management_ai_app/src/features/authentication/screens/login_screen.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final nameController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final authProv = ref.watch(authProvider);

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
                              'Sign Up',
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
                              'Get your account set up in no time.',
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
                        controller: nameController,
                        hintText: 'Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      16.hi,
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
                        },
                      ),
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
                      16.hi,
                      CustomTextField(
                        controller: confirmPasswordController,
                        hintText: 'Confirm Password',
                        textObscured: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          } else if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      32.hi,
                      CustomElevatedButton(
                        text: 'Sign Up',
                        isLoading: authProv.isLoading,
                        onPressed: () async {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          FocusScope.of(context).unfocus();
                          FocusManager.instance.primaryFocus?.unfocus();

                          ref
                              .read(authProvider.notifier)
                              .signUp(
                                nameController.text,
                                emailController.text,
                                passwordController.text,
                              )
                              .then(
                            (value) {
                              if (value) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(
                                      email: emailController.text,
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
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
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
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
