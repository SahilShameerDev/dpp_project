import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../widgets/navbar.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  String qrCodeResult = "Not Yet Scanned";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Scanner Page',
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic, color: Colors.red),
            ),
            const SizedBox(height: 20),
            Text("Scanned Result: $qrCodeResult"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String qrCode = await FlutterBarcodeScanner.scanBarcode(
                  '#ff6666', // Scanning line color
                  'Cancel', // Cancel button text
                  true, // Whether to show the flash icon
                  ScanMode.QR, // Scan mode
                );

                setState(() {
                  qrCodeResult = qrCode; // Update the scanned result
                });
              },
              child: const Text('Start QR Code Scan'),
            ),
          ],
        ),
      ),
      bottomNavigationBar:  const NavBar(),
    );
  }
}
