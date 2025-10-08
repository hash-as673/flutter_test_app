import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'home_screen.dart';
import 'login_page.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

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
      // Update the initial route and the routing table.
      initialRoute: '/', // <-- Change here
      routes: {
        '/': (context) => const LoginPage(),
        '/login': (context) => const LoginPage(), // <-- Change here
        '/home': (context) => const HomeScreen(),   // <-- Change here
      },
    );
  }
}