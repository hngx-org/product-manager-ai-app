import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_payment/in_app_payment.dart';
import 'package:product_management_ai_app/src/core/constants/app_color.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class PaymentScreen extends HookConsumerWidget {
  PaymentScreen({super.key});

  final pay = HNGPay();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final cardController = useTextEditingController();
    final cvvController = useTextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 1, 114),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset(
                      "assets/images/mc_symbol_opt_53_2x.png",
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Card Number",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      5.hi,
                      CustomTextField(
                        controller: cardController,
                        num: true,
                        filledColor: const Color.fromARGB(255, 239, 239, 239),
                        hintText: 'card number',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                      ),
                      15.hi,
                      const Text(
                        "CVV",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      5.hi,
                      CustomTextField(
                        controller: cvvController,
                        num: true,
                        filledColor: const Color.fromARGB(255, 239, 239, 239),
                        hintText: 'cvv',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                      ),
                      15.hi,
                      const Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      5.hi,
                      CustomTextField(
                        controller: nameController,
                        filledColor: const Color.fromARGB(255, 239, 239, 239),
                        hintText: 'name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                      ),
                      35.hi,
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentScreen(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 3, 1, 114),
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              Colors.white.withOpacity(0.1),
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                            elevation: MaterialStateProperty.all<double>(0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(
                              16.0,
                            ),
                            child: Text(
                              "PAY NOW",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
