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

  // simple formatter to add commas (e.g. 19500 -> 19,500)
  String _formatWithCommas(String value) {
    // remove non-digit characters first
    final digitsOnly = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (digitsOnly.isEmpty) return value;
    final chars = digitsOnly.split('').reversed.toList();
    final buffer = StringBuffer();
    for (var i = 0; i < chars.length; i++) {
      if (i != 0 && i % 3 == 0) buffer.write(',');
      buffer.write(chars[i]);
    }
    return buffer.toString().split('').reversed.join();
  }

  @override
  Widget build(BuildContext context) {
    final formattedOriginal = _formatWithCommas(originalPrice);
    final formattedDiscount =
        discountedPrice != null ? _formatWithCommas(discountedPrice!) : null;

    return Container(
      // removed fixed height so the card can size naturally
      padding: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        // kept subtle top shadow (if you want completely flat remove boxShadow)
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(30),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Offer strip (unchanged)
          Container(
            decoration: const BoxDecoration(color: Color(0xFF387B2C)),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/vector.png', height: 16, width: 16),
                  const SizedBox(width: 8),
                  const Text(
                    'Book now & Unlock exclusive rewards!',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // LEFT: prices + info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Price row: original (struck) first, then discounted price
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // show original price WITH strikethrough only when there's a discount
                        if (formattedDiscount != null)
                          Text(
                            '₹$formattedOriginal',
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        if (formattedDiscount != null) const SizedBox(width: 8),

                        // discounted price (or original if no discount)
                        Text(
                          '₹${formattedDiscount ?? formattedOriginal}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(width: 6),

                        // "for X nights" lighter grey
                        Text(
                          'for $nights nights',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    // Date & guests with subtle underline + edit icon
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 2),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Text(
                            '$dateRange | $guests guests',
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(Icons.edit, size: 16, color: Colors.grey),
                      ],
                    ),
                  ],
                ),

                // RIGHT: Reserve button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC4683B),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Reserve',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
