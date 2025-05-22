import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:retailscanner/providers/scan_provider.dart';

class PriceQRScannerScreen extends StatefulWidget {
  const PriceQRScannerScreen({super.key});

  @override
  State<PriceQRScannerScreen> createState() => _PriceQRScannerScreenState();
}

class _PriceQRScannerScreenState extends State<PriceQRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();

      try {
        final Map<String, dynamic> data = json.decode(scanData.code ?? '{}');

        Provider.of<ScanProvider>(context, listen: false).updateScannedData(
          product: data['product'] ?? '',
          itemNumber: data['itemNumber'].toString(),
          price: data['price'].toString(),
          packOf: data['packOf'].toString(),
        );

        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid QR code data: $e')),
        );
        controller.resumeCamera();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.green,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Align the QR code within the frame to scan",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
