import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onboarding_flutter_test/main.dart';
 
void main() {
  testWidgets('Navigate to detail screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // tests the Tap on the first ListTile to trigger navigation
    await tester.tap(find.byType(ListTile).first);

    // Wait for the navigation transition to complete
    await tester.pumpAndSettle();

    // Verify that the user is  on the detail screen by checking for a widget that's unique to that screen.
    expect(find.text('Detail Screen'), findsOneWidget);

    // You can add more specific integration tests here for the detail screen.
  });
}
