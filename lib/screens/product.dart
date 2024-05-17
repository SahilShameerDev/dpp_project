import 'package:flutter/material.dart';
import '../widgets/navbar.dart';

// Page to show the product details
class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Product Page',
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
