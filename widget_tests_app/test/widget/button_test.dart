import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:widget_tests_app/providers/provider.dart';
import 'package:widget_tests_app/screens/home_screen.dart';

void main() {
  testWidgets('All Button taps tested', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CounterProvider(),
        child: MaterialApp(home: HomeScreen()),
      ),
    );

    await tester.tap(find.text('Validate'));
    await tester.pumpAndSettle();
    expect(find.text('Please enter your name'), findsOneWidget);

    await tester.tap(find.text('Increment'));
    await tester.pumpAndSettle();
    expect(find.text('Counter: 1'), findsOneWidget);

    await tester.tap(find.text('Move to Second Screen'));
    await tester.pumpAndSettle();
    expect(find.text('WELCOME TO NAVIGATION SCREEN'), findsOneWidget);
  });
}
