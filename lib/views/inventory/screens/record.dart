import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:retailscanner/core/constants/constants.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  Map<String, List<Map<String, dynamic>>> recordsByWorker = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRecords();
  }

  Future<void> fetchRecords() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('Record').get();

    final Map<String, List<Map<String, dynamic>>> data = {};

    for (var workerDoc in snapshot.docs) {
      final workerName = workerDoc.id;

      final scansSnapshot = await workerDoc.reference
          .collection('Scans')
          .orderBy('timestamp', descending: true)
          .get();

      data[workerName] = scansSnapshot.docs.map((doc) {
        return doc.data();
      }).toList();
    }

    setState(() {
      recordsByWorker = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : recordsByWorker.isEmpty
              ? const Center(child: Text('No records found.'))
              : ListView(
                  children: recordsByWorker.entries.map((entry) {
                    final worker = entry.key;
                    final items = entry.value;

                    return Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                      ),
                      child: ExpansionTile(
                        title: Text(
                          worker,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              children: [
                                _buildHeaderRow(),
                                ...items.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final item = entry.value;
                                  return _buildDataRow(index + 1, item);
                                }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
    );
  }

  Widget _buildHeaderRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      color: AppColors.primary,
      child: const Row(
        children: [
          _HeaderCell(text: '#'),
          _HeaderCell(text: 'Item No'),
          SizedBox(width: 20),
          _HeaderCell(text: 'Product'),
          SizedBox(width: 20),
          _HeaderCell(text: 'Barcode'),
          _HeaderCell(text: 'Price'),
          _HeaderCell(text: 'Pack'),
          _HeaderCell(text: 'Qty'),
          _HeaderCell(text: 'Shelf'),
          _HeaderCell(text: 'Zone'),
          _HeaderCell(text: 'Supervisor'),
          _HeaderCell(text: 'Time'),
          _HeaderCell(text: 'Delete'),
        ],
      ),
    );
  }

  Widget _buildDataRow(int index, Map<String, dynamic> item) {
    final timestamp = item['timestamp'];
    String formattedTime = '';

    if (timestamp is Timestamp) {
      final date = timestamp.toDate();
      formattedTime =
          '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    }

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
          _DataCell(text: item['itemNumber'] ?? ''),
          const SizedBox(width: 20),
          _DataCell(text: item['product'] ?? ''),
          const SizedBox(width: 20),
          _DataCell(text: item['barCode'] ?? ''),
          _DataCell(text: item['price'] ?? ''),
          _DataCell(text: item['packOf'] ?? ''),
          _DataCell(text: item['quantity'] ?? ''),
          _DataCell(text: item['shelfNo'] ?? ''),
          _DataCell(text: item['zoneNo'] ?? ''),
          _DataCell(text: item['supervisorName'] ?? ''),
          _DataCell(text: formattedTime),
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
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
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
      child: const TextButton(
        onPressed: null,
        child: Text(
          'Delete',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
