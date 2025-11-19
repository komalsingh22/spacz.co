import 'package:coupons_page/models/coupon.dart';
import 'package:flutter/material.dart';
import 'dashed_border_painter.dart';

class SpacezCouponCard extends StatelessWidget {
  final Coupon coupon;
  final VoidCallback onApply;

  const SpacezCouponCard({
    super.key,
    required this.coupon,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xFFFCF8F7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withAlpha(128)),
      ),
      child: Row(
        children: [
          // Left Vertical Price Strip
          Container(
            width: 80,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: const BoxDecoration(
              color: Color(0xFFC4683B),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: RotatedBox(
              quarterTurns: 3,
              child: Center(
                child: Text(
                  '₹${coupon.price}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          CustomPaint(
            size: const Size(20, 150),
            painter: DashedBorderPainter(),
          ),
          // Right White Coupon Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        coupon.code,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      GestureDetector(
                        onTap: onApply,
                        child: const Row(
                          children: [
                            Icon(
                              Icons.local_offer_outlined,
                              color: Color(0xFFC4683B),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Apply',
                              style: TextStyle(color: Color(0xFFC4683B)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    coupon.description,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const Text('Read more', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
