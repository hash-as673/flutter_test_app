import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'home_screen.dart';
import 'login_page.dart'; // 1. Import the package


void main() {
  setPathUrlStrategy(); // 2. Call this function before runApp
  runApp(const MyApp());
}

// MyApp is the root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      // Define the initial route and the routing table for the app.
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

