import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_tests_app/providers/provider.dart';
import 'package:widget_tests_app/screens/nav_screen.dart';
import 'package:widget_tests_app/widgets/custome_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CounterProvider>();

    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formkey,
              child: TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Enter Your Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 20),

            Text('Counter: ${provider.counter}'),
            const SizedBox(height: 20),
            CustomButton(
              title: 'Increment',
              onpressed: provider.incrementCounter,
            ),
            const SizedBox(height: 20),
            CustomButton(
              title: 'Validate',
              onpressed: () {
                formkey.currentState!.validate();
              },
            ),

            const SizedBox(height: 20),
            CustomButton(
              title: 'Move to Second Screen',
              onpressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NavigationScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
