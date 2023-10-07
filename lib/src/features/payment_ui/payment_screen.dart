import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_payment/in_app_payment.dart';
import 'package:lottie/lottie.dart';
import 'package:product_management_ai_app/src/core/constants/app_color.dart';
import 'package:product_management_ai_app/src/features/authentication/controllers/auth_controller.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class PaymentScreen extends HookConsumerWidget {
  PaymentScreen({super.key});
  final pay = HNGPay();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProv = ref.watch(authProvider);
    final id = useState('');

    useEffect(() {
      authProv.getUserId().then((value) {
        id.value = value;
      });
      return null;
    }, []);

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Lottie.asset(
                'Animation - 1696684103419'.json,
              ),
              const Text(
                "Pro Plan",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              15.hi,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.check_sharp,
                        color: AppColors.defaultColor,
                      ),
                    ),
                    Text("Up to 100 credits"),
                  ],
                ),
              ),
              10.hi,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.check_sharp,
                        color: AppColors.defaultColor,
                      ),
                    ),
                    Text("Unlimited Database"),
                  ],
                ),
              ),
              10.hi,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.check_sharp,
                        color: AppColors.defaultColor,
                      ),
                    ),
                    Text("Priority Support"),
                  ],
                ),
              ),
              30.hi,
              const Text(
                "\$3.99 / mo",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              10.hi,
              Container(
                child: pay.googlePay(
                  context,
                  amountToPay: "3.99",
                  userID: id.value,
                ), //for android implementaion
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(
              //     //     builder: (context) => PaymentScreen(),
              //     //   ),
              //     // );
              //   },
              //   style: ButtonStyle(
              //     backgroundColor: MaterialStateProperty.all<Color>(
              //       AppColors.defaultColor,
              //     ),
              //     overlayColor: MaterialStateProperty.all<Color>(
              //       Colors.white.withOpacity(0.1),
              //     ),
              //     shape: MaterialStateProperty.all<OutlinedBorder>(
              //       RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(50.0),
              //       ),
              //     ),
              //     elevation: MaterialStateProperty.all<double>(0),
              //   ),
              //   child: const Padding(
              //     padding: EdgeInsets.all(
              //       16.0,
              //     ),
              //     child: Text(
              //       "Pay Now",
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 18,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
