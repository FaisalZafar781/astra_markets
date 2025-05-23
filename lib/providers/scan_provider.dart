import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScanProvider with ChangeNotifier {
  String product = '';
  String itemNumber = '';
  String barCode = '';
  String price = '';
  String packOf = '';
  String shelfNo = '';
  String zoneNo = '';
  String quantity = '';
  String supervisorName = '';
  String workerName = '';

  void updateScannedData({
    required String product,
    required String itemNumber,
    required String price,
    required String packOf,
  }) {
    this.product = product;
    this.itemNumber = itemNumber;
    this.price = price;
    this.packOf = packOf;
    notifyListeners();
  }

  void updateQuantity(String qty) {
    quantity = qty;
    notifyListeners();
  }

  void updateBarCode(String barcode) {
    barCode = barcode;
    notifyListeners();
  }

  void updateShelfNo(String shelf) {
    shelfNo = shelf;
    notifyListeners();
  }

  void updateZoneNo(String zone) {
    zoneNo = zone;
    notifyListeners();
  }

  void updateSupervisorName(String name) {
    supervisorName = name;
    notifyListeners();
  }

  void updateWorkerName(String name) {
    workerName = name;
    notifyListeners();
  }

  void clear() {
    product = '';
    itemNumber = '';
    price = '';
    packOf = '';
    quantity = '';
    barCode = '';
    shelfNo = '';
    zoneNo = '';
    supervisorName = '';
    workerName = '';
    notifyListeners();
  }

  Map<String, String> get scannedData => {
        'product': product,
        'itemNumber': itemNumber,
        'price': price,
        'packOf': packOf,
        'quantity': quantity,
      };

  Future<void> saveToFirestore() async {
    if (workerName.isEmpty) return;

    final docRef = FirebaseFirestore.instance
        .collection('Record')
        .doc(workerName)
        .collection('Scans')
        .doc();

    await docRef.set({
      'product': product,
      'itemNumber': itemNumber,
      'barCode': barCode,
      'price': price,
      'packOf': packOf,
      'shelfNo': shelfNo,
      'zoneNo': zoneNo,
      'quantity': quantity,
      'supervisorName': supervisorName,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
