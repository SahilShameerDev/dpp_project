import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Grey Rectangle at the bottom of the screen
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 90, // Height of the rectangle
            width: double.infinity, // Full width
            color: Colors.grey, // Grey color
          ),
        ),
        // Grey Rectangle in BottomAppBar
        BottomAppBar(
          height: 120,
          elevation: 0.0,
          color: Colors.transparent,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/home',(route) => false);
                },
              ),
              const SizedBox(width: 56),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                 Navigator.pushNamedAndRemoveUntil(context, '/user',(route) => false);
                },
              ),
            ],
          ),
        ),
        // Adding a grey rectangle

        // Circular element positioned outside the BottomAppBar
        Positioned(
          bottom: 40,
          height: 80,
          width: 80,
          left:
              MediaQuery.of(context).size.width / 2 - 40, // Center horizontally
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/scanner',(route) => false);
            },
            backgroundColor: Colors.black, // Set the background color to black
            shape: const CircleBorder(),
            elevation: 0,
            child: const Icon(Icons.camera_alt, size: 36),
          ),
        ),
      ],
    );
  }
}
