import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

@override
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.purple,
        child: Center(
          child: const Text(
            'Hello World !!',
          ),
        ),
      ),
    );
  }
}
