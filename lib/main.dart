import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retailscanner/firebase_options.dart';
import 'package:retailscanner/providers/bottom_navigation_provider.dart';
import 'package:retailscanner/providers/scan_provider.dart';
import 'package:retailscanner/views/base/bottom_tab_bar.dart';
import 'package:retailscanner/views/inventory/screens/inventory_screen.dart';
import 'package:retailscanner/views/inventory/screens/record.dart';
import 'package:retailscanner/views/inventory/screens/qr_scanner.dart';
import 'package:retailscanner/views/inventory/screens/scan.dart';
import 'package:retailscanner/views/inventory/screens/sup_detail_screen.dart';
import 'package:retailscanner/views/price_verification/screens/price_qr_scanner.dart';
import 'package:retailscanner/views/price_verification/screens/price_scan.dart';
import 'package:retailscanner/views/splash/splash.dart';
import 'providers/splash_provider.dart';
import 'providers/item_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => ItemProvider()),
        ChangeNotifierProvider(create: (_) => ScanProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavigationProvider()),
      ],
      child: MaterialApp(
        title: 'Retail Scanner',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/bottom_bar': (context) => BottomTabBar(),
          '/home': (context) => const InventoryScreen(),
          '/scan': (context) => const ScanScreen(),
          '/sup_detail': (context) => const SupDetailScreen(),
          '/price_scan': (context) => const PriceScanScreen(),
          '/qr_scanner': (context) => const QRScannerScreen(),
          '/price_qr_scanner': (context) => const PriceQRScannerScreen(),
          '/records': (context) => const RecordScreen(),
        },
      ),
    );
  }
}
