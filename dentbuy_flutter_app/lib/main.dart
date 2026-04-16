import 'package:dentbuy_flutter_app/core/utils/theme.dart';
import 'package:dentbuy_flutter_app/feature/home/page/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lighttheme,
      home: const HomeScreen(),
    );
  }
}
