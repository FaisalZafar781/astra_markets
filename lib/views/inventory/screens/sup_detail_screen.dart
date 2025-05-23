import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retailscanner/core/constants/constants.dart';
import 'package:retailscanner/providers/scan_provider.dart';
import 'package:retailscanner/widgets/custom_app_bar.dart';

class SupDetailScreen extends StatefulWidget {
  const SupDetailScreen({super.key});

  @override
  State<SupDetailScreen> createState() => _SupDetailScreenState();
}

class _SupDetailScreenState extends State<SupDetailScreen> {
  bool isReadOnly = false;

  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScanProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Worker Details',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'Enter the Following Details Before Scanning',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.accentBlack,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                readOnly: isReadOnly,
                decoration: InputDecoration(
                  labelText: 'Supervisor Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (val) => scanProvider.updateSupervisorName(val),
              ),
              const SizedBox(height: 20),
              TextField(
                readOnly: isReadOnly,
                decoration: InputDecoration(
                  labelText: 'Worker Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (val) => scanProvider.updateWorkerName(val),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      readOnly: isReadOnly,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Shelf No.',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (val) => scanProvider.updateShelfNo(val),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      readOnly: isReadOnly,
                      decoration: InputDecoration(
                        labelText: 'Zone',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (val) => scanProvider.updateZoneNo(val),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isReadOnly = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(fontSize: 18, color: AppColors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isReadOnly = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text(
                        'Edit',
                        style: TextStyle(fontSize: 18, color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/scan');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  'Scan',
                  style: TextStyle(fontSize: 18, color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
