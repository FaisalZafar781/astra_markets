import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retailscanner/core/constants/constants.dart';
import 'package:retailscanner/providers/bottom_navigation_provider.dart';
import 'package:retailscanner/views/inventory/screens/inventory_screen.dart';
import 'package:retailscanner/views/price_verification/screens/price_verification_screen.dart';
import 'package:retailscanner/views/settings/screens/settings_screen.dart';
import 'package:retailscanner/widgets/custom_app_bar.dart';

class BottomTabBar extends StatelessWidget {
  final List<Widget> _pages = [
    const InventoryScreen(),
    const PriceVerificationScreen(),
    const SettingsScreen(),
  ];

  BottomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<BottomNavigationProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: _pages[navProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navProvider.currentIndex,
        backgroundColor: AppColors.primary,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.darkGreen,
        onTap: (index) => navProvider.updateIndex(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Inventory',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.price_check,
              size: 25,
            ),
            label: 'Verify Price',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
