import 'package:flutter/material.dart';
import 'package:knovator_task/screens/detail_screen.dart';
import 'package:knovator_task/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/detail': (context) => const DetailScreen(),
      },
      home: const HomeScreen(),
    );
  }
}
