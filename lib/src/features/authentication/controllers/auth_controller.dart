import 'package:flutter/material.dart';
import 'package:hng_authentication/authentication.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:product_management_ai_app/src/data/local_service/hive_service.dart';
import 'package:product_management_ai_app/src/data/local_service/toast_service.dart';
import 'package:product_management_ai_app/src/features/authentication/models/user.dart';
import 'package:product_management_ai_app/src/features/authentication/models/user_detail.dart';
import 'package:product_management_ai_app/src/shared/utils/locator.dart';

final authProvider = ChangeNotifierProvider<AuthController>((ref) {
  return AuthController();
});

class AuthController with ChangeNotifier {
  bool isLoading = false;
  final auth = Authentication();
  UserDetail userDetail = UserDetail();

  Future<bool> login(String email, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      final user = await auth.signIn(
        email.trim(),
        password.trim(),
      );

      if (user != null) {
        userDetail = UserDetail(
          name: user.name,
          email: user.email,
          id: user.id,
          credits: user.credits,
          cookie: user.cookie.toString().split(';').first != ''
              ? user.cookie.toString().split(';').first
              : '',
        );

        final userDetails = User(
          createdAt: '',
          credit: user.credits ?? 0,
          email: email,
          id: user.id ?? '',
          name: user.name ?? '',
          updatedAt: '',
          cookie: user.cookie.toString().split(';').first != ''
              ? user.cookie.toString().split(';').first
              : '',
        );

        getIt<HiveService>().saveData(
          'user',
          userDetails,
        );
        ToastService().showCustomToast(
          'Logged in successfully',
        );
        isLoading = false;
        return true;
      }
      notifyListeners();
    } catch (e) {
      debugPrint('e: $e');
      ToastService().showCustomToast(
        'Something went wrong, please try again',
        isError: true,
      );
      isLoading = false;
      notifyListeners();
      return false;
    }
    return false;
  }

  Future<bool> signUp(
    String name,
    String email,
    String password,
  ) async {
    isLoading = true;
    notifyListeners();
    debugPrint('name.trim().replace: ${name.trim().replaceAll(' ', '0000')}');
    try {
      final user = await auth.signUp(
        email.trim(),
        name.trim().replaceAll(' ', '0000'),
        password.trim(),
      );

      if (user != null) {
        ToastService().showCustomToast(
          'Account created successfully',
        );
        isLoading = false;
        return true;
      }
      notifyListeners();
    } catch (e) {
      debugPrint('e: $e');
      ToastService().showCustomToast(
        'Something went wrong, please try again',
        isError: true,
      );
      isLoading = false;
      notifyListeners();
      return false;
    }
    return false;
  }

  Future<bool> logOut() async {
    isLoading = true;
    notifyListeners();
    final user = await getIt<HiveService>().getData('user');
    String email = user.email;
    try {
      final user = await auth.logout(
        email,
      );

      if (user != null) {
        ToastService().showCustomToast(
          'You have successfully logged out',
        );
        isLoading = false;
        return true;
      }
      notifyListeners();
    } catch (e) {
      debugPrint('e: $e');
      ToastService().showCustomToast(
        'Something went wrong, please try again',
        isError: true,
      );
      isLoading = false;
      notifyListeners();
      return false;
    }
    return false;
  }
}
