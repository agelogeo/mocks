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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

// https://www.youtube.com/watch?v=1qybIXHdvVU
// https://www.youtube.com/watch?v=f42AvT6ZIu4
