import 'package:flutter/material.dart';
import 'package:retailscanner/core/constants/constants.dart';

class PriceVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Price Verification',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: AppColors.darkGreen,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Verify prices and manage your records with ease.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.accentBlack,
              ),
            ),
            const SizedBox(height: 100),
            _buildHomeOption(
              context: context,
              title: 'Scan Item for Price',
              icon: Icons.qr_code_scanner,
              onTap: () => Navigator.pushNamed(context, '/price_scan'),
            ),
            const SizedBox(height: 30),
            _buildHomeOption(
              context: context,
              title: 'View Records',
              icon: Icons.list_alt,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeOption({
    required BuildContext context,
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: double.infinity,
        height: 160,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primary, AppColors.darkGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkGreen.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 48, color: AppColors.white),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
