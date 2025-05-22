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

  void clear() {
    product = '';
    itemNumber = '';
    price = '';
    packOf = '';
    quantity = '';
    barCode = '';
    shelfNo = '';
    zoneNo = '';
    notifyListeners();
  }

  Map<String, String> get scannedData => {
        'product': product,
        'itemNumber': itemNumber,
        'price': price,
        'packOf': packOf,
        'quantity': quantity,
      };
}
