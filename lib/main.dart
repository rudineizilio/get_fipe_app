import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_pos_flutter/src/features/fipe/state/fipe_provider.dart';
import 'package:trabalho_pos_flutter/src/features/login/pages/login_page.dart';
import 'package:trabalho_pos_flutter/src/features/login/state/login_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
          child: const LoginPage(),
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
      title: 'Trabalho Pós',
      theme: ThemeData(      
        primaryColor: Colors.green,
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          labelStyle: TextStyle(color: Colors.green),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 24,
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.green,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}