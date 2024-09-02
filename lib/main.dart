import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruwad_rewatib/providers/theme_provider.dart';
import 'package:ruwad_rewatib/routes.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MurabiApp(),
  ));
}

class MurabiApp extends StatelessWidget {
  const MurabiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
