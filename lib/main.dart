import 'package:flutter/material.dart';
import 'package:mocks/presentation/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF3EBACE),
        scaffoldBackgroundColor: const Color(0xFFF3F5F7), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFFD8ECF1)),
      ),
      home: const HomePage(),
    );
  }
}
