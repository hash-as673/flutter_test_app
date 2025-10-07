import 'package:flutter/material.dart';

// A simple home screen to show after a successful login.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Extract the email argument passed from the LoginPage.
    final email = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false, // Removes the back button
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Successfully logged in!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            if (email != null)
              Text(
                'Welcome, $email',
                style: Theme.of(context).textTheme.titleLarge,
              ),
          ],
        ),
      ),
    );
  }
}
