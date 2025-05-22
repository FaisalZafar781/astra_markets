class ItemModel {
  final String product;
  final int itemNumber;
  final double price;
  final String packOf;

  ItemModel({
    required this.product,
    required this.itemNumber,
    required this.price,
    required this.packOf,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      product: json['product'] ?? '',
      itemNumber: json['itemNumber'] ?? 0,
      price: (json['price'] as num).toDouble(),
      packOf: json['packOf'].toString(),
    );
  }
}
