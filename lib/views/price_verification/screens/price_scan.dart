import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retailscanner/core/constants/constants.dart';
import 'package:retailscanner/providers/scan_provider.dart';

class PriceScanScreen extends StatefulWidget {
  const PriceScanScreen({super.key});

  @override
  State<PriceScanScreen> createState() => _PriceScanScreenState();
}

late TextEditingController _qtyController;
late TextEditingController _barCodeController;

class _PriceScanScreenState extends State<PriceScanScreen> {
  @override
  void initState() {
    super.initState();
    _qtyController =
        TextEditingController(text: context.read<ScanProvider>().quantity);
    _barCodeController =
        TextEditingController(text: context.read<ScanProvider>().barCode);
  }

  @override
  void dispose() {
    _qtyController.dispose();
    _barCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScanProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Price Verification Scan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/price_qr_scanner');
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    'Tap to Scan QR Code',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            _buildTextField(
                label: 'Item Number',
                value: scanProvider.itemNumber,
                isReadOnly: true),
            _buildTextField(
                label: 'Product',
                value: scanProvider.product,
                isReadOnly: true),
            TextField(
              keyboardType: TextInputType.number,
              controller: _barCodeController,
              decoration: const InputDecoration(
                labelText: 'Barcode',
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              onChanged: (val) => scanProvider.updateQuantity(val),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: _buildTextField(
                        isReadOnly: true,
                        label: 'Price',
                        value: scanProvider.price)),
                const SizedBox(width: 10),
                Expanded(
                    child: _buildTextField(
                        isReadOnly: true,
                        label: 'Pack of',
                        value: scanProvider.packOf)),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: _buildTextField(
                        isReadOnly: false,
                        label: 'Shelf No.',
                        value: scanProvider.shelfNo)),
                const SizedBox(width: 10),
                Expanded(
                    child: _buildTextField(
                        isReadOnly: false,
                        label: 'Zone No.',
                        value: scanProvider.zoneNo)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Enter Quantity Labels:',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.accentBlack,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 120,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _qtyController,
                    decoration: const InputDecoration(
                      labelText: 'Qty Labels',
                      filled: true,
                      fillColor: AppColors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    onChanged: (val) => scanProvider.updateQuantity(val),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      scanProvider.scannedData;
                      scanProvider.clear();
                      _qtyController.clear();
                      _barCodeController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      'Enter',
                      style: TextStyle(fontSize: 18, color: AppColors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      scanProvider.scannedData;
                      scanProvider.clear();
                      _qtyController.clear();
                      _barCodeController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.warningRed,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      'Clear',
                      style: TextStyle(fontSize: 18, color: AppColors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/bottom_bar');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      'Finish',
                      style: TextStyle(fontSize: 18, color: AppColors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      'Logs',
                      style: TextStyle(fontSize: 18, color: AppColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String label,
      required String value,
      required bool isReadOnly}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        readOnly: isReadOnly,
        controller: TextEditingController(text: value),
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: AppColors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
