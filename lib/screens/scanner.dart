import 'package:flutter/material.dart';
import '../widgets/navbar.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Scanner Page',
              style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  color: Colors.red)),
        ],
      ),
    ),
    bottomNavigationBar: NavBar());
  }
}
