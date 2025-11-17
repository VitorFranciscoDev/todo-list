import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/domain/usecases/auth_usecases.dart';
import 'package:to_do_list/infrastructure/presentation/auth/auth_state.dart';
import 'package:to_do_list/infrastructure/presentation/tasks/tasks_state.dart';
import 'package:to_do_list/infrastructure/presentation/widgets/app.dart';
import 'package:to_do_list/infrastructure/presentation/widgets/bottom-navigator/bottom_navigator_state.dart';
import 'package:to_do_list/infrastructure/repositories/sqlite_auth_repository.dart';

void main() {
  final SQLiteUserRepository authRepository = SQLiteUserRepository();
  final AuthUseCases authUseCases = AuthUseCases(repository: authRepository);
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavigatorProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider(useCases: authUseCases)),
        ChangeNotifierProvider(create: (_) => TasksProvider()),
      ],
      child: const MyApp(),
    ),
  );
}