import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:convert';
import '../widgets/navbar.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  String qrCodeResult = "Not Yet Scanned";
  String endpointUrl = "No Endpoint URL";

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
            Text("Endpoint URL: $endpointUrl"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String qrCode = await FlutterBarcodeScanner.scanBarcode(
                  '#ff6666', // Scanning line color
                  'Cancel', // Cancel button text
                  true, // Whether to show the flash icon
                  ScanMode.QR, // Scan mode
                );

                if (qrCode != '-1') {
                  String endpoint = getEndpointUrl(qrCode);
                  setState(() {
                    qrCodeResult = qrCode; // Update the scanned result
                    endpointUrl = endpoint; // Update the endpoint URL
                  });
                }
              },
              child: const Text('Start QR Code Scan'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }

  String getEndpointUrl(String originalUrl) {
    Uri uri = Uri.parse(originalUrl);
    String? idForUrl = uri.queryParameters['idForUrl'];

    if (idForUrl != null) {
      String base64EncodedIdForUrl = base64Url.encode(utf8.encode(idForUrl)).replaceAll('=', '%3D');
      return base64EncodedIdForUrl;
    } else {
      return 'Invalid URL';
    }
  }
}
