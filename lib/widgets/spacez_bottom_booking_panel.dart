import 'package:flutter/material.dart';

class SpacezBottomBookingPanel extends StatelessWidget {
  final String originalPrice;
  final String? discountedPrice;
  final String nights;
  final String dateRange;
  final String guests;

  const SpacezBottomBookingPanel({
    super.key,
    required this.originalPrice,
    this.discountedPrice,
    required this.nights,
    required this.dateRange,
    required this.guests,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(128),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF387B2C),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.local_offer, color: Colors.white, size: 16),
                SizedBox(width: 8),
                Text(
                  'Book now & Unlock exclusive rewards!',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (discountedPrice != null)
                        Text(
                          '₹$originalPrice',
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                      const SizedBox(width: 8),
                      Text(
                        '₹${discountedPrice ?? originalPrice}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(' for $nights nights'),
                    ],
                  ),
                  Text(
                    '$dateRange | $guests guests',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC4683B),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Reserve'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}