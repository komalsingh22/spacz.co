import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coupons_page/screens/home.dart';

void main() {
  testWidgets('CouponsPage displays title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: CouponsPage()));

    // Verify that the title "Coupons" is displayed.
    expect(find.text('Coupons'), findsOneWidget);
  });
}
