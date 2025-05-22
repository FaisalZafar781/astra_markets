import 'package:flutter/material.dart';
import 'package:retailscanner/core/constants/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const CustomAppBar({
    super.key,
    this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Image.asset(
          'assets/images/astra-logo.png',
        ),
      ),
      title: Text(
        title ?? 'Astra Markets',
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 4,
    );
  }
}
