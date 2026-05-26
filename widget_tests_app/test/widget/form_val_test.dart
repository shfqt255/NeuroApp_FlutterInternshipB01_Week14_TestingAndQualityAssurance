import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_tests_app/screens/home_screen.dart';

void main() {
  testWidgets('Form is not validated and then form is validated', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));
    await tester.tap(find.text('Validate'));
    expect(find.text('Please enter your name'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'Shafqat');

    await tester.tap(find.text('Validate'));

    await tester.pump();

    expect(find.text('Name is required'), findsNothing);
  });
}
