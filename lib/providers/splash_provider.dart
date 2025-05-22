import 'package:flutter/material.dart';

class SplashProvider with ChangeNotifier {
  Future<void> initializeApp(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.pushReplacementNamed(context, '/bottom_bar');
  }
}
