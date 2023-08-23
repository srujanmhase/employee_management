import 'package:employee_management/core/home/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: '/',
      builder: (BuildContext context, state) => const HomePage(),
    ),
    // GoRoute(
    //   path: '/details',
    //   name: '/details',
    //   //builder: add/edit screen based on extra param
    // )
  ],
);
