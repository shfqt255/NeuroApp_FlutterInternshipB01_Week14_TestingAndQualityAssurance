import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:widget_tests_app/providers/provider.dart';
import 'package:widget_tests_app/screens/home_screen.dart';

void main() {
  testWidgets('Counter state change test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CounterProvider(),
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    // initial value
    expect(find.text('Counter: 0'), findsOneWidget);

    // tap button
    await tester.tap(find.text('Increment'));
    await tester.pump();

    // updated value
    expect(find.text('Counter: 1'), findsOneWidget);
  });
}
