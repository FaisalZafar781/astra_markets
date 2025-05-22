import 'package:flutter/material.dart';
import 'package:retailscanner/core/constants/constants.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({super.key});

  final List<Map<String, String>> dummyData = const [
    {
      'product': '0200203X',
      'description': 'KRAFT',
      'packSize': '72',
      'counted': '1',
    },
    {
      'product': '06060202X',
      'description': 'SHEBA',
      'packSize': '1',
      'counted': '2',
    },
    {
      'product': '03030501X',
      'description': 'TWIX',
      'packSize': '1',
      'counted': '41',
    },
    {
      'product': '0200203X',
      'description': 'KRAFT',
      'packSize': '72',
      'counted': '1',
    },
    {
      'product': '06060202X',
      'description': 'SHEBA',
      'packSize': '1',
      'counted': '2',
    },
    {
      'product': '03030501X',
      'description': 'TWIX',
      'packSize': '1',
      'counted': '41',
    },
    {
      'product': '0200203X',
      'description': 'KRAFT',
      'packSize': '72',
      'counted': '1',
    },
    {
      'product': '06060202X',
      'description': 'SHEBA',
      'packSize': '1',
      'counted': '2',
    },
    {
      'product': '03030501X',
      'description': 'TWIX',
      'packSize': '1',
      'counted': '41',
    },
    {
      'product': '0200203X',
      'description': 'KRAFT',
      'packSize': '72',
      'counted': '1',
    },
    {
      'product': '06060202X',
      'description': 'SHEBA',
      'packSize': '1',
      'counted': '2',
    },
    {
      'product': '03030501X',
      'description': 'TWIX',
      'packSize': '1',
      'counted': '41',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreen,
      appBar: AppBar(
        title: const Text(
          'Recorded Items',
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
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 1.5,
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildHeaderRow(),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: dummyData.length,
                  itemBuilder: (context, index) {
                    final item = dummyData[index];
                    return _buildDataRow(index + 1, item);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      color: AppColors.primary,
      child: Row(
        children: const [
          _HeaderCell(text: '#'),
          _HeaderCell(text: 'Product'),
          _HeaderCell(text: 'Description'),
          _HeaderCell(text: 'PackSize'),
          _HeaderCell(text: 'Counted'),
          _HeaderCell(text: 'Delete'),
        ],
      ),
    );
  }

  Widget _buildDataRow(int index, Map<String, String> item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
        color: Colors.white,
      ),
      child: Row(
        children: [
          _DataCell(text: '$index'),
          _DataCell(text: item['product'] ?? ''),
          _DataCell(text: item['description'] ?? ''),
          _DataCell(text: item['packSize'] ?? ''),
          _DataCell(text: item['counted'] ?? ''),
          const _DeleteCell(),
        ],
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String text;
  const _HeaderCell({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
      ),
    );
  }
}

class _DataCell extends StatelessWidget {
  final String text;
  const _DataCell({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

class _DeleteCell extends StatelessWidget {
  const _DeleteCell();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      alignment: Alignment.center,
      child: TextButton(
        onPressed: null, // Will be connected to delete logic later
        child: const Text(
          'Delete',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
