import 'package:employee_management/core/edit/cubit/edit_cubit.dart';
import 'package:employee_management/core/edit/view/edit_view.dart';
import 'package:employee_management/core/home/home.dart';
import 'package:employee_management/models/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: HomePage.path,
      name: HomePage.path,
      builder: (BuildContext context, state) => const HomePage(),
    ),
    GoRoute(
      path: EditPage.path,
      name: EditPage.path,
      builder: (context, state) {
        final employee = state.extra as Employee?;
        return BlocProvider(
          create: (context) => EditCubit(),
          child: EditPage(employee: employee),
        );
      },
    )
  ],
);
