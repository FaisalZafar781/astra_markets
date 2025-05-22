import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retailscanner/core/constants/constants.dart';
import 'package:retailscanner/providers/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<SplashProvider>(context, listen: false)
          .initializeApp(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/astra-logo.png', height: 120),
            const SizedBox(height: 20),
            const Text(
              'Astra Markets',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 10),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
