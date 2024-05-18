import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import './product.dart'; // Ensure this path is correct
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();

  Future<List<dynamic>>? _futureJsonData;


  Future<List<dynamic>> fetchData(String id) async {
    final response = await http.get(Uri.parse('https://dpp-sandbox.industryapps.net/aas/aasList/$id/aas/submodels'));

    if (response.statusCode == 200) {
      return  jsonDecode(response.body);
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Enter some text',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print(_textController.text);
                _textController.clear();
                setState(() {
                  _futureJsonData = fetchData("dXJuOmluZHVzdHJ5YXBwczppNDA6YWFzOjE6MTptYWNoaW5lI0dOSlU4LlBMQU5UQ1VDVU0uQlBERU1PX0Vycm9yX0NoZWNrMg%3D%3D");
                });

              },
              child: const Text('Print Text'),
            ),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: _futureJsonData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    final jsonData = snapshot.data!;
                    return ListView.builder(
                      itemCount: jsonData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle button press for this item
                            },
                            child: Text(jsonData[index]['idShort']),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:  const NavBar(),
    );
  }
}