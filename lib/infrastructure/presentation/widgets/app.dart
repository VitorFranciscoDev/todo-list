import 'package:flutter/material.dart';
import 'package:to_do_list/infrastructure/presentation/auth/login_screen.dart';
import 'package:to_do_list/infrastructure/presentation/widgets/bottom-navigator/bottom_navigator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigator(),
    );
  }
}