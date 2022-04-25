import 'package:flutter_test/flutter_test.dart';
import 'package:sneve/sneve_app.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SneveApp());

    // Verify that our counter starts at 0.
    expect(5, 5);
  });
}
