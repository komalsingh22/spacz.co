class Coupon {
  final String title;
  final String description;
  final String? expiryDate;
  final String price;
  final String code;
  final String discount;

  Coupon({
    required this.title,
    required this.description,
    this.expiryDate,
    required this.price,
    required this.code,
    required this.discount,
  });
}
