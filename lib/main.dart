import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/infrastructure/presentation/auth/auth_state.dart';
import 'package:to_do_list/infrastructure/presentation/tasks/tasks_state.dart';
import 'package:to_do_list/infrastructure/presentation/widgets/app.dart';
import 'package:to_do_list/infrastructure/presentation/widgets/bottom-navigator/bottom_navigator_state.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavigatorProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => TasksProvider()),
      ],
      child: const MyApp(),
    ),
  );
}