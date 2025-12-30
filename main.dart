import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';

void main() {
  runApp(const ParfumApp());
}

class ParfumApp extends StatelessWidget {
  const ParfumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amanury Parfume',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomePage(), 
    );
  }
}
