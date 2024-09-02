import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ruwad_rewatib/screens/home_page.dart';
import 'package:ruwad_rewatib/screens/login_page.dart';
import 'package:ruwad_rewatib/screens/signup_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpPage(),
    ),
    // GoRoute(
    //   path: '/admin',
    //   builder: (context, state) => const AdminHomePage(),
    // ),
    // GoRoute(
    //   path: '/events',
    //   builder: (context, state) => const EventsScreen(),
    // ),
  ],
);
