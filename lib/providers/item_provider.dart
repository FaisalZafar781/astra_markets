import 'package:flutter/material.dart';
import 'package:retailscanner/models/item_model.dart';

class ItemProvider extends ChangeNotifier {
  ItemModel? _item;

  ItemModel? get item => _item;

  void setItem(ItemModel item) {
    _item = item;
    notifyListeners();
  }

  void clear() {
    _item = null;
    notifyListeners();
  }
}
