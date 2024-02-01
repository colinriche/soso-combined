import 'package:fire_parking_companion2/picker/widgets/place_picker.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      home: Directionality(
        textDirection: TextDirection.ltr, // or TextDirection.rtl
        child: picker(),
      ),
    );
  }
}

class picker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main App Screen'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlacePicker("Your_API_Key_Here"),
                  ),
                );
              },
              child: const Text('Go to Pick Your location'),
            ),
          ),
        ],
      ),
    );
  }
}
