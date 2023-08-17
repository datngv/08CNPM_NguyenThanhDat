import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart'; // Import the integration_test package

import 'package:outlook/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized(); // Initialize integration test binding
  runApp(app.MyApp()); // Run your app

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Trigger a frame.
    await tester.pumpAndSettle();

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
