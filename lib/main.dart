import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';


import 'home_screen.dart';
import 'login_page.dart';

void main() {
  setPathUrlStrategy(); // This is the key line
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
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
