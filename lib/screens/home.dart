import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import './product.dart'; // Ensure this path is correct

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          children: [
            const Text('Home Page',
                style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    color: Colors.red)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const ProductPage()), (route) => false);
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: const Text('Product details'),
            ),
          ],
        ),
      ),
      bottomNavigationBar:  const NavBar(),
    );
  }
}
