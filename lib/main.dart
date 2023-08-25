import 'package:employee_management/cubit/app_cubit.dart';
import 'package:employee_management/services/database/local_database_adapter.dart';
import 'package:employee_management/services/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(LocalDatabaseAdapter()),
      child: MaterialApp.router(
        title: 'Employee Management',
        theme: ThemeData(
          useMaterial3: false,
        ),
        routerConfig: routes,
      ),
    );
  }
}
