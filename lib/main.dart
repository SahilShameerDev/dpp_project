import 'package:flutter/material.dart';
// Import all necessary screens
import './screens/home.dart';
import './screens/user.dart'; // Assuming this is the correct path
import './screens/scanner.dart'; // Assuming this is the correct path

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DPP Wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
      // Use a named route for the home page
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/user': (context) => const UserPage(),
        '/scanner': (context) => const ScannerPage(),
      },
    );
  }
}
