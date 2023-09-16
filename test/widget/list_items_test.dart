import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onboarding_flutter_test/main.dart';

void main() {
  testWidgets('List items are displayed correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verifies that two ListTile widgets are present, which corresponds to our dummy data.
    expect(find.byType(ListTile), findsNWidgets(2));
  });
}
