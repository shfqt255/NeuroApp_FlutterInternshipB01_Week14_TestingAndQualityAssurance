import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:widget_tests_app/providers/provider.dart';
import 'package:widget_tests_app/screens/home_screen.dart';
import 'package:widget_tests_app/screens/nav_screen.dart';

void main() {
  testWidgets('Navigation test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CounterProvider(),
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    // verify home screen
    expect(find.byType(HomeScreen), findsOneWidget);

    // tap navigation button
    await tester.tap(find.text('Move to Second Screen'));

    // wait for animation
    await tester.pumpAndSettle();

    // verify navigation screen
    expect(find.byType(NavigationScreen), findsOneWidget);

    expect(find.text('WELCOME TO NAVIGATION SCREEN'), findsOneWidget);
  });
}
