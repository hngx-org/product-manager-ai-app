import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = Provider<AuthController>((ref) {
  return AuthController();
});

class AuthController with ChangeNotifier {}
