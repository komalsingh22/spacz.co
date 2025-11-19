import 'package:coupons_page/models/coupon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      discount: '15',
    ),
    Coupon(
      title: 'Long Stay',
      description:
          '15% off when you book for 5 days or more and 20% off when you book for 30 days or more.',
      price: '6,900',
      code: 'LONGSTAY',
      discount: '20',
    ),
  ];

  String? _discountedPrice;
  final String _originalPrice = '19,500';

  void _onApply(Coupon coupon) {
    final originalPriceDouble =
        double.parse(_originalPrice.replaceAll(',', ''));
    final discountPercentage = double.parse(coupon.discount);
    final discountedPriceDouble =
        originalPriceDouble * (1 - (discountPercentage / 100));

    setState(() {
      _discountedPrice =
          NumberFormat.currency(locale: 'en_IN', symbol: '', decimalDigits: 0)
              .format(discountedPriceDouble);
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
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/ICON2_cropped 3.png',
              height: 24,
            ),
            const SizedBox(width: 8),
            Text(
              'SPACEZ',
              style: TextStyle(
                fontFamily: 'Kalnia',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [IconButton(icon: const Icon(Icons.menu), onPressed: () {})],
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
                    top: BorderSide(
                      color: Colors.grey.withAlpha(76),
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.grey.withAlpha(76),
                      width: 1.0,
                    ),
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
                  titleSpacing: 0.0, // Added this line
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 16.0,
              ),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
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
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SpacezBottomBookingPanel(
        originalPrice: _originalPrice,
        discountedPrice: _discountedPrice,
        nights: '2',
        dateRange: '24 Apr - 26 Apr',
        guests: '8',
      ),
    );
  }
}
