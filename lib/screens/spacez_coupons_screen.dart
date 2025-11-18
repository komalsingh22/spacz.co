import 'package:coupons_page/models/coupon.dart';
import 'package:flutter/material.dart';
import '../widgets/spacez_coupon_card.dart';
import '../widgets/spacez_bottom_booking_panel.dart';

class SpacezCouponsScreen extends StatefulWidget {
  const SpacezCouponsScreen({super.key});

  @override
  State<SpacezCouponsScreen> createState() => _SpacezCouponsScreenState();
}

class _SpacezCouponsScreenState extends State<SpacezCouponsScreen> {
  final List<Coupon> _coupons = [
    Coupon(
      title: 'Long Stay',
      description:
          '15% off when you book for 5 days or more and 20% off when you book for 30 days or more.',
      price: '6,900',
      code: 'LONGSTAY',
    ),
    Coupon(
      title: 'Long Stay',
      description:
          '15% off when you book for 5 days or more and 20% off when you book for 30 days or more.',
      price: '6,900',
      code: 'LONGSTAY',
    ),
  ];

  String? _discountedPrice;

  void _onApply(Coupon coupon) {
    setState(() {
      _discountedPrice = '16,000';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${coupon.code} applied!'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SPACEZ'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1.0),
                    bottom: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1.0),
                  ),
                ),
                child: AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {},
                  ),
                  title: const Text(
                    'Coupons',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  centerTitle: false,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  foregroundColor: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _coupons.length,
                    itemBuilder: (context, index) {
                      return SpacezCouponCard(
                        coupon: _coupons[index],
                        onApply: () => _onApply(_coupons[index]),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Payment offers:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SpacezCouponCard(
                    coupon: _coupons[0],
                    onApply: () => _onApply(_coupons[0]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SpacezBottomBookingPanel(
        originalPrice: '19,500',
        discountedPrice: _discountedPrice,
        nights: '2',
        dateRange: '24 Apr - 26 Apr',
        guests: '8',
      ),
    );
  }
}