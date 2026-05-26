import 'package:flutter/material.dart';
import 'package:widget_tests_app/widgets/custome_button.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigation Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('WELCOME TO NAVIGATION SCREEN'),
            const SizedBox(height: 20),
            CustomButton(
              title: 'Go Back',
              onpressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
