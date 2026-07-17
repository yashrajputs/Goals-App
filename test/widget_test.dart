import 'package:flutter_test/flutter_test.dart';

import 'package:goals_app/main.dart';

void main() {
  testWidgets('App renders start screen', (WidgetTester tester) async {
    await tester.pumpWidget(const GoalsApp());

    // Verify that the start screen title is displayed.
    expect(find.text('Guess My Number'), findsOneWidget);
  });
}

