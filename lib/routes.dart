import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ruwad_rewatib/screens/home_page.dart';
import 'package:ruwad_rewatib/screens/login_page.dart';
import 'package:ruwad_rewatib/screens/signup_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignUpPage(),
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
