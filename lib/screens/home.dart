import 'package:coupons_page/models/coupon.dart';
import 'package:coupons_page/widgets/spacez_coupon_card.dart';
import 'package:flutter/material.dart';

class CouponsPage extends StatelessWidget {
  CouponsPage({super.key});
  final List<Coupon> coupons = [
    Coupon(
      title: '20% Off on All Pizzas',
      description: 'Get 20% off on any pizza from Pizza Hut.',
      expiryDate: '2024-12-31',
      price: '10',
      code: 'PIZZA20',
    ),
    Coupon(
      title: 'Free Coffee',
      description: 'Get a free coffee from Starbucks.',
      expiryDate: '2024-11-30',
      price: '5',
      code: 'COFFEE',
    ),
    Coupon(
      title: '50% Off on Movie Tickets',
      description: 'Get 50% off on movie tickets at AMC.',
      expiryDate: '2024-10-31',
      price: '15',
      code: 'MOVIE50',
    ),
  ];

  void _onApply(Coupon coupon) {
    // This is a placeholder for the apply logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coupons')),
      body: ListView.builder(
        itemCount: coupons.length,
        itemBuilder: (context, index) {
          return SpacezCouponCard(
            coupon: coupons[index],
            onApply: () => _onApply(coupons[index]),
          );
        },
      ),
    );
  }
}
