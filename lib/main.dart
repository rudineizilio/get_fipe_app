import 'package:flutter/material.dart';
import 'package:get_fipe_app/src/features/fipe/state/fipe_provider.dart';
import 'package:get_fipe_app/src/features/login/pages/login_page.dart';
import 'package:get_fipe_app/src/features/login/state/login_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
          Provider<LoginProvider>(
            create: (_) => LoginProvider(),
          ),
          Provider<FipeProvider>(
            create: (_) => FipeProvider(),
          ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Fipe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}